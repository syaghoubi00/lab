variable "cloudinit_ssh_authorized_keys" {
  type        = list(string)
  description = "SSH public keys to add via cloudinit"
}
