resource "digitalocean_project" "default" {
  name        = "default"
  description = "Default Project"
  is_default  = true
}

resource "digitalocean_project" "dev_lab" {
  name        = "dev_lab"
  description = "Lab Development"
  environment = "Development"
}

resource "digitalocean_project" "prod_lab" {
  name        = "prod_lab"
  description = "Lab Production"
  environment = "Production"
}
