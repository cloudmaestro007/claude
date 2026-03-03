# Azure DevOps Skills

Key concepts and patterns for Azure automation.

## Subscription Management

- **List subscriptions**: `az account list --output table`
- **Set active subscription**: `az account set --subscription "<SUBSCRIPTION_ID>"`
- **Get context**: `az account show` (returns tenant ID, user, etc.)
- **Subscription ID format**: UUID like `a1b2c3d4-e5f6-47a8-9c1d-2e3f4a5b6c7d`
- **Multiple subscriptions**: Use `--subscription` flag in each `az` command

## Resource Groups

- **Create**: `az group create --resource-group <RG> --location <LOCATION>`
- **List**: `az group list --output table`
- **Delete**: `az group delete --resource-group <RG> --yes` (irreversible)
- **Best practice**: One RG per environment (Dev, Test, Prod)
- **Tagging**: Apply cost center, owner, environment tags to every RG

## RBAC (Role-Based Access Control)

- **Built-in roles**: Owner, Contributor, Reader, Reader + specific scopes
- **Custom roles**: Define for least-privilege automation accounts
- **Assign role**: `az role assignment create --role "Contributor" --assignee <APP_ID> --scope <SCOPE>`
- **Scope levels**: Subscription > Resource Group > Individual Resource
- **Service principals**: Use application IDs for automation, not personal accounts

## Key Vault

- **Purpose**: Centralized secret storage (connection strings, API keys, passwords)
- **Create**: `az keyvault create --name <VAULT_NAME> --resource-group <RG>`
- **Store secret**: `az keyvault secret set --vault-name <VAULT> --name <SECRET_NAME> --value <VALUE>`
- **Retrieve**: `az keyvault secret show --vault-name <VAULT> --name <SECRET_NAME> --query value -o tsv`
- **Access policies**: Grant specific permissions (list, get, set, delete) to principals
- **Rotation**: Implement secret rotation schedule (align with compliance policy)

## Storage Accounts

- **Tiers**: Standard (RA-GRS, geo-redundant), Premium (SSD)
- **Create**: `az storage account create --name <ACCT> --resource-group <RG> --location <LOC>`
- **Connection string**: `az storage account show-connection-string --name <ACCT> --query connectionString -o tsv`
- **Containers**: Organize blobs into logical groupings
- **Access tier**: Hot (frequent), Cool (infrequent), Archive (rare)
- **Backup**: Use geo-redundancy; test restore procedures

## SQL Server / Managed Instance (SQLMI)

- **SQL Server**: Virtual machine-based, full control, higher maintenance
- **Managed Instance**: Azure-managed, closer to on-premises, good for lift-and-shift
- **Connection string format**: `Server=tcp:<SERVER>.database.windows.net,1433;Database=<DB>;...`
- **Authentication**: SQL Auth (username/password) or Azure AD (recommended)
- **Firewall rules**: Allow specific IPs; use service endpoints for Azure resources
- **Backups**: Automated; retention policy; geo-redundant by default
- **Refresh/restore**: Restore from backup, not copy-paste to avoid schema drift

## Resource Naming

- **Convention**: `<env>-<component>-<region>-<seq>`
  - Example: `prod-sqlmi-eastus-01`
- **Prefixes**: Keep short; use abbreviations (rg- for RG, stg- for storage, sql- for database)
- **Regions**: eastus, westus, northeurope, eastasia, etc.
- **Avoid**: Spaces, special chars (use hyphens), hardcoded customer names
- **Consistency**: Apply across all resources for easy script automation

## Automation Accounts

- **Purpose**: Run PowerShell runbooks on schedule or webhook trigger
- **Create**: `az automation account create --name <ACCT> --resource-group <RG>`
- **Runbooks**: PowerShell, Python, Graphical, PowerShell Workflow
- **Hybrid workers**: Run on-premises or in private networks
- **Variables & credentials**: Store in account; reference in runbooks
- **Schedules**: Bind runbooks to cron-like triggers

## API & Permissions

- **Azure Resource Manager (ARM)**: REST API for all Azure operations
- **Microsoft Graph**: Access M365 data (users, groups, mail, etc.)
- **Service principal**: Create in Azure AD for script authentication
- **Managed identity**: Use for Azure resources (no credential management)
- **Scopes**: Limit permissions to what script actually needs

---

**See Also**: 
- [04-SCRIPTS/powershell/tools/](../04-SCRIPTS/powershell/tools/) for Azure examples
- [06-TEMPLATES/prompts/azure/](../06-TEMPLATES/prompts/azure/) for Azure prompt templates
