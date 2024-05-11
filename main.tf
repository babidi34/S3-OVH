terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
  }

  backend "s3" {
    bucket         = "s3-slow"
    key            = "s3-terraform.tfstate"
    region         = "rbx"
    endpoints = {
      s3 = "https://s3.rbx.io.cloud.ovh.net/"
    }
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}



provider "aws" {
  region     = "rbx"

  #OVH implementation has no STS service
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_region_validation = true
  endpoints {
    s3 = var.s3_endpoint
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.ovh_public_cloud_project_id}-${var.bucket_name}"

}