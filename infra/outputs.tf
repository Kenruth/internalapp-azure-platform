output "resource_group_name" {
  description = "Resource group containing the environment resources."
  value       = azurerm_resource_group.main.name
}