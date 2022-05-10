terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.2.0"
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

resource "aci_tenant" "terraform_ten" {
  name = "terraform_ten"
}

resource "aci_vrf" "vrf1" {
  tenant_dn = "${aci_tenant.terraform_ten.id}"
  name      = "vrf1"
}

resource "aci_bridge_domain" "bd1" {
  tenant_dn          = "${aci_tenant.terraform_ten.id}"
  relation_fv_rs_ctx = "${aci_vrf.vrf1.name}"
  name               = "bd1"
}

resource "aci_subnet" "bd1_subnet" {
  parent_dn = "${aci_bridge_domain.bd1.id}"
  ip               = "192.168.1.1/24"
}

resource "aci_application_profile" "app1" {
  tenant_dn = "${aci_tenant.terraform_ten.id}"
  name      = "app1"
}

resource "aci_application_epg" "epg1" {
  application_profile_dn = "${aci_application_profile.app1.id}"
  name                   = "epg1"
  relation_fv_rs_bd      = "${aci_bridge_domain.bd1.name}"
}

