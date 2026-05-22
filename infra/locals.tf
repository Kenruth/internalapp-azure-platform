resource "random_string" "suffix" {
  length  = 6
  lower   = true
  numeric = true
  special = false
  upper   = false
}

locals {
  name_prefix    = lower("${var.tenant_name}-${var.environment}-${random_string.suffix.result}")

  tags = {
    environment = var.environment
    owner       = var.owner
    workload    = var.tenant_name
    cost_center = var.cost_center
    managed_by  = "terraform"
  }
}