variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = null # Will fall back to ARM_SUBSCRIPTION_ID
}

variable "client_id" {
  type        = string
  description = "Azure Client ID (Service Principal)"
  default     = null # Will fall back to ARM_CLIENT_ID
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  default     = null # Will fall back to ARM_TENANT_ID
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret (Service Principal)"
  sensitive   = true
  default     = null # Will fall back to ARM_CLIENT_SECRET
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
