variable "location" {
  description = "Location for Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for Virtual Network"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "subnet_prefix" {
  description = "Address prefix for the Subnet"
  type        = string
}
