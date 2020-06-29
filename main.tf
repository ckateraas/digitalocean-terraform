terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.19"
}

module "rancheros" {
  source = "./droplet"
  image  = var.rancheros
  region = var.do_ams3
  size   = var.price_10_dollars
  name   = "rancheros-test"
}

module "dns" {
  source     = "./dns"
  domain     = var.domain
  subdomains = var.subdomains
  ipv4       = module.rancheros.public_ipv4
  ipv6       = module.rancheros.public_ipv6
}

module "firewall" {
  source     = "./firewall"
  droplet_id = module.rancheros.droplet_id
}

output "ip" {
  value = module.rancheros.public_ipv4
}
