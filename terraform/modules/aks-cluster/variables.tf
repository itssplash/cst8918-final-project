variable "environment" {
  description = "Environment name (e.g. test, prod)"
  type        = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}
