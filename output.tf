output "workspace_url" {
  description = "Databricks Workspace Details"
  value       = azurerm_databricks_workspace.main.workspace_url
}

output "workspace_id" {
  description = "Databricks Workspace Details"
  value       = azurerm_databricks_workspace.main.workspace_id
}