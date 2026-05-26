# Module: AZ-StorageAccount

Deploys an Azure Storage Account with security best practices enforced — HTTPS only, TLS 1.2, and no public blob access.

---

## Resources Created

| Resource | Type |
|---|---|
| Storage Account | `azurerm_storage_account` |

---

## Usage

```hcl
module "sa" {
  source = "../../modules/AZ-StorageAccount"

  deploy             = true
  storageaccountname = "deveastussa"
  resourcegroupname  = "dev-eastus-rg"
  location           = "eastus"
  environment        = "dev"
}
```

---

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| `deploy` | `bool` | yes | Set to `true` to create the Storage Account, `false` to skip |
| `storageaccountname` | `string` | yes | Name of the Storage Account (must be globally unique, lowercase, 3–24 chars) |
| `resourcegroupname` | `string` | yes | Name of the resource group |
| `location` | `string` | yes | Azure region |
| `environment` | `string` | yes | Environment name (used as a resource tag) |

---

## Outputs

| Name | Description |
|---|---|
| `storage_account_name` | Name of the deployed Storage Account |
| `storage_account_key` | Primary access key (sensitive) |

---

## Security Configuration

- **HTTPS traffic only** — HTTP access is disabled
- **Minimum TLS version** — TLS 1.2
- **No public blob access** — anonymous public access to containers and blobs is disabled
- **Geo-redundant storage (GRS)** — data is replicated to a secondary region for durability
- **Environment tag** — applied to the resource for cost tracking and governance
