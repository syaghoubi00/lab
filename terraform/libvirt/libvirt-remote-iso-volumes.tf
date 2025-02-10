variable "remote_images" {
  type    = map(string)
  default = null
}
resource "libvirt_volume" "remote_iso" {
  for_each = var.remote_images

  name   = format("%s-%s-iso.qcow2", terraform.workspace, each.key)
  source = each.value
  pool   = libvirt_pool.remote_isos.name
  format = "qcow2"

  depends_on = [libvirt_pool.remote_isos, libvirt_pool.images]

  # lifecycle {
  #   # Don't delete base isos, triggering a re-downloading
  #   prevent_destroy = true
  # }
}
