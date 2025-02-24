variable "hcp_client_id" {
  type        = string
  description = "HCP Client ID"
  default     = null
}

variable "hcp_client_secret" {
  type        = string
  description = "HCP Client Secret"
  sensitive   = true
  default     = null
}

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
}
