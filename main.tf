terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.19"
}

module "droplet" {
  source    = "./droplet"
  image     = var.docker-ubuntu
  region    = var.do_ams3
  size      = var.price_10_dollars
  user_data = var.user_data
  name      = "ubuntu-docker"
}

module "dns" {
  source     = "./dns"
  domain     = var.domain
  subdomains = var.subdomains
  ipv4       = module.droplet.public_ipv4
  ipv6       = module.droplet.public_ipv6
}

module "firewall" {
  source     = "./firewall"
  droplet_id = module.droplet.droplet_id
  ssh_port   = var.ssh_port
}

output "ip" {
  value = module.droplet.public_ipv4
}
