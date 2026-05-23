environment = "dev"
location    = "westeurope"

tenant_name = "internalapp"
cost_center = "internal-dev"
owner       = "platform-team"

sql_admin_login = "sqladminuser"

sql_database_max_size_gb = 2
app_service_plan_sku     = "B1"
sql_database_sku         = "Basic"

address_space                    = ["10.42.0.0/24"]
app_integration_subnet_prefixes  = ["10.42.0.0/27"]
private_endpoint_subnet_prefixes = ["10.42.0.32/27"]