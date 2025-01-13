provider "azurerm" {
  features {}
}

### Key vault

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                          = var.keyvault_name
  location                      = var.location
  resource_group_name           = var.azurerm_resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.sku_name
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection
  public_network_access_enabled = var.public_network_access_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
  dynamic "network_acls" {
    for_each = var.network_acls == null ? [] : [var.network_acls]
    iterator = acl

    content {
      bypass                     = acl.value.bypass
      default_action             = acl.value.default_action
      ip_rules                   = acl.value.ip_rules
      virtual_network_subnet_ids = acl.value.virtual_network_subnet_ids
    }
  }
  tags = merge(local.default_tags, var.keyvault_extra_tags)
}

resource "azurerm_log_analytics_workspace" "example" {
  count = var.diag_enabled ? 1 : 0

  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  count = var.diag_enabled ? 1 : 0

  name                       = "${var.keyvault_name}-diag"
  target_resource_id         = azurerm_key_vault.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example[count.index].id

  dynamic "metric" {

    iterator = entry
    for_each = data.azurerm_monitor_diagnostic_categories.keyvault_diagsettings[count.index].metrics

    content {
      category = entry.value
      enabled  = true

      retention_policy {
        enabled = true
        days    = var.app_workspace_retention
      }
    }
  }

  dynamic "enabled_log" {

    iterator = entry
    for_each = data.azurerm_monitor_diagnostic_categories.keyvault_diagsettings[count.index].logs

    content {
      category = entry.value

      retention_policy {
        enabled = true
        days    = var.app_workspace_retention
      }
    }
  }
}
