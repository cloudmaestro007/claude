# Claude-Workspace

A minimal, modular DevOps workspace for Azure, M365, and Automation tasks with Claude AI.

## 🗂️ Structure

```
Claude-Workspace/
├── 00-CORE/              # Rules, standards, and workspace config
│   ├── claude.md         # AI context & interaction model
│   ├── coding-standards.md
│   └── git-commit-rules.md
├── 01-PROJECTS/          # Active project folders (user-created)
├── 04-SCRIPTS/           # Reusable scripts by language
│   ├── powershell/
│   ├── python/
│   ├── bash/
│   └── sql/
├── 06-TEMPLATES/prompts/ # Prompt templates with placeholders
│   ├── azure/
│   ├── m365/
│   ├── automation/
│   └── documentation/
├── 07-SKILLS/            # Domain knowledge reference files
├── 99-ARCHIVE/           # Completed or deprecated items
├── .gitignore            # Git-safe for Azure/M365 work
├── Makefile              # Quick commands
└── README.md             # This file
```

## 🚀 Quick Start

### 1. Verify Environment

```bash
cd Claude-Workspace
make check
```

This verifies required tools: `git`, `python3`, `az`, `pwsh`

### 2. View Workspace Tree

```bash
tree -L 2
# or
make tree
```

### 3. Echo Key Files

```bash
cat 00-CORE/claude.md
cat 00-CORE/coding-standards.md
cat 00-CORE/git-commit-rules.md
```

### 4. Start a Project

```bash
mkdir 01-PROJECTS/my-project
# Add your project files here
```

### 5. Use Prompt Templates

```bash
cat 06-TEMPLATES/prompts/azure/review-azure-architecture.prompt.md
# Edit with your variables: <SUBSCRIPTION_ID>, <RESOURCE_GROUP>, etc.
```

### 6. Use Starter Scripts

```bash
cp 04-SCRIPTS/python/tools/sample_tool.py 04-SCRIPTS/python/tools/my_tool.py
# Edit and customize
```

## 📋 How to Use Each Section

### 00-CORE

- **claude.md**: AI interaction context—share this when asking Claude for workspace-aware help
- **coding-standards.md**: Language-specific standards (PS7, Python3, Bash, T-SQL)
- **git-commit-rules.md**: Conventional Commits format for clean history

### 04-SCRIPTS

Organized by language with subfolders:
- `modules/packages/`: Reusable modules or packages
- `snippets/`: Quick code snippets (copy-paste)
- `tools/`: Complete, production-ready tools

Each starter tool includes:
- Clear parameters
- Error handling
- Logging
- Example usage

### 06-TEMPLATES/prompts

Prompt templates in Markdown with **placeholders** like:
- `<SUBSCRIPTION_ID>`
- `<TENANT_ID>`
- `<RESOURCE_GROUP>`
- `<APP_ID>`

Copy a template, fill in your values, and paste into Claude.

### 07-SKILLS

Quick reference files for domain knowledge:
- **core.skill.md**: DevOps fundamentals
- **azure.skill.md**: Azure-specific patterns
- **m365.skill.md**: Microsoft 365 automation
- **automation.skill.md**: RPA, runbooks, workflows

Share relevant skill files when asking Claude for guidance.

## 🔧 Makefile Commands

```bash
make check      # Verify required tools exist
make tree       # Show directory tree
make init       # Initialize git repo (if needed)
make help       # Show all available commands
```

## 📝 Git Workflow

```bash
# Initialize (first time only)
git init
git add .
git commit -m "init: create Claude-Workspace bootstrap"

# Add a feature
git checkout -b feat/new-azure-runbook
# ... edit files ...
git add .
git commit -m "feat(azure): add runbook for SQL MI refresh"
git push origin feat/new-azure-runbook

# Use conventional commits! See 00-CORE/git-commit-rules.md
```

## 💡 Pro Tips

1. **Use placeholders in prompts**: Never hardcode `<SUBSCRIPTION_ID>` in templates—keep them generic
2. **Keep scripts small**: One tool = one file; compose in projects
3. **Version your templates**: If a prompt works well, tag it: `git tag template/azure-architecture-v1`
4. **Archive early**: Move old projects to `99-ARCHIVE/` to keep workspace clean
5. **Reference skills in prompts**: Prefix prompt with "See 07-SKILLS/azure.skill.md for context"

## 🛠️ Environment Assumptions

- **OS**: WSL 2, Linux, or macOS
- **Shell**: Bash 5+
- **PowerShell**: 7.4+ (pwsh)
- **Python**: 3.10+
- **Azure**: `az` CLI installed
- **M365**: Microsoft Graph CLI (`mgc`) or `msgraph-beta-sdk`

## 📚 Next Steps

1. Read [00-CORE/claude.md](00-CORE/claude.md) for AI context
2. Review [00-CORE/coding-standards.md](00-CORE/coding-standards.md) for code style
3. Check [07-SKILLS/core.skill.md](07-SKILLS/core.skill.md) for fundamentals
4. Browse [06-TEMPLATES/prompts/](06-TEMPLATES/prompts/) for prompt examples
5. Copy starter tools from [04-SCRIPTS/](04-SCRIPTS/) and customize

## 📞 Support

- **Questions on setup?** Check [00-CORE/](00-CORE/)
- **Need a prompt?** See [06-TEMPLATES/prompts/](06-TEMPLATES/prompts/)
- **Script help?** Reference [00-CORE/coding-standards.md](00-CORE/coding-standards.md)
- **Skill guidance?** Read relevant `.skill.md` file in [07-SKILLS/](07-SKILLS/)

---

**Version:** 1.0  
**Last Updated:** 2026-03-02  
**License:** MIT (if publishing)
