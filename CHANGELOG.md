# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).



## [1.1.0] - 2022-08-31
### Added
- Added validation for the `sku` & `name` databricks variable 
- Added variable `virtual_network` ,`resource_group_name` & `location` 
- Added output for `workspace_url` & `workspace_id`



### Removed
- Removed `key-vault` & `data-lake` variable
- Removed `workspace` output ,`lens_base` dependency & `role_assignment.tf`

## Changed
- updated  azurerm provider from ">=2.45.0" to "~> 3.9"

## [1.0.0] - 2022-03-21
### Added
- Initial module
- Pulled HealthPoint customer code from the terraform-azurerm-lens and added to the repo.
- Added `tests/` directory for unit tests
- Added pre-commit hooks to leverage terraform-docs for documentation (see README)
- Added Insight_Enterprises_Logo.png under assests.
- Added source as git URL for lens_base module in test.tf
- Added terraform block to providers.tf.
- Added databricks provider to the providers.tf.

### Removed
- Requirement for AzureAD provider within the module
- Removed log_analytics_workspace_id variable block from variable.tf.
- Removed application_insights_instance_name from the databricks varialbe in variable.tf.
- Removed appinsights_instrumentation_key from output.tf.
- Removed application_insights_instrumentation_key resource block from the key_vault_secrets.tf.
- Removed terraform block from main.tf.

## Changed
- updated the databricks version in terraform block.