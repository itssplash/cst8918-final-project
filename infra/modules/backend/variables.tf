variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the container to store Terraform state"
  type        = string
}

variable "location" {
  description = "The Azure location"
  type        = string
}
