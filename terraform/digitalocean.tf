resource "digitalocean_tag" "docker" {
  name = "docker"
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
  tags                     = [digitalocean_tag.docker.id]
}

resource "digitalocean_droplet" "docker" {
  image       = "ubuntu-24-04-x64"
  name        = "docker"
  region      = "sfo3"
  size        = "s-1vcpu-1gb-amd"
  backups     = false # Disable backups, as the droplet itself is mostly ephemeral.
  monitoring  = true
  ipv6        = true
  ssh_keys    = [digitalocean_ssh_key.default.fingerprint]
  resize_disk = false
  tags        = [digitalocean_tag.docker.id]
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

resource "digitalocean_reserved_ip" "docker" {
  droplet_id = digitalocean_droplet.docker.id
  region     = digitalocean_droplet.docker.region
}

output "do_docker_ip" {
  description = "The IP address of the Docker droplet"
  value       = digitalocean_reserved_ip.docker.ip_address
}

resource "ansible_host" "do_docker" {
  name   = digitalocean_reserved_ip.docker.ip_address
  groups = ["docker", "harden"]

  variables = {
    ansible_user                 = "ansible"
    ansible_ssh_private_key_file = local_sensitive_file.ssh_private_key.filename

    docker_rootless_mode  = true
    docker_ssh_public_key = data.hcp_vault_secrets_app.lab.secrets["ssh_public_key"]
  }
}

# NOTE: Add account data to use email address for alerts.
data "digitalocean_account" "account" {
}

# NOTE: Get all droplets with monitoring enabled.
data "digitalocean_droplets" "monitored" {
  filter {
    key    = "monitoring"
    values = ["true"]
  }
}

resource "digitalocean_monitor_alert" "cpu_alert" {
  alerts {
    email = [data.digitalocean_account.account.email]
  }
  window      = "10m"
  type        = "v1/insights/droplet/load_15"
  compare     = "GreaterThan"
  value       = 90
  enabled     = true
  entities    = data.digitalocean_droplets.monitored.droplets[*].id # All droplets with monitoring enabled
  description = "Alert about CPU usage when above 90% for 10 minutes"
}

# NOTE: The disk utilization includes percentage used including attached volumes.
# This means the droplets root drive or attached volumes can be full but not trigger the alert
# if the usage is still below 75% of the total disk space.
# Reference: https://docs.digitalocean.com/products/monitoring/concepts/metrics/#disk-usage
resource "digitalocean_monitor_alert" "disk_alert" {
  alerts {
    email = [data.digitalocean_account.account.email]
  }
  window      = "5m"
  type        = "v1/insights/droplet/disk_utilization_percent"
  compare     = "GreaterThan"
  value       = 75
  enabled     = true
  entities    = data.digitalocean_droplets.monitored.droplets[*].id # All droplets with monitoring enabled
  description = "Alert about disk usage when above 75% for 5 minutes"
}

resource "digitalocean_monitor_alert" "memory_alert" {
  alerts {
    email = [data.digitalocean_account.account.email]
  }
  window      = "10m"
  type        = "v1/insights/droplet/memory_utilization_percent"
  compare     = "GreaterThan"
  value       = 75
  enabled     = true
  entities    = data.digitalocean_droplets.monitored.droplets[*].id # All droplets with monitoring enabled
  description = "Alert about memory usage when above 75% for 10 minutes"
}
