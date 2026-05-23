environment = "prod"
location    = "westeurope"

tenant_name = "internalapp"
cost_center = "internal-prod"
owner       = "platform-team"

address_space                    = ["10.43.0.0/24"]
app_integration_subnet_prefixes  = ["10.43.0.0/27"]
private_endpoint_subnet_prefixes = ["10.43.0.32/27"]