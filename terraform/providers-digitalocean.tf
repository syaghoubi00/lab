provider "digitalocean" {
  token = data.hcp_vault_secrets_app.lab.secrets["digitalocean_token"]
}
