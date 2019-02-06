output "droplet_id" {
  value = "${digitalocean_droplet.do_droplet.*.id}"
}

output "droplet_name" {
  value = "${digitalocean_droplet.do_droplet.*.name}"
}

output "droplet_region" {
  value = "${digitalocean_droplet.do_droplet.*.region}"
}

output "droplet_image" {
  value = "${digitalocean_droplet.do_droplet.*.image}"
}

output "droplet_size" {
  value = "${digitalocean_droplet.do_droplet.*.size}"
}