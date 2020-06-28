variable "do_token" {}

variable "domain" {
  type        = string
  description = "The domain to setup DNS records for to the new droplet"
  default     = "foojo.no"
}

variable "subdomains" {
  type        = set(string)
  description = "The subdomains to setup DNS records for to the new droplet"
  default     = ["@", "stats", "ruter", "monitoring", "dns"]
}

variable "droplet_name" {
  description = "Name of the new droplet on Digital Ocean"
  default     = "foojo"
}

# Digital Ocean regions

variable "do_ams2" {
  description = "Digital Ocean Amsterdam Data Center 2"
  default     = "ams2"
}

variable "do_ams3" {
  description = "Digital Ocean Amsterdam Data Center 3"
  default     = "ams3"
}

variable "do_fra1" {
  description = "Digital Ocean Frankfurt Data Center 1"
  default     = "fra1"
}

variable "do_lon1" {
  description = "Digital Ocean London Data Center 1"
  default     = "lon1"
}

# Digital Ocean OSes

variable "ubuntu" {
  description = "Default LTS"
  default     = "ubuntu-18-04-x64"
}

variable "rancheros" {
  description = "RancherOS"
  default     = "rancheros"
}

# Digital Ocean droplet sizes

variable "price_5_dollars" {
  default     = "s-1vcpu-1gb"
  description = "Droplet with 1024MB memory, 1 vCPU, 25 GB disk."
}

variable "price_10_dollars" {
  default     = "s-1vcpu-2gb"
  description = "Droplet with 2048MB memory, 1 vCPU, 50 GB disk."
}

variable "price_15_dollars" {
  default     = "s-1vcpu-3gb"
  description = "Droplet with 3072MB memory, 1 vCPUs, 60 GB disk."
}

variable "price_15_dollars_2cpu" {
  default     = "s-2vcpu-2gb"
  description = "Droplet with 2048MB memory, 2 vCPUs, 60 GB disk."
}

variable "price_15_dollars_3cpu" {
  default     = "s-3vcpu-1gb"
  description = "Droplet with 1024MB memory, 3 vCPUs, 60 GB disk."
}

variable "price_20_dollars" {
  default     = "s-2vcpu-4gb"
  description = "Droplet with 4096MB memory, 2 vCPUs, 80 GB disk."
}

variable "price_40_dollars" {
  default     = "s-4vcpu-8gb"
  description = "Droplet with 8192MB memory, 4 vCPUs, 160 GB disk."
}

variable "price_80_dollars" {
  default     = "s-6vcpu-16gb"
  description = "Droplet with 16384MB memory, 6 vCPUs, 320 GB disk."
}

variable "price_160_dollars" {
  default     = "s-8vcpu-32gb"
  description = "Droplet with 32768MB memory, 8 vCPU, 640 GB disk."
}

variable "price_240_dollars" {
  default     = "s-12vcpu-48gb"
  description = "Droplet with 49152MB memory, 1 vCPU2, 960 GB disk."
}
