variable "libvirt_generic_ssh_authorized_keys" {
  type        = list(string)
  description = "SSH Key(s) to use to access libvirt virtual machines"
}

variable "libvirt_generic_vm_count" {
  type        = number
  description = "How many generic virtual machines to create (libvirt)"
}

locals {
  name                = "generic-vm"
  cloud_init_username = local.name
  chipset             = null
  cpu_mode            = "host-passthrough"
  distro              = "ubuntu-2404"
  disk_size           = 10 * pow(1024, 3) # disk size in bytes (conversion 1024^3 = GiB)
  memory              = 8 * pow(1024, 1)  # disk size in MiB
  vcpu                = 4

  network_interfaces = {
    iface-1 = {
      macvtap = "eno1"
    }
  }

}

resource "libvirt_cloudinit_disk" "generic_cloud_init" {
  count = var.libvirt_generic_vm_count

  name = format("%s-%s-%s-cloud-init.qcow2", terraform.workspace, local.name, count.index)
  pool = libvirt_pool.cloud_init.name
  user_data = templatefile("${path.module}/cloud-init/generic-user-data.tftpl", {
    cloud_init_user     = local.cloud_init_username,
    ssh_authorized_keys = var.libvirt_generic_ssh_authorized_keys,
    hostname            = format("%s-%s-%s", terraform.workspace, local.name, count.index)
  })

  depends_on = [libvirt_pool.cloud_init]
}

resource "libvirt_volume" "generic_volumes" {
  count = var.libvirt_generic_vm_count

  name             = format("%s-%s-%s-data.qcow2", terraform.workspace, local.name, count.index)
  pool             = libvirt_pool.images.name
  size             = local.disk_size
  format           = "qcow2"
  base_volume_id   = libvirt_volume.remote_iso[local.distro].id
  base_volume_pool = libvirt_pool.remote_isos.name

  depends_on = [libvirt_pool.isos, libvirt_pool.images, libvirt_pool.remote_isos]
}

resource "libvirt_domain" "generic_machines" {
  count = var.libvirt_generic_vm_count

  name      = format("%s-%s-%s", terraform.workspace, local.name, count.index)
  memory    = local.memory
  vcpu      = local.vcpu
  cloudinit = libvirt_cloudinit_disk.generic_cloud_init[count.index].id

  dynamic "network_interface" {
    for_each = local.network_interfaces
    iterator = item

    content {
      macvtap = item.value.macvtap
    }
  }

  cpu {
    mode = local.cpu_mode
  }

  disk {
    volume_id = libvirt_volume.generic_volumes[count.index].id
  }

  xml {
    xslt = try(local.chipset, null) == "q35" ? file("${path.module}/libvirt-xml/cdrom-sata.xml") : null
  }
}

