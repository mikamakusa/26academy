project = "26a"

ssh_keys = [
  {
    name = "rancher"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfiiDMkCMa5cCeEzAR4ZCLD9Qcp98furSWnzZx/ifR0PSY2DQ4Pz8TAVxnyECxAc7k99KHzscvYECWn865WZ6d2022SAmczWc5jYI1d7IymO1Kprhs5Pkx3WQf1+Km8JY1QgbFCbKgNDEZ7D+eioO8YEG1xU5ynabQQJNC+rRTFj0Y32kK04Y2ohd6ejGs//FjU6pbOObHASEfl7S57jVI8dvI9bPI3SzLxBf/NUxs5FSkeJbn+M27Qd5jg5TJs/sqdtcdj1s3PysW8ynxXT20S0gC0KdngMeINJLotH6ruaPc8hUgi1FYaLz/8OxNJYEcPStFs4FoSm7R9ib9tRkH root@mylinux"
  },
]

droplets = [
  {
    image = "rancher"
    name = "centos-7-x64"
    region = "ams2"
    size = "s-4vcpu-8gb"
    backups = "false"
    monitoring = "false"
    ipv6 = "false"
    private_networking = "false"
    ssh_key_id = "0"
  },
  {
    image = "rancher"
    name = "centos-7-x64"
    region = "ams2"
    size = "s-4vcpu-8gb"
    backups = "false"
    monitoring = "false"
    ipv6 = "false"
    private_networking = "false"
    ssh_key_id = "1"
  },
  {
    image = "rancher"
    name = "centos-7-x64"
    region = "ams2"
    size = "s-4vcpu-8gb"
    backups = "false"
    monitoring = "false"
    ipv6 = "false"
    private_networking = "false"
    ssh_key_id = "2"
  },
]