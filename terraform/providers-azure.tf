variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = null # Allows fallback to environment variable
}

variable "client_id" {
  type        = string
  description = "Azure Client ID (Service Principal)"
  default     = null
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  default     = null
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret (Service Principal)"
  sensitive   = true
  default     = null
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
