output "key_vault_id" {
  value       = azurerm_key_vault.main.id
  description = "The ID of the created Azure Key Vault."
}

output "key_vault_uri" {
  value       = azurerm_key_vault.main.vault_uri
  description = "The URI of the created Azure Key Vault, used for accessing secrets, keys, and certificates."
}

output "key_vault_name" {
  value       = azurerm_key_vault.main.name
  description = "The name of the created Azure Key Vault."
}

output "diagnostic_setting_id" {
  value       = var.diag_enabled && var.log_analytics_workspace_name != null ? azurerm_monitor_diagnostic_setting.keyvault_diag[0].id : null
  description = "The ID of the diagnostic setting for the Key Vault, if enabled. Returns null if diagnostics are not configured."
}

output "log_analytics_workspace_id" {
  value       = var.diag_enabled && var.log_analytics_workspace_name != null ? data.azurerm_log_analytics_workspace.existing[0].id : null
  description = "The ID of the Log Analytics Workspace used for diagnostics, if configured. Returns null if diagnostics are not enabled or no workspace is specified."
}