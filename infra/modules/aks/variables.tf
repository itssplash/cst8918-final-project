variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The Azure location"
  type        = string
}
