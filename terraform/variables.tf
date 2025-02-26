variable "ssh_public_key" {
  description = "The public key to be added to the remote servers"
  type        = string
}

variable "ssh_private_key_path" {
  description = "The path to the private key to be used to access the remote servers"
  type        = string
  sensitive   = true
}
