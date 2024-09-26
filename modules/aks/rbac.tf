
## give contibutor role to user or group for RG where AKS is hosted
resource "azurerm_role_assignment" "example" {
  principal_id   = "<USER_OBJECT_ID>"  # Replace with the object ID of the user
  role_definition_name = "Contributor"  # Role to assign
  scope          = var.resource_group_name
}