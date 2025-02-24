provider "azurerm" {
  features {}

  subscription_id = data.hcp_vault_secrets_app.lab.secrets["azure_subscription_id"]
  client_id       = data.hcp_vault_secrets_app.lab.secrets["azure_client_id"]
  client_secret   = data.hcp_vault_secrets_app.lab.secrets["azure_client_secret"]
  tenant_id       = data.hcp_vault_secrets_app.lab.secrets["azure_tenant_id"]
}
