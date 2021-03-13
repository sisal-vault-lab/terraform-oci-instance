terraform {
  required_version = "~> 0.14"
  
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "company"

    workspaces {
      prefix = "tf-"
    }
  }
  
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.24"
    }
    
    oci = {
      source = "hashicorp/oci"
      version = "~> 4.17"
    }
  }
}

provider "tfe" {
}

provider "oci" {
  tenancy_ocid = var.oci_tenancy_id
  user_ocid = var.oci_user_id
  private_key = var.oci_private_key
  fingerprint = var.oci_key_fingerprint
  
  region = var.oci_region_name
}

data "oci_identity_tenancy" "oci_tenancy" {
    tenancy_id = var.oci_tenancy_id
}

data "oci_identity_regions" "home" {
  filter {
    name = "key"
    values = [data.oci_identity_tenancy.oci_tenancy.home_region_key]
  }
}

provider "oci" {
  alias = "home"
  tenancy_ocid = var.oci_tenancy_id
  user_ocid = var.oci_user_id
  private_key = var.oci_private_key
  fingerprint = var.oci_key_fingerprint
  
  region = data.oci_identity_regions.home.regions[0].name
}
