variable "location" {
  description = "Location for ACR"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for ACR"
  type        = string
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}
