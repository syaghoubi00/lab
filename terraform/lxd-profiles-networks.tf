resource "lxd_profile" "macvlan" {
  name        = "macvlan"
  description = "Macvlan network profile"
  device {
    name = "eth0"
    type = "nic"
    properties = {
      name    = "eth0"
      nictype = "macvlan"
      parent  = "eno2"
    }
  }
}

resource "lxd_profile" "bridge" {
  name        = "bridge"
  description = "Bridge network profile"

  device {
    name = "eth0"
    type = "nic"
    properties = {
      name    = "eth0"
      nictype = "bridged"
      parent  = "br0"
    }
  }
}

resource "lxd_profile" "NAT" {
  name        = "NAT"
  description = "NAT network profile"

  device {
    name = "eth0"
    type = "nic"
    properties = {
      name    = "eth0"
      network = "lxdbr0"
    }
  }
}
