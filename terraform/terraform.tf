terraform {
  required_version = "~> 1.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.0"
    }
  }
}
