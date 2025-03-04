provider "cloudflare" {
  api_token = data.hcp_vault_secrets_app.lab.secrets["cloudflare_token"]
}
