environment = "dev"
lacation    = "westeurope"

tenant_name = "internalapp"
cost_center = "internal-dev"
owner       = "platform-team"

app_service_plan_sku = "B1"

address_space                    = ["10.42.0.0/24"]
app_integration_subnet_prefixes  = ["10.42.0.0/27"]
private_endpoint_subnet_prefixes = ["10.42.0.32/27"]