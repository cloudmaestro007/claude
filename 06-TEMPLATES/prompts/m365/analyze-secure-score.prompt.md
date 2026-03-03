# Prompt Template: Analyze Microsoft Secure Score

## Context

See `07-SKILLS/m365.skill.md` and `07-SKILLS/core.skill.md` for reference.

## Template

**System Context:**  
You are an expert M365 security architect. Analyze the provided Secure Score data and recommend prioritized improvements to raise score and reduce risk.

---

### Tenant Details

**Tenant ID:** `<TENANT_ID>`  
**Organization:** `<ORG_NAME>`  
**Current Secure Score:** `<CURRENT_SCORE>` (e.g., 72/100)  
**Peer Average:** `<PEER_AVERAGE>` (e.g., 78/100)  
**Industry:** `<INDUSTRY>` (e.g., Financial Services)  
**Compliance Requirements:** `<COMPLIANCE_REQS>` (GDPR, HIPAA, SOC2, etc.)

### Incomplete Improvement Actions

**Action 1:**  
- **Title:** `<ACTION_TITLE_1>`
- **Current Status:** Not implemented
- **Impact:** `<IMPACT_POINTS>` points
- **Effort:** `<EFFORT_LEVEL>` (Low/Medium/High)

**Action 2:**  
- **Title:** `<ACTION_TITLE_2>`
- **Current Status:** Partially implemented
- **Impact:** `<IMPACT_POINTS>` points
- **Effort:** `<EFFORT_LEVEL>`

**Action 3:**  
- **Title:** `<ACTION_TITLE_3>`
- **Current Status:** Not implemented
- **Impact:** `<IMPACT_POINTS>` points
- **Effort:** `<EFFORT_LEVEL>`

*(Add more actions as needed)*

### Additional Context

**User Base:** `<USER_COUNT>` users  
**Admin Accounts:** `<ADMIN_COUNT>` (licensed O365 admins)  
**Current Policies:**
- MFA enforcement: `<MFA_STATUS>` (None / Conditional Access / Mandatory)
- Legacy authentication: `<LEGACY_AUTH_STATUS>` (Allowed / Blocked)
- Shared mailbox count: `<SHARED_MAILBOX_COUNT>`

---

### Questions for Claude

1. What are the **top 3 highest-impact quick wins** we should implement first?
2. How should we **prioritize** the remaining actions based on risk + effort?
3. What are the **implementation challenges** and mitigation strategies?
4. Provide step-by-step instructions for the highest-priority actions
5. What **metrics** should we track to verify improvements?

---

### Expected Output

- Prioritized action plan (with effort/impact matrix)
- Step-by-step implementation guide for top 5 actions
- PowerShell/Graph API scripts for automation
- Expected score improvement (before/after projections)
- 30/60/90-day roadmap
- Dashboard queries to monitor progress
