variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  description = "The environment name (e.g. test, prod)"
  type        = string
}
