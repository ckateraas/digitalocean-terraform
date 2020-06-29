variable "size" {
  default     = "s-1vcpu-1gb"
  description = "Size of the droplet VM."
  type        = string
}
variable "region" {
  default     = "ams3"
  description = "In which region to create the droplet."
  type        = string
}
variable "image" {
  description = "Which image to install on the droplet."
  type        = string
}
variable "name" {
  description = "Name of the created droplet."
  type        = string
}
variable "user_data" {
  type = string
}