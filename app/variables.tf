variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "app_name" {
  description = "The name of the weather application"
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "redis_name" {
  description = "The name of the Azure Redis Cache"
  type        = string
}

variable "location" {
  description = "The Azure location"
  type        = string
}
