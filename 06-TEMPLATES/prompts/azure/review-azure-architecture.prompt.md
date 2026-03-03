# Prompt Template: Review Azure Architecture

## Context

See `07-SKILLS/azure.skill.md` and `07-SKILLS/core.skill.md` for reference.

## Template

**System Context:**  
You are a senior Azure DevOps architect. Review the architecture description below and identify improvement opportunities related to security, scalability, cost, and operational excellence.

---

### Architecture Details

**Subscription ID:** `<SUBSCRIPTION_ID>`  
**Tenant ID:** `<TENANT_ID>`  
**Primary Region:** `<REGION>` (e.g., eastus)  
**Environment:** `<ENVIRONMENT>` (Dev/Test/Prod)

**Current Resources:**
- Resource Group: `<RESOURCE_GROUP>`
- Storage Account: `<STORAGE_ACCOUNT>` (tier: `<STORAGE_TIER>`)
- SQL Server / Managed Instance: `<SQL_SERVER>`
- Automation Account: `<AUTOMATION_ACCOUNT>`
- Key Vault: `<KEY_VAULT_NAME>`
- Virtual Network: `<VNET_NAME>` (subnets: `<SUBNET_COUNT>`)

**Traffic Pattern:**
- Estimated daily transactions: `<DAILY_TRANSACTIONS>`
- Peak concurrent users: `<PEAK_USERS>`
- Data growth per month: `<DATA_GROWTH_GB>` GB

**Current Challenges:**
1. `<CHALLENGE_1>`
2. `<CHALLENGE_2>`
3. `<CHALLENGE_3>`

**Compliance Requirements:** `<COMPLIANCE_REQS>` (GDPR, HIPAA, SOC2, etc.)

---

### Questions for Claude

1. How can we improve **high availability and disaster recovery**?
2. Are there **cost optimization** opportunities?
3. What **security hardening** would you recommend?
4. How should we structure **RBAC** for this workload?
5. What's the best **monitoring and alerting** strategy?

---

### Expected Output

- Detailed assessment of current architecture
- Prioritized list of improvements (quick wins + long-term)
- Estimated impact (cost, security, performance)
- Implementation roadmap with effort estimates
- Sample scripts or configurations for key changes
