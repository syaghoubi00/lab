resource "lxd_project" "prod" {
  name        = "tf.prod"
  description = "Production Project Managed by Terraform"
  config      = {}
}

resource "lxd_project" "staging" {
  name        = "tf.staging"
  description = "Staging Project Managed by Terraform"
  config      = {}
}

resource "lxd_project" "devel" {
  name        = "tf.devel"
  description = "Development Project Managed by Terraform"
  config      = {}
}
