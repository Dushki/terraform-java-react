resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_size
    vnet_subnet_id = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.2.10"
    service_cidr   = "10.0.2.0/24"
  }

# Enable monitoring for AKS
  addon_profile {
    oms_agent {
      enabled   = true
      config {
        log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
      }
    }
  }

# AKS should be complined

  azure_policy_enabled = true
  
  depends_on = [azurerm_role_assignment.acr_pull_role]
}

# Assign ACR pull permissions to AKS
resource "azurerm_role_assignment" "acr_pull_role" {
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = data.azurerm_container_registry.acr.id
}

data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
}
