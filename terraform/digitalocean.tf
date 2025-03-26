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
  # user_data = templatefile("./cloud-init-templates/ansible/user-data.tftpl", {
  #   ssh_authorized_keys = [var.ssh_public_key],
  # })
  droplet_agent     = false
  graceful_shutdown = true
}

resource "ansible_playbook" "docker_setup" {
  name     = digitalocean_droplet.docker.ipv4_address
  playbook = "./playbooks/docker_setup.yaml"

  replayable = false

  # Wait for the droplet to be fully provisioned
  depends_on = [digitalocean_droplet.docker]

  # Extra variables to pass to the playbook
  extra_vars = {
    ansible_host                 = digitalocean_droplet.docker.ipv4_address
    ansible_user                 = "root"
    ansible_ssh_private_key_file = local_sensitive_file.ssh_private_key.filename

    docker_rootless_mode  = true
    docker_ssh_public_key = data.hcp_vault_secrets_app.lab.secrets["ssh_public_key"]
  }
}

output "ansible_docker_setup" {
  value = ansible_playbook.docker_setup.ansible_playbook_stdout
}
