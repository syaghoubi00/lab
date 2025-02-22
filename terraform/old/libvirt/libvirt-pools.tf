variable "libvirt_iso_pool_dir" {
  type        = string
  description = "Path (relative to libvirt host) to store isos."
  default     = "/var/lib/libvirt/terraform/isos"
}

variable "libvirt_remote_iso_pool_dir" {
  type        = string
  description = "Path (relative to libvirt host) to store remote isos."
  default     = "/var/lib/libvirt/terraform/remote-isos"
}

variable "libvirt_image_pool_dir" {
  type        = string
  description = "Path (relative to libvirt host) to store VM images."
  default     = "/var/lib/libvirt/terraform/images"
}

variable "libvirt_cloud_init_pool_dir" {
  type        = string
  description = "Path (relative to libvirt host) to store cloud-init vdisks"
  default     = "/var/lib/libvirt/terraform/cloud-init"
}

resource "libvirt_pool" "isos" {
  name = "${terraform.workspace}-isos"
  type = "dir"
  path = var.libvirt_iso_pool_dir
}

resource "libvirt_pool" "remote_isos" {
  name = "${terraform.workspace}-remote-isos"
  type = "dir"
  path = var.libvirt_remote_iso_pool_dir
}

resource "libvirt_pool" "images" {
  name = "${terraform.workspace}-images"
  type = "dir"
  path = var.libvirt_image_pool_dir
}

resource "libvirt_pool" "cloud_init" {
  name = "${terraform.workspace}-cloud-init"
  type = "dir"
  path = var.libvirt_cloud_init_pool_dir
}
