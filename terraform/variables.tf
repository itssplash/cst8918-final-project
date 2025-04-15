variable "resource_group_name" {
  type = string
}
variable "vnet_name" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}



variable "subnets" { type = map(string) }
