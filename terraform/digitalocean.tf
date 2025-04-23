resource "digitalocean_project" "dev_lab" {
  name        = "dev_lab"
  description = "Lab Development"
  environment = "Development"
  resources   = [digitalocean_droplet.docker.urn, digitalocean_volume.docker.urn]
}

resource "digitalocean_project" "prod_lab" {
  name        = "prod_lab"
  description = "Lab Production"
  environment = "Production"
  resources   = []
}

resource "digitalocean_ssh_key" "default" {
  name       = "TF"
  public_key = data.hcp_vault_secrets_app.lab.secrets["ssh_public_key"]
}

resource "digitalocean_volume" "docker" {
  # NOTE: Create the volume in the same region as the droplet.
  region = digitalocean_droplet.docker.region
  name   = "docker"
  size   = 25
  # NOTE: Preformat volume with ext4 filesystem, as it generally has the best performance with Docker.
  initial_filesystem_type  = "ext4"
  initial_filesystem_label = "docker"
  description              = "Docker volume"
  tags                     = ["docker"]
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
  # NOTE: Using volume_ids does not automatically mount the volume.
  # volume_ids        = [digitalocean_volume.docker.id]
}

# NOTE: The volume gets automatically mounted to /mnt/docker.
resource "digitalocean_volume_attachment" "docker" {
  droplet_id = digitalocean_droplet.docker.id
  volume_id  = digitalocean_volume.docker.id
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
