variable "lxd_zfs_parent_dataset_path" {
  type        = string
  description = "Path to ZFS dataset to store VM data"

}

resource "lxd_storage_pool" "lxd" {
  name        = "lxd"
  driver      = "zfs"
  source      = var.lxd_zfs_parent_dataset_path
  description = "ZFS dataset for VM data"
}
