variable "environment" {
  description = "Environment name(dev or prod.)"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod."
  }
}

variable "tenant_name" {
  description = "Short name used for resource naming."
  type        = string
}

variable "owner" {
  description = "Team or person responsible for the platform."
  type        = string
}

variable "cost_center" {
  description = "Cost center or billing reference."
  type        = string
  default     = "dev-platform"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "address_space" {
  description = "VNet address space."
  type        = list(string)
}

variable "app_integration_subnet_prefixes" {
    description = "App services subnet prefixes"
    type        = list(string)
}

variable "private_endpoint_subnet_prefixes" {
    description = "App services subnet prefixes"
    type        = list(string)
}

variable "app_service_plan_sku" {
    description = "Windows App service plan SKU"
    type = string
    default = "B1"
}