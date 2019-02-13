provider "digitalocean" {
#  token = "${var.do_token}"
}

module "DO_droplets" {
  source  = "../modules/DO_Create_Droplets"
  droplet = "${var.droplets}"
  project = "${var.project}"
  ssh_key = "${var.ssh_keys}"
  tag     = "${var.tag}"
}
