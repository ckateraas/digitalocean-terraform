resource "digitalocean_domain" "domain" {
  name = var.domain
}

resource "digitalocean_record" "AAAA-records" {
  domain   = digitalocean_domain.domain.name
  for_each = var.subdomains
  name     = each.key
  value    = var.ipv6
  type     = "AAAA"
}

resource "digitalocean_record" "A-records" {
  domain   = digitalocean_domain.domain.name
  for_each = var.subdomains
  name     = each.key
  value    = var.ipv4
  type     = "A"
}
