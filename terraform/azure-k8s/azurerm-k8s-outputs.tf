resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.lab_cluster]
  filename   = "kubeconfig/azurerm_lab"
  content    = azurerm_kubernetes_cluster.lab_cluster.kube_config_raw

  directory_permission = "0644"
  file_permission      = "0644"
}
