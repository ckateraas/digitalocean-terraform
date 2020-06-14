resource "digitalocean_firewall" "web" {
  name = "dns-ssh-http-and-https"

  droplet_ids = [var.droplet_id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "53"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "53"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol   = "tcp"
    port_range = "all"

    destination_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  outbound_rule {
    protocol   = "udp"
    port_range = "53" # For outbound DNS

    destination_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

}
