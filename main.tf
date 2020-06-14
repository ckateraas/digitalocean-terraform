terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.19"
}

module "droplet" {
  source = "./droplet"
  image  = var.ubuntu
  region = var.do_ams3
  size   = var.price_10_dollars
  name   = var.droplet_name
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
}

output "ip" {
  value = module.droplet.public_ipv4
}
