# Solution


## Overview

This solution is a minimal demonstration of how internal application provisioning can be standardized with repeatability and future expansion in mind.

The current implementation provisions the dev environment end-to-end, with production scaffolding included for easier execution when production is ready.

## Architecture

The dev environment provisions:

- A resource group.
- A virtual network.
- An App Service integration subnet.
- A private endpoint subnet.
- A Windows App Service Plan.
- A Windows Web App.
- An Azure SQL Server.
- An Azure SQL Database.
- A private DNS zone for Azure SQL private endpoint resolution.
- A private endpoint for Azure SQL Server.

## Networking And Security

- The Web App is configured to be reachable only through HTTPS, with FTPS disabled.
- The database is not publicly reachable because public network access is disabled.
- The SQL Server is exposed only through private endpoints within the VNet.
- A private DNS zone is used to internally resolve SQL hostnames.
- The App Service uses VNet integration to access the SQL private endpoint.

## Environment Separation

- Dev and prod are separated by their respective `.tfvars` files:
  `internalapp-dev.tfvars` and `internalapp-prod.tfvars`.

- Dev and prod also have individual state files stored separately:
    `secure-web-sql/internalapp-dev.tfstate` & `secure-web-sql/internalapp-prod.tfstate`

## Remote State

- State is stored remotely in separate resource groups and storage accounts for dev and prod.
- The remote storage locations must be provisioned separately and passed to the backend file for local use. For pipeline use, these values should be passed through pipeline parameters or variable libraries.
- Remote state is initialized before every execution through the `terraform init` command.

## Pipeline Flow

Within the CI/CD pipeline:
- The pipeline can be run manually or through a pull request, which is the preferred workflow.

When a PR is created targeting main:
- Terraform is executed in stages. It runs `validate` and then runs `plan` for dev and prod, with the prod plan subject to approval.

Upon merge into main:
- Dev is validated, planned, and automatically applied.

For production:
- There is currently no prod apply stage, although there is a prod plan subject to manual approval.

## Secrets Management

No secrets are stored in source control.

Azure authentication is handled through service connections.

The randomly generated sensitive SQL admin password is stored in remote state, which is held in the storage account and protected with restricted RBAC access.

## Tradeoffs

Private endpoint connectivity was used in accordance with the requirements of the assessment, especially the requirement for strict web-tier-only database access.

Prod is included only as scaffolding and is not currently implemented end-to-end. This makes it easier to transition to a future production deployment without starting from scratch.

## Future Improvements

The future improvement would be to move all sensitive secrets, passwords, and keys to a dedicated secret handler like Azure Key Vault and source from it whenever secrets are needed.
