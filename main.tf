provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Call Network Module
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.aks_rg.name
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
}

# Call ACR Module
module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.aks_rg.name
  acr_name            = var.acr_name
}

# Call AKS Module
module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.aks_rg.name
  cluster_name        = var.aks_cluster_name
  node_count          = var.aks_node_count
  node_size           = var.aks_node_size
  vnet_subnet_id      = module.network.subnet_id
  acr_name            = module.acr.acr_name
}