# Module: AZ-AppService

Deploys an Azure Windows Web App along with its App Service Plan.

---

## Resources Created

| Resource | Type |
|---|---|
| App Service Plan | `azurerm_service_plan` |
| Windows Web App | `azurerm_windows_web_app` |

---

## Usage

```hcl
module "appservice" {
  source = "../../modules/AZ-AppService"

  deploy             = true
  appservicename     = "dev-eastus-appservice"
  appserviceplanname = "dev-eastus-appserviceplan"
  location           = "eastus"
  resourcegroupname  = "dev-eastus-rg"
}
```

---

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| `deploy` | `bool` | yes | Set to `true` to create the resources, `false` to skip |
| `appservicename` | `string` | yes | Name of the Windows Web App |
| `appserviceplanname` | `string` | yes | Name of the App Service Plan |
| `location` | `string` | yes | Azure region |
| `resourcegroupname` | `string` | yes | Name of the resource group |

---

## Outputs

| Name | Description |
|---|---|
| `appservicename` | Name of the deployed App Service |
| `appserviceplanname` | Name of the deployed App Service Plan |

---

## Security Configuration

- **HTTPS only** — HTTP traffic is automatically redirected
- **Minimum TLS version** — TLS 1.2
- **FTPS disabled** — FTP access is fully disabled
- **System-assigned managed identity** — enabled for secure, passwordless access to other Azure resources
- **Node.js runtime** — v22 (configurable)
