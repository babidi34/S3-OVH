terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.54.1"
    }
    ovh = {
      source = "ovh/ovh"
      version = "0.44.0"
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

resource "ovh_cloud_project_user" "user_s3" {
  service_name = var.os_tenant_id
  description  = "user s3"
  role_name    = "objectstore_operator"
}

resource "ovh_cloud_project_user_s3_credential" "user_s3_credentials" {
  service_name = ovh_cloud_project_user.user_s3.service_name
  user_id      = ovh_cloud_project_user.user_s3.id
}

resource "ovh_cloud_project_user_s3_policy" "user_s3_policy" {
  service_name = ovh_cloud_project_user.user_s3.service_name
  user_id      = ovh_cloud_project_user.user_s3.id
  policy       = jsonencode({
    "Statement":[{
      "Sid": "RWContainer",
      "Effect": "Allow",
      "Action":["s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:ListBucket", "s3:ListMultipartUploadParts", "s3:ListBucketMultipartUploads", "s3:AbortMultipartUpload", "s3:GetBucketLocation"],
      "Resource":["arn:aws:s3:::${var.bucket_name}", "arn:aws:s3:::${var.bucket_name}/*"]
    }]
  })
}

resource "aws_s3_bucket" "b" {
  bucket = coalesce(var.bucket_name, var.ovh_public_cloud_project_id)
  tags                        = {}
  tags_all                    = {}

  grant {
      id          = ovh_cloud_project_user.user_s3.id
      permissions = [
          "FULL_CONTROL",
      ]
      type        = "CanonicalUser"
      uri         = null
  }

  versioning {
      enabled    = false
      mfa_delete = false
  }
}
