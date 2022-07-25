terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.4.0"
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
  insecure = false
  #proxy_url = "https://proxy_server:proxy_port"
}
