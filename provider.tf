terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "~> 0.9.0"
    }
  }
}

provider "aci" {
  # cisco-aci user name
  username = var.username
  # cisco-aci password
  password = var.password
  # cisco-aci url
  url      = var.url
  insecure = true
  #proxy_url = "https://proxy_server:proxy_port"
}
