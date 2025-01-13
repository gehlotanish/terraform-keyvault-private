# template-terraform
Template repository for all terraform module repositories

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_resource_group_name"></a> [azurerm\_resource\_group\_name](#input\_azurerm\_resource\_group\_name) | Azure Resource Group Name | `string` | n/a | yes |
| <a name="input_diag_enabled"></a> [diag\_enabled](#input\_diag\_enabled) | Enable diagnostic service | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Resource Tags ENVIRONMENT Value | `string` | n/a | yes |
| <a name="input_keyvault_extra_tags"></a> [keyvault\_extra\_tags](#input\_keyvault\_extra\_tags) | List of KV extra tags | `map(string)` | `{}` | no |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | Azure keyvault Name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure Region location | `string` | n/a | yes |
| <a name="input_log_analytics_name"></a> [log\_analytics\_name](#input\_log\_analytics\_name) | Azure log analytics name | `string` | n/a | yes |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | Object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. Set to `null` to disable. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more information. | <pre>object({<br>    bypass                     = optional(string, "None"),<br>    default_action             = optional(string, "Deny"),<br>    ip_rules                   = optional(list(string)),<br>    virtual_network_subnet_ids = optional(list(string)),<br>  })</pre> | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this Key Vault. Defaults to true | `bool` | `true` | no |
| <a name="input_purge_protection"></a> [purge\_protection](#input\_purge\_protection) | Defaults to false, Once Purge Protection has been Enabled it's not possible to Disable it | `bool` | `"false"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | KeyVault SKU Name. Possible values are standard and premium | `string` | `"standard"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted. This value can be between `7` and `90` | `number` | `"7"` | no |  
## Outputs

No outputs.
<!-- END_TF_DOCS -->