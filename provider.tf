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

provider "openstack" {
  user_name   = var.os_username
  tenant_name = var.os_tenant_name
  password    = var.os_password
  auth_url    = var.os_auth_url
  region      = var.os_region_name
}

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}