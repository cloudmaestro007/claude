# Skills Library

Quick reference guides for domain knowledge in Azure, M365, and Automation.

## How to Use

1. **Read the relevant skill file** for your task
2. **Reference it in Claude prompts**: "See 07-SKILLS/azure.skill.md for context"
3. **Extract patterns**: Use bullet points as jumping-off points
4. **Combine skills**: Mix multiple skills for complex problems

## Files

- **core.skill.md**: DevOps fundamentals and best practices
- **azure.skill.md**: Azure Resource Manager, subscriptions, RBAC, common patterns
- **m365.skill.md**: Microsoft 365 governance, compliance, Graph API
- **automation.skill.md**: PowerShell DSC, runbooks, workflows, RPA concepts

## Usage Example

**Scenario**: You need to automate SQL Managed Instance backup refresh.

```bash
# 1. Read relevant skills
cat 07-SKILLS/core.skill.md       # DevOps patterns
cat 07-SKILLS/azure.skill.md      # Azure concepts
cat 07-SKILLS/automation.skill.md # Runbook/workflow patterns

# 2. Use a template with skills context:
# Prompt: "See 07-SKILLS/automation.skill.md and 
#          07-SKILLS/azure.skill.md for context.
#          I need a PowerShell runbook to refresh SQL MI backups..."
```

## Quick Reference

| Skill File | Best For |
|:-----------|:---------|
| core.skill.md | General DevOps workflow, error handling, logging, best practices |
| azure.skill.md | Subscription management, resource groups, RBAC, keyvaults, storage |
| m365.skill.md | Graph API, conditional access, security, compliance, tenants |
| automation.skill.md | Runbooks, PowerShell DSC, scheduled tasks, workflows, RPA |

---

**See Also**:
- [06-TEMPLATES/prompts/](../06-TEMPLATES/prompts/) for prompt templates
- [04-SCRIPTS/](../04-SCRIPTS/) for code examples
