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

