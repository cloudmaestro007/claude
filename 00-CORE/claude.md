# Claude AI Assistant Configuration

**Workspace:** Claude-Workspace  
**Version:** 1.0  
**Last Updated:** 2026-03-02

## Context & Purpose

This workspace is designed to work with Claude AI for Azure, M365, and Automation DevOps tasks. All prompts, skills, and scripts should reference this context.

## Interaction Model

- **Prompts**: Use templates in `06-TEMPLATES/prompts/` with placeholders for your environment
- **Skills**: Reference skill files when asking Claude for domain-specific guidance
- **Scripts**: Use starter scripts from `04-SCRIPTS/` as boilerplate for production work
- **Archive**: Move completed projects or deprecated tools to `99-ARCHIVE/`

## Environment Setup

Assumes:
- WSL 2 with bash/pwsh available
- Python 3.10+
- PowerShell 7.4+
- Azure CLI (`az`) and Microsoft Graph CLI (`mgc`)
- Git for version control

## Key Principles

1. **Minimal & Clean**: No bloat; every file has a purpose
2. **Modular**: Skills and scripts are independent; mix and match
3. **Production-Ready**: Error handling, logging, parameters built-in
4. **Template-Driven**: Use placeholders for secrets, IDs, names (never hardcode)

## Quick Start

```bash
cd Claude-Workspace
tree -L 2
git status
```

## Folder Legend

| Folder | Purpose |
|--------|---------|
| `00-CORE` | Rules, standards, and this config |
| `01-PROJECTS` | Active project folders |
| `04-SCRIPTS` | Reusable scripts by language/domain |
| `06-TEMPLATES` | Prompt & runbook templates |
| `07-SKILLS` | Domain knowledge reference files |
| `99-ARCHIVE` | Completed or deprecated items |

---

**Next**: Read `README.md` for workspace overview.
