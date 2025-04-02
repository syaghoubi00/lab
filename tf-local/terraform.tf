terraform {
  required_version = "~> 1.7"

  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~>1.3"
    }
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~>0.7"
    }
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "=2.2.0"
      # version = "~>2.2"
    }
    time = {
      source  = "hashicorp/time"
      version = "~>0.12"
    }
  }
}
