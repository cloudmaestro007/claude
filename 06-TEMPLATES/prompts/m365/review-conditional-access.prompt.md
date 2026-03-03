# Prompt Template: Review Conditional Access Policies

## Context

See `07-SKILLS/m365.skill.md` for Conditional Access concepts.

## Template

**System Context:**  
You are an expert Azure AD/Entra ID security architect. Review the Conditional Access policies below and identify gaps, overlaps, and optimization opportunities. Ensure policies are aligned with Zero Trust principles and compliance requirements.

---

### Tenant Details

**Tenant ID:** `<TENANT_ID>`  
**Organization:** `<ORG_NAME>`  
**User Count:** `<USER_COUNT>`  
**Compliance Requirements:** `<COMPLIANCE_REQS>` (GDPR, SOC2, HIPAA, etc.)

### Current Policies

**Policy 1: `<POLICY_NAME_1>`**
- Status: `<ENABLED/REPORT_ONLY/DISABLED>`
- Users/Groups: `<TARGET_USERS>` (e.g., All users, Specific group)
- Cloud Apps: `<CLOUD_APPS>` (e.g., Office 365, specific apps)
- Conditions: Device platform=`<PLATFORM>`, Location=`<LOCATION>`, Client app=`<CLIENT_APP>`
- Controls: `<CONTROLS>` (e.g., Require MFA, Block)

**Policy 2: `<POLICY_NAME_2>`**
- Status: `<ENABLED/REPORT_ONLY/DISABLED>`
- Users/Groups: `<TARGET_USERS>`
- Cloud Apps: `<CLOUD_APPS>`
- Conditions: Device compliance=`<COMPLIANCE>`, Risk level=`<RISK_LEVEL>`
- Controls: `<CONTROLS>`

**Policy 3: `<POLICY_NAME_3>`**
- Status: `<ENABLED/REPORT_ONLY/DISABLED>`
- Users/Groups: `<TARGET_USERS>`
- Cloud Apps: `<CLOUD_APPS>`
- Conditions: `<CONDITIONS>`
- Controls: `<CONTROLS>`

*(Add more policies as needed)*

### Known Issues / Gaps

- `<ISSUE_1>` (e.g., Legacy auth not blocked; risky logins not detected)
- `<ISSUE_2>`
- `<ISSUE_3>`

### Emergency Access Account

- **Account:** `<EMERGENCY_ACCESS_EMAIL>`
- **MFA Status:** Excluded from MFA policies? `<YES/NO>`
- **Exclusion Review:** Last reviewed `<DATE>`

---

### Questions for Claude

1. Are policies **ordered correctly** (most restrictive first)?
2. What **gaps** exist in coverage (e.g., guest access, legacy auth)?
3. Which policies should move from **report-only to blocking**?
4. How do we **exclude emergency access** safely while maintaining security?
5. Provide a **zero-trust implementation roadmap**

---

### Expected Output

- Assessment of current policy effectiveness
- Recommended policy order and refinements
- New policies to implement (with conditions + controls)
- PowerShell/Graph API scripts to deploy/update policies
- Risk matrix (before/after implementation)
- Suggested report-only period + rollout timeline
- Monitoring queries to detect policy violations
