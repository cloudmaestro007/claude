# Prompt Templates Library

Reusable prompt templates for Claude, organized by domain. Each template includes **placeholders** (e.g., `<SUBSCRIPTION_ID>`) that you customize for your environment.

## How to Use

1. **Copy a template** from the relevant domain folder
2. **Replace all placeholders** with your actual values:
   - `<SUBSCRIPTION_ID>` → Your Azure subscription ID
   - `<TENANT_ID>` → Your Microsoft 365 tenant ID
   - `<RESOURCE_GROUP>` → Your resource group name
   - etc.
3. **Paste into Claude** and ask your question

## Folder Structure

```
06-TEMPLATES/prompts/
├── azure/              # Azure Resource Manager, subscription tasks
├── m365/               # Microsoft 365 governance, security
├── automation/         # RPA, runbooks, workflows
└── documentation/      # Technical writing, knowledge management
```

## Template Files

### Azure
- `review-azure-architecture.prompt.md`  
  Review design and suggest improvements

- `generate-runbook-sqlmi-refresh.prompt.md`  
  Generate PowerShell runbook for SQL Managed Instance backup refresh

### Microsoft 365
- `analyze-secure-score.prompt.md`  
  Analyze Microsoft Secure Score and recommend fixes

- `review-conditional-access.prompt.md`  
  Review Conditional Access policies for security best practices

### Automation
- `generate-graph-tool.prompt.md`  
  Generate Python tool for Microsoft Graph API interactions

### Documentation
- `project-doc-generator.prompt.md`  
  Generate project documentation from code/requirements

## Common Placeholders

| Placeholder | Example | Description |
|-------------|---------|-------------|
| `<SUBSCRIPTION_ID>` | `a1b2c3d4-e5f6-...` | Azure subscription GUID |
| `<TENANT_ID>` | `x1y2z3a4-b5c6-...` | Microsoft 365 tenant GUID |
| `<RESOURCE_GROUP>` | `rg-prod-eastus` | Azure resource group name |
| `<APP_ID>` | `client-app-id` | Azure AD app registration ID |
| `<STORAGE_ACCOUNT>` | `mystgacc` | Azure Storage account name |
| `<RUNBOOK_NAME>` | `Refresh-SQLMIBackup` | Automation account runbook name |
| `<SCOPE>` | Azure resource path | Management scope |
| `<API_ENDPOINT>` | `https://graph.microsoft.com/v1.0` | Graph API endpoint |
| `<EMAIL_ADDRESS>` | `admin@contoso.com` | User email or service account |
| `<ENVIRONMENT>` | `Production` / `Staging` / `Dev` | Deployment environment |

## Pro Tips

1. **Keep templates generic**: Don't hardcode sensitive values; use placeholders
2. **Version your prompts**: When you refine a prompt, tag it:
   ```bash
   git tag prompt/azure-architecture-v2
   ```
3. **Reference skills**: In prompt, mention "See 07-SKILLS/azure.skill.md for context"
4. **Share & iterate**: Save good Claude responses as case studies for future reference
5. **Reuse patterns**: Similar problems? Copy template and adjust context

## Example Workflow

```bash
# 1. Copy template
cp 06-TEMPLATES/prompts/azure/review-azure-architecture.prompt.md /tmp/my-prompt.md

# 2. Edit placeholders
sed -i 's/<SUBSCRIPTION_ID>/a1b2c3d4-e5f6.../g' /tmp/my-prompt.md
sed -i 's/<RESOURCE_GROUP>/rg-prod-eastus/g' /tmp/my-prompt.md

# 3. View and copy to Claude
cat /tmp/my-prompt.md

# 4. Get Claude's response, refine if needed
# 5. Archive if useful:
cp /tmp/my-prompt.md 99-ARCHIVE/prompts/my-prompt-v1.md
git add 99-ARCHIVE/prompts/my-prompt-v1.md
git commit -m "docs: archive successful prompt for reference"
```

---

**See Also**:
- [07-SKILLS/](../07-SKILLS/) for domain knowledge reference
- [00-CORE/claude.md](../00-CORE/claude.md) for workspace context
