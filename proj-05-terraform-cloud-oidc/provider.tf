terraform {
  cloud {

    organization = "Udemy-Terraform-Workspaces"

    workspaces {
      name = "terraform-oidc"
    }
  }

  required_version = "~> 1.7, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}