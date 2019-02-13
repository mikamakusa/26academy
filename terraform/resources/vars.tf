#variable "do_token" {}

variable "project" {}

variable "droplets" {
  type = "list"
}

variable "ssh_keys" {
  type = "list"
}

variable "tag" {}