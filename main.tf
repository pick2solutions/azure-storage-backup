resource "azurerm_resource_group" "storage_backup_demo" {
  name     = "storage-backup-demo-rg"
  location = "eastus"
}

module "storage_account_with_backup_protection" {
  source = "git::https://github.com/pick2solutions/pick2-iac-core.git//azure/storage_account_with_backup_protection"

  storage_account_name         = "pick2storageacct"
  resource_group_name          = azurerm_resource_group.storage_backup_demo.name
  location                     = azurerm_resource_group.storage_backup_demo.location
  file_share_name              = "pick2files"
  file_share_quota             = 100
  account_tier                 = "Standard"
  account_replication_type     = "LRS"
  delete_retention_days        = 7
  recovery_vault_sku           = "Standard"
}