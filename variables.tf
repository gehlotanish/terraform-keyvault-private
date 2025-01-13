variable "location" {
  type        = string
  description = "Azure Region location"
}

variable "azurerm_resource_group_name" {
  type        = string
  description = "Azure Resource Group Name"
}

variable "keyvault_name" {
  type        = string
  description = "Azure keyvault Name"
}

variable "environment" {
  type        = string
  description = "Resource Tags ENVIRONMENT Value"
}

variable "sku_name" {
  type        = string
  description = "KeyVault SKU Name. Possible values are standard and premium"
  default     = "standard"
}

variable "purge_protection" {
  type        = bool
  description = "Defaults to false, Once Purge Protection has been Enabled it's not possible to Disable it"
  default     = "false"
}

variable "log_analytics_name" {
  type        = string
  description = "Azure log analytics name"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between `7` and `90`"
  default     = "7"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this Key Vault. Defaults to true"
  default     = true
}

variable "network_acls" {
  description = "Object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. Set to `null` to disable. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more information."
  type = object({
    bypass                     = optional(string, "None"),
    default_action             = optional(string, "Deny"),
    ip_rules                   = optional(list(string)),
    virtual_network_subnet_ids = optional(list(string)),
  })
  default = {}
}

variable "keyvault_extra_tags" {
  type        = map(string)
  default     = {}
  description = "List of KV extra tags"
}

variable "diag_enabled" {
  type        = bool
  description = "Enable diagnostic service"
  default = false
}

