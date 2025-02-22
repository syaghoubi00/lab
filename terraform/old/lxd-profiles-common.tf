resource "lxd_profile" "common" {
  name        = "common"
  description = "Base profile used across instances"

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = lxd_storage_pool.lxd.name
    }
  }
}

