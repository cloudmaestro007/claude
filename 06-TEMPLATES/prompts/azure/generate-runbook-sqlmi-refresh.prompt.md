# Prompt Template: Generate Runbook for SQL MI Refresh

## Context

See `07-SKILLS/automation.skill.md` and `07-SKILLS/azure.skill.md` for reference.

## Template

**System Context:**  
You are an expert PowerShell automation engineer. Generate a production-ready runbook for Azure Automation that refreshes a SQL Managed Instance backup. Include error handling, logging, and retry logic.

---

### Environment Details

**Automation Account:** `<AUTOMATION_ACCOUNT_NAME>`  
**Subscription ID:** `<SUBSCRIPTION_ID>`  
**SQL MI Server:** `<SQLMI_SERVER_NAME>`  
**SQL MI Instance:** `<SQLMI_INSTANCE_NAME>` (e.g., myinstance)  
**Database Name:** `<DATABASE_NAME>`  
**Resource Group:** `<RESOURCE_GROUP>`  
**Key Vault:** `<KEY_VAULT_NAME>`  
**KeyVault Secret (SQL Admin Password):** `<KEYVAULT_SECRET_NAME>`

### Runbook Requirements

1. **Inputs:**
   - Source database server/instance
   - Target database server/instance
   - Backup retention days (e.g., 30)
   - Notification email: `<ADMIN_EMAIL>`

2. **Actions:**
   - Authenticate using managed identity or service principal
   - Retrieve latest backup from source SQLMI
   - Create restore backup on target SQLMI (with new name including timestamp)
   - Validate restore success (row count check, schema validation)
   - Clean up backups older than retention period
   - Send email notification with status

3. **Error Handling:**
   - Trap connection failures; retry with exponential backoff
   - Rollback on validation failure
   - Send error alert to `<ADMIN_EMAIL>`
   - Return meaningful exit codes

4. **Logging:**
   - Log to runbook output
   - Write structured logs to `<LOG_STORAGE_ACCOUNT>` (blob container: `logs`)
   - Include timestamps, parameters, and execution metrics

5. **Schedule:**
   - Trigger: `<SCHEDULE_FREQUENCY>` (e.g., daily at 2 AM UTC)
   - Timeout: `<TIMEOUT_MINUTES>` (e.g., 180 min)

---

### Questions for Claude

1. Generate the complete PowerShell runbook with all functions
2. Provide the module imports and setup script
3. Include sample JSON definitions for runtime parameters
4. Create a Powershell script to deploy this runbook to the Automation Account
5. Provide monitoring/alerting configuration

---

### Expected Output

- Full `.ps1` runbook file (ready to paste into Automation Account)
- Pre-requisites checklist (permissions, modules, secrets)
- Deployment script (to create/update runbook and schedule)
- Monitoring query (check recent runs, success rate)
- Troubleshooting guide for common failures
