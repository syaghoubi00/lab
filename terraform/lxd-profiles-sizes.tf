## Based on AWS ec2 GP-compute instance sizes
## (https://aws.amazon.com/ec2/instance-types/)

resource "lxd_profile" "nano" {
  name        = "nano"
  description = "1 vcpu, 512MiB memory"

  config = {
    "limits.cpu"    = 1
    "limits.memory" = "512MiB"
  }
}

resource "lxd_profile" "micro" {
  name        = "micro"
  description = "1 vcpu, 1GiB memory"

  config = {
    "limits.cpu"    = 1
    "limits.memory" = "1GiB"
  }
}

resource "lxd_profile" "small" {
  name        = "small"
  description = "1 vcpu, 2GiB memory"

  config = {
    "limits.cpu"    = 1
    "limits.memory" = "2GiB"
  }
}

resource "lxd_profile" "medium" {
  name        = "medium"
  description = "2 vcpu, 4GiB memory"

  config = {
    "limits.cpu"    = 2
    "limits.memory" = "4GiB"
  }
}

resource "lxd_profile" "large" {
  name        = "large"
  description = "2 vcpu, 8GiB memory"

  config = {
    "limits.cpu"    = 2
    "limits.memory" = "8GiB"
  }
}

resource "lxd_profile" "xlarge" {
  name        = "1xlarge"
  description = "4 vcpu, 16GiB memory"

  config = {
    "limits.cpu"    = 4
    "limits.memory" = "16GiB"
  }
}

resource "lxd_profile" "two-xlarge" {
  name        = "2xlarge"
  description = "8 vcpu, 32GiB memory"

  config = {
    "limits.cpu"    = 8
    "limits.memory" = "32GiB"
  }
}

resource "lxd_profile" "four-xlarge" {
  name        = "4xlarge"
  description = "16 vcpu, 64GiB memory"

  config = {
    "limits.cpu"    = 16
    "limits.memory" = "64GiB"
  }
}

resource "lxd_profile" "eight-xlarge" {
  name        = "8xlarge"
  description = "32 vcpu, 128GiB memory"

  config = {
    "limits.cpu"    = 32
    "limits.memory" = "128GiB"
  }
}

resource "lxd_profile" "twelve-xlarge" {
  name        = "12xlarge"
  description = "48 vcpu, 196GiB memory"

  config = {
    "limits.cpu"    = 48
    "limits.memory" = "196GiB"
  }
}

resource "lxd_profile" "sixteen-xlarge" {
  name        = "16xlarge"
  description = "64 vcpu, 256GiB memory"

  config = {
    "limits.cpu"    = 64
    "limits.memory" = "256GiB"
  }
}
