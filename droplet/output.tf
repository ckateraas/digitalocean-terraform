output "public_ipv4" {
  value = digitalocean_droplet.server.ipv4_address
}

output "public_ipv6" {
  value = digitalocean_droplet.server.ipv6_address
}

output "droplet_id" {
  value = digitalocean_droplet.server.id
}
