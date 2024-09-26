
provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "this" {
  name     = "var.backendRG"
  location = "var.location"
}

# Create a Storage Account
resource "azurerm_storage_account" "this" {
  name                     = "var.backenstorage"  
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type  = "LRS"
}

# Create a Blob Container
resource "azurerm_storage_container" "this" {
  name                  = "terraformstate" 
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

# Configure Terraform Backend
terraform {
  backend "azurerm" {
    resource_group_name  = azurerm_resource_group.this.name
    storage_account_name  = azurerm_storage_account.this.name
    container_name        = azurerm_storage_container.this.name
    key                   = "terraform.tfstate"
  }
}

