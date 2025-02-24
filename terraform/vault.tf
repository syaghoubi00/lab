locals {
  hcp_vault_secrets_app = "lab"
}

data "hcp_vault_secrets_app" "lab" {
  app_name = local.hcp_vault_secrets_app
}
