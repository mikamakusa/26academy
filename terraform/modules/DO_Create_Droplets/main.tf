resource "digitalocean_ssh_key" "do_ssh_key" {
  name       = "${var.project}-${lookup(var.ssh_key[count.index],"name")}"
  public_key = "${lookup(var.ssh_key[count.index],"public_key")}"
}

resource "digitalocean_tag" "do_tag" {
  name = "${var.tag}"
}

resource "digitalocean_droplet" "do_droplet" {
  count              = "${length(var.droplet)}"
  image              = "${lookup(var.droplet[count.index],"image")}"
  name               = "${var.project}-${lookup(var.droplet[count.index],"name")}-${count.index}"
  region             = "${lookup(var.droplet[count.index],"region")}"
  size               = "${lookup(var.droplet[count.index],"size")}"
  backups            = "${lookup(var.droplet[count.index],"backups")}"
  monitoring         = "${lookup(var.droplet[count.index],"monitoring")}"
  ipv6               = "${lookup(var.droplet[count.index],"ipv6")}"
  private_networking = "${lookup(var.droplet[count.index],"private_networking")}"
  ssh_keys           = ["${digitalocean_ssh_key.do_ssh_key.fingerprint}"]
  tags               = ["${digitalocean_tag.do_tag.id}"]
}
