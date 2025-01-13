data "azurerm_monitor_diagnostic_categories" "keyvault_diagsettings" {
  count       = var.diag_enabled ? 1 : 0
  resource_id = azurerm_key_vault.example.id
}
