# Module: AZ-AppInsights

Deploys an Azure Application Insights instance for application performance monitoring (APM) and telemetry.

---

## Resources Created

| Resource | Type |
|---|---|
| Application Insights | `azurerm_application_insights` |

---

## Usage

```hcl
module "AZ-ApplicationInsights" {
  source = "../../modules/AZ-AppInsights"

  deploy            = true
  appinsightsname   = "dev-eastus-appinsights"
  location          = "eastus"
  resourcegroupname = "dev-eastus-rg"
}
```

---

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| `deploy` | `bool` | yes | Set to `true` to create the resource, `false` to skip |
| `appinsightsname` | `string` | yes | Name of the Application Insights instance |
| `location` | `string` | yes | Azure region |
| `resourcegroupname` | `string` | yes | Name of the resource group |

---

## Outputs

| Name | Description |
|---|---|
| `instrumentation_key` | Instrumentation key used to connect applications to this instance |
| `app_id` | Application ID of the Application Insights instance |
| `application_insights_instrumentation_key` | Alias output for the instrumentation key |

---

## Notes

- Application type is set to `web`, suitable for web applications and APIs
- The instrumentation key output can be passed directly to the App Service module to wire up monitoring
- Consider connecting to a Log Analytics Workspace for workspace-based (modern) Application Insights
