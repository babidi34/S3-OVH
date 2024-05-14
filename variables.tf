variable "ovh_application_key" {
  type = string
}

variable "ovh_application_secret" {
  type = string
}

variable "ovh_consumer_key" {
  type = string
}

variable "os_username" {
  description = "OpenStack username"
  type        = string
}

variable "os_password" {
  description = "OpenStack password"
  type        = string
  sensitive   = true
}

variable "os_auth_url" {
  description = "OpenStack auth URL"
  type        = string
}

variable "os_project_name" {
  description = "OpenStack tenant/project name"
  type        = string
}

variable "os_region_name" {
  description = "OpenStack region name"
  type        = string
}

variable "os_tenant_id" {
  description = "OpenStack tenant/project id"
  type        = string
}

variable "os_tenant_name" {
  description = "OpenStack tenant/project name"
  type        = string
}

variable "ovh_public_cloud_project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "rbx"
}

variable "s3_endpoint" {
  type    = string
  default = "https://s3.rbx.io.cloud.ovh.net/"
}

variable "user_desc_prefix" {
  type    = string
  default = "[TF] User created by s3 terraform script"
}

variable "bucket_name" {
  type    = string
  default = "tf-s3-bucket-only"
}