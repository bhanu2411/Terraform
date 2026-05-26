# Module: AZ-KV

Deploys an Azure Key Vault with hardened security settings — private access only, RBAC authorisation, and purge protection enabled.

---

## Resources Created

| Resource | Type |
|---|---|
| Key Vault | `azurerm_key_vault` |

---

## Usage

```hcl
module "AZ-KV" {
  source = "../../modules/AZ-KV"

  deploy            = true
  keyvaultname      = "dev-eastus-kv"
  location          = "eastus"
  resourcegroupname = "dev-eastus-rg"
}
```

---

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| `deploy` | `bool` | yes | Set to `true` to create the Key Vault, `false` to skip |
| `keyvaultname` | `string` | yes | Name of the Key Vault (must be globally unique) |
| `location` | `string` | yes | Azure region |
| `resourcegroupname` | `string` | yes | Name of the resource group |

---

## Outputs

| Name | Description |
|---|---|
| `name` | Name of the Key Vault |
| `location` | Region where the Key Vault is deployed |
| `resource_group_name` | Resource group containing the Key Vault |

---

## Security Configuration

- **Public network access disabled** — not accessible from the internet
- **Network ACLs** — default action set to `Deny`; only Azure services bypass is allowed
- **RBAC authorisation** — uses Azure role assignments instead of legacy access policies
- **Soft delete retention** — 7 days
- **Purge protection enabled** — prevents permanent deletion during retention period
- **Disk encryption** — enabled for use with Azure Disk Encryption
- **SKU** — Standard
