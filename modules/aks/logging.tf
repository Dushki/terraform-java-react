
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.logworkspace_sku

  retention_in_days = var.retention
}