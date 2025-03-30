resource "digitalocean_project" "dev_lab" {
  name        = "dev_lab"
  description = "Lab Development"
  environment = "Development"
}

resource "digitalocean_project" "prod_lab" {
  name        = "prod_lab"
  description = "Lab Production"
  environment = "Production"
}

resource "digitalocean_ssh_key" "default" {
  name       = "TF"
  public_key = data.hcp_vault_secrets_app.lab.secrets["ssh_public_key"]
}

resource "digitalocean_droplet" "docker" {
  image       = "ubuntu-24-04-x64"
  name        = "docker"
  region      = "sfo2"
  size        = "s-1vcpu-1gb"
  backups     = true
  monitoring  = true
  ipv6        = true
  ssh_keys    = [digitalocean_ssh_key.default.fingerprint]
  resize_disk = false
  tags        = ["lab", "docker"]
  user_data = templatefile("./cloud-init-templates/ansible/user-data.tftpl", {
    ssh_authorized_keys = [data.hcp_vault_secrets_app.lab.secrets["ssh_public_key"]]
  })
  droplet_agent     = false
  graceful_shutdown = true
}

output "do_docker_ip" {
  description = "The IP address of the Docker droplet"
  value       = digitalocean_droplet.docker.ipv4_address
}

resource "ansible_host" "do_docker" {
  name   = digitalocean_droplet.docker.ipv4_address
  groups = ["docker", "harden"]

  variables = {
    ansible_user                 = "ansible"
    ansible_ssh_private_key_file = local_sensitive_file.ssh_private_key.filename

    docker_rootless_mode  = true
    docker_ssh_public_key = data.hcp_vault_secrets_app.lab.secrets["ssh_public_key"]
  }
}
