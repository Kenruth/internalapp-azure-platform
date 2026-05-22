# internalapp-azure-platform
Minimal Azure infrastructure-as-code platform, provisioning a secure Windows App Service and Azure SQL Database, with private connectivity, automated via Terraform and Azure DevOps YAML pipelines, supporting a fully deployed dev environment and scaffolded production setup for future extension.

## Repository Layout
.
├── azure-pipelines.yml
├── infra
│   ├── env
│   │   ├── dev.tfvars
│   │   └── prod.tfvars
│   ├── locals.tf
│   ├── main.tf
│   ├── variables.tf

## Prerequisites

- Azure subscription
- Azure DevOps service connection with permission to create the target resources
- Remote Terraform state storage account and blob container
- Terraform 1.0 or newer available on the pipeline agent

The pipeline assumes the Terraform remote state resource group, storage account, and blob container already exist. Create these once before running the pipeline, or replace the example names with your organization’s backend resources.