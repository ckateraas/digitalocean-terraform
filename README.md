# Terraform

Use [Hashicorp's `terraform`](https://www.terraform.io) to create infrastructure on Digital Ocean.
This repo creates a droplet running RancherOS, which is behind a Digital Ocean firewall, and DNS records.
The firewall only allows ICMP, HTTP and HTTPS traffic through.

## Getting started

Add this alias to your shell's config and you're ready to go.

```sh
alias terraform 'docker run --rm -it -w /terraform -v (pwd):/terraform hashicorp/terraform:0.12.26'
```

You can now run Terraform from within Docker using `terraform`! If you do not want to use Terraform from within Docker, you can
install it directly on your machine instead.

### Filling in your variables

Create a `terraform.tfvars.json` file based on the example file in this repo.

```sh
cp terraform.tfvars.json.example terraform.tfvars.json
```

Open it up in your favorite editor and change the values in the file.

### Using Terraform

Then you need to initialize Terraform. This will pull down all providers and external modules needed by this project.

```sh
terraform init
```

Check out what plans Terraform has and apply them afterwards, if they look ok.

```sh
# Look over Terraform's plan
terraform plan
# ...then build the resources
terraform apply
```

### Connecting to your new droplet

Once Terraform has finished building your infrastructure, you can access your droplet. Either look for the droplet's IP in Terraform's output
or access it using the DNS domain you set for the droplet.

## Digital Ocean metadata

Use `doctl` to access metadata from Digital Ocean. Such as the SSH key ID or SSH-ing into instances.

This can also be run using Docker with their [`digitalocean/doctl` image](https://hub.docker.com/r/digitalocean/doctl).

If you have filled in `terraform.tfvars.json` with your secrets and have `jq` installed, you can use this one-liner for `doctl`:

```sh
docker run -it --rm -e=DIGITALOCEAN_ACCESS_TOKEN=(jq --raw-output ".do_token" terraform.tfvars.json)  digitalocean/doctl <command>
```