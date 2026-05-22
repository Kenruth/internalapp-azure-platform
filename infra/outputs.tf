output "resource_group_name" {
  description = "Resource group containing the environment resources."
  value       = azurerm_resource_group.main.name
}

output "sql_server_fqdn" {
  description = "Azure SQL Server FQDN. Resolves privately from the VNet."
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "sql_database_name" {
  description = "Azure SQL Database name."
  value       = azurerm_mssql_database.app.name
}