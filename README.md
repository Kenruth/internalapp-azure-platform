# internalapp-azure-platform
Minimal Azure infrastructure-as-code platform, provisioning a secure Windows App Service and Azure SQL Database, with private connectivity, automated via Terraform and Azure DevOps YAML pipelines, supporting a fully deployed dev environment and scaffolded production setup for future extension.

## Repository Layout
.
├── azure-pipelines.yml
├── infra
│   ├── env
│   │   ├── internalapp-dev.tfvars
│   │   └── internalapp-prod.tfvars
│   ├── locals.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
    ├── versions.tf
├── .gitignore
└── README.md

## Prerequisites

- Azure subscription
- Azure DevOps service connection with permission to create the target resources
- Remote Terraform state storage account and blob container
- Terraform 1.0 or newer available on the pipeline agent

The pipeline assumes the Terraform remote state resource group, storage account, and blob container already exist. Create these once before running the pipeline, or replace the example names with your organization’s backend resources.

# Local Commands

From the `infra` folder:

terraform init -backend-config="backend.dev.tfbackend.eample"

terraform fmt -recursive
terraform validate
terraform plan -var-file=env/internalapp-dev.tfvars

# Applying the infra.

-   For Dev infra is applied by running/merging the changes into main.
-   For Prod, only plan is applicable and is only ran on manual validation/input.