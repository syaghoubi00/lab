variable "libvirt_uri" {
  ## Using tf from container: use no verify and specify container path of keyfile
  # uri = "qemu+ssh://libvirt@remote/system?keyfile=/data/id_ed25519&no_verify=1"

  type        = string
  description = <<-EOT
  URI to connect to libvirt daemeon (driver[+transport]://[username@][hostname][:port]/[path][?extraparameters])
  - ex. qemu+ssh://libvirt@remotehost/system?keyfile=/home/user/.ssh/id_ed25519
  EOT

  nullable = false
  ## Default to localhost?
  # default = "qemu:///session"

  validation {
    # TODO: Improve input validation
    condition     = var.libvirt_uri != ""
    error_message = "Invalid URI"
  }
}

provider "libvirt" {
  uri = var.libvirt_uri
}

output "libvirt_uri" {
  value       = var.libvirt_uri
  description = "URI used to connect to libvirt"
}

