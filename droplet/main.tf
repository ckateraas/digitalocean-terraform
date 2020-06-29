resource "digitalocean_droplet" "server" {
  # ssh_key id number documentation: https://developers.digitalocean.com/documentation/v2/#list-all-keys
  ssh_keys           = [22131226]
  image              = var.image
  region             = var.region
  size               = var.size
  private_networking = true
  backups            = false
  monitoring         = true
  ipv6               = true
  name               = var.name
  user_data          = var.user_data
}
