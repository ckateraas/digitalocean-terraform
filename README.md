# Terraform

Use [Hashicorp's `terraform`](https://www.terraform.io) to create infrastructure on Digital Ocean.

We're using Docker to make setup easier, so you do not need to clutter your own
machine with anything - it's all inside a container instead!

## Digital Ocean API keys

`terraform` needs access to your API keys to create infrastructure in Digital Ocean's cloud.
The API key can be set using an environment variable, `TF_VAR_do_token`, which must be passed into the container using the `-e` flag.

If you don't set it, you will be prompted for the API key when you run `terraform apply`.

## Digital Ocean metadata

I've yet to find a clear overview of which images and VMs Digital Ocean have available.
The same goes for finding which ID your SSH keys has internally at Digital Ocean.

A nifty helper Digital Ocean's API, which can answer those questions for you. Check out [the API's documentation](https://developers.digitalocean.com/documentation/v2/) if you need more information from the API than what's below.

### List image names and slugs

The image slugs are used when creating the droplet. The droplets slugs I use are stored in `variables.tf`.

```sh
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer you-api-key" "https://api.digitalocean.com/v2/images"
| jq '.images[] | .name, .slug'
| awk '{printf (NR%2==0) ? $0 "\n" : $0}'
```

### List all sizes

The size is used when creating droplets. The droplet size are named by price in `variables.tf`.

```sh
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer you-api-key" "https://api.digitalocean.com/v2/sizes"
| jq '.sizes[].slug'
```

### List your SSH keys

The SSH key id is used when creating droplets to allow you to SSH into your newly created droplet.

```sh
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer you-api-key" "https://api.digitalocean.com/v2/account/keys"
| jq '.ssh_keys[] | .name, .id'
| awk '{printf (NR%2==0) ? $0 "\n" : $0}'

```
