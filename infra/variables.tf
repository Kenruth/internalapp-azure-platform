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