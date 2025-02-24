locals {
  cluster_name        = "lab-k8s-cluster"
  resource_group_name = "lab-k8s"
  location            = "westus2"
  node_count          = 2
  node_size           = "Standard_D2_v2"
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = local.location

  tags = {
    Environment = "Lab"
  }
}

resource "azurerm_kubernetes_cluster" "lab_cluster" {
  name                = local.cluster_name
  dns_prefix          = local.cluster_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  http_application_routing_enabled = true

  default_node_pool {
    name       = "default"
    node_count = local.node_count
    vm_size    = local.node_size

    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }
}
