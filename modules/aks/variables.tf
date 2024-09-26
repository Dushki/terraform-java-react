variable "location" {
  description = "Location of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where AKS will be created"
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
}

variable "node_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "vnet_subnet_id" {
  description = "ID of the subnet where AKS nodes will be deployed"
  type        = string
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
  default     = "aks"
}

variable "logworkspace_sku" {
  description = "sku name for LAW"
  type        = string
}

variable "retention" {
  description = "retention policy for LAW"
  type        = string
  default     = "30"
}
