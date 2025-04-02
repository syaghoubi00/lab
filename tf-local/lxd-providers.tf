variable "lxd_remotes" {
  type = map(object({
    name    = string
    scheme  = string
    address = string
    token   = string
    default = bool
  }))
  description = "LXD Remote connections"
  default     = {}
}

provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true

  dynamic "remote" {
    for_each = var.lxd_remotes
    content {
      name    = remote.value.name
      scheme  = remote.value.scheme
      address = remote.value.address
      token   = remote.value.token
      default = remote.value.default
    }
  }
}
