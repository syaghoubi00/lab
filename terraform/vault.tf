locals {
  hcp_vault_secrets_app = "lab"

  # NOTE: Write the file to /tmp, which will hopefully be ephemeral
  # NOTE: Writing to the module directory may be persisted
  # ssh_private_key_path = "${path.module}/ssh"
  ssh_private_key_path = "/tmp/TF-ssh_private_key"
}

data "hcp_vault_secrets_app" "lab" {
  app_name = local.hcp_vault_secrets_app
}

# Ansible requires the SSH private key to be a file.
# Use the `local_file` resource to write the priv_key to a file
resource "local_sensitive_file" "ssh_private_key" {
  content         = data.hcp_vault_secrets_app.lab.secrets["ssh_private_key"]
  filename        = local.ssh_private_key_path
  file_permission = "0600"
}
