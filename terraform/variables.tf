variable "resource_group_name" {}
variable "location" { default = "Canada Central" }
variable "storage_account_name" {}
variable "container_name" {}
variable "vnet_name" {}
variable "subnets" { type = map(string) }
variable "acr_name" {}
variable "image_tag" {}