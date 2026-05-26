# Azure Infrastructure — Terraform

This repository contains modular Terraform code to provision and manage Azure cloud infrastructure across multiple environments (dev, test, prod). It uses Azure DevOps Pipelines for CI/CD automation.

---

## Architecture Overview

```
Terraform/
├── CI.yaml                      # Azure DevOps pipeline
├── infrastructure/              # Root module (entry point)
│   ├── main.tf                  # Provider config, resource group, VNet
│   ├── backend.config.tf        # Remote state (Azure Blob Storage)
│   ├── *.tf / *.variables.tf    # Per-resource module calls & variables
│   ├── env-dev/                 # Dev environment tfvars
│   ├── env-test/                # Test environment tfvars
│   └── env-prod/                # Prod environment tfvars
└── modules/
    ├── AZ-AppInsights/          # Application Insights module
    ├── AZ-AppService/           # App Service + App Service Plan module
    ├── AZ-KV/                   # Azure Key Vault module
    └── AZ-StorageAccount/       # Storage Account module
```

---

## Infrastructure Components

| Component | Azure Resource | Module |
|---|---|---|
| App Service | `azurerm_windows_web_app` + `azurerm_service_plan` | `AZ-AppService` |
| Key Vault | `azurerm_key_vault` | `AZ-KV` |
| Storage Account | `azurerm_storage_account` | `AZ-StorageAccount` |
| Application Insights | `azurerm_application_insights` | `AZ-AppInsights` |
| Resource Group | `azurerm_resource_group` | Root |
| Virtual Network | `azurerm_virtual_network` | Root |

---

## Environments

Each environment has its own `terraform.tfvars` file under `infrastructure/env-<name>/`. Resources are conditionally deployed using `count`-based feature flags.

| Environment | Location | Folder |
|---|---|---|
| dev | East US | `env-dev/` |
| test | East US | `env-test/` |
| prod | East US | `env-prod/` |

---

## CI/CD Pipeline

The pipeline is defined in `CI.yaml` and runs on Azure DevOps. It is triggered on every push to the `master` branch and supports a manual `environment` parameter (dev / test / prod).

**Pipeline stages:**

1. **Terraform Install** — installs Terraform v1.5.7
2. **Azure Login** — authenticates via service connection (`terraform-azure-devops-sp`)
3. **Terraform Init** — initialises with remote backend (Azure Blob Storage)
4. **Terraform Validate** — validates configuration syntax
5. **Terraform Plan** — generates execution plan
6. **Terraform Apply** — applies changes (only on `master` branch)

> **Note:** `Apply` is gated to the `master` branch to prevent accidental changes from feature branches.

---

## Remote State Backend

State is stored remotely in Azure Blob Storage to enable team collaboration and state locking.

| Setting | Value |
|---|---|
| Resource Group | `tfstate-rg` |
| Storage Account | `tfstatestore` |
| Container | `tfstate` |
| Key (per env) | `<environment>.terraform.tfstate` |

---

## Authentication

Authentication to Azure is handled via environment variables injected by the Azure DevOps service connection. **No secrets are stored in code.**

Required environment variables:

```
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_TENANT_ID
ARM_SUBSCRIPTION_ID
```

---

## Running Locally

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5.7
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure subscription with a configured service principal

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/bhanu2411/Terraform.git
cd Terraform

# 2. Authenticate with Azure
az login
export ARM_SUBSCRIPTION_ID="<your-subscription-id>"
export ARM_CLIENT_ID="<your-client-id>"
export ARM_CLIENT_SECRET="<your-client-secret>"
export ARM_TENANT_ID="<your-tenant-id>"

# 3. Initialise Terraform (example: dev environment)
cd infrastructure/env-dev
terraform init -backend-config=../../infrastructure/backend.config.tf

# 4. Plan
terraform plan -var-file="terraform.tfvars"

# 5. Apply
terraform apply -var-file="terraform.tfvars"
```

---

## Security Highlights

- Key Vault has public network access **disabled** with network ACLs set to `Deny`
- Key Vault uses **RBAC authorisation** (not legacy access policies)
- App Service enforces **HTTPS only** and **TLS 1.2 minimum**
- App Service has **FTPS disabled**
- Storage Account enforces **HTTPS traffic only**, **TLS 1.2**, and **no public blob access**
- No credentials are hardcoded — all secrets are passed via environment variables

---

## Modules

See individual module READMEs for details:

- [`modules/AZ-AppInsights`](./modules/AZ-AppInsights/README.md)
- [`modules/AZ-AppService`](./modules/AZ-AppService/README.md)
- [`modules/AZ-KV`](./modules/AZ-KV/README.md)
- [`modules/AZ-StorageAccount`](./modules/AZ-StorageAccount/README.md)
