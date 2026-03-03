# Prompt Template: Generate Project Documentation

## Context

See `07-SKILLS/core.skill.md` for documentation best practices.

## Template

**System Context:**  
You are a technical writer specializing in DevOps and cloud automation documentation. Generate comprehensive, clear project documentation from the provided code and requirements. Target audience: engineers, ops teams, and security reviewers.

---

### Project Details

**Project Name:** `<PROJECT_NAME>`  
**Repository:** `<REPO_URL>` (GitHub, Azure Repos, etc.)  
**Owner Team:** `<TEAM_NAME>`  
**Last Updated:** `<DATE>`  
**Status:** `<PROJECT_STATUS>` (Active, Maintenance, Archived)

### Project Purpose

**Business Goal:** `<BUSINESS_GOAL>` (e.g., Automate SQL MI backup refresh)  
**Technical Scope:** `<TECHNICAL_SCOPE>` (e.g., PowerShell runbooks, Graph API, Azure Automation)  
**Expected Users:** `<USER_COUNT>` engineers, `<OPS_COUNT>` ops staff  
**Compliance:** `<COMPLIANCE_REQS>` (GDPR, SOC2, internal policies)

### Code & Requirements

**Main Components:**
1. Component: `<COMPONENT_1>` (Language: `<LANG>`, File: `<FILE>`, Purpose: `<PURPOSE>`)
2. Component: `<COMPONENT_2>`
3. Component: `<COMPONENT_3>`

**Key Algorithms/Workflows:** `<WORKFLOW_DESCRIPTION>`  
**External Dependencies:** `<DEPENDENCY_LIST>` (Azure SDK, Graph API, databases, etc.)  
**Configuration:** `<CONFIG_DETAILS>` (parameters, environment variables, secrets)

### Deployment & Operations

**Deployment Method:** `<DEPLOYMENT>` (Azure Automation, Azure Functions, Scheduled Task, Manual)  
**Frequency:** `<FREQUENCY>` (Hourly, Daily, On-Demand, Event-driven)  
**Typical Execution Time:** `<EXEC_TIME>` (e.g., 15 minutes)  
**Success Criteria:** `<SUCCESS_CRITERIA>` (e.g., All data loaded, 100 rows, zero errors)  
**Monitoring:** `<MONITORING>` (Application Insights, Log Analytics, email alerts)

### Known Limitations & Future Work

- Limitation: `<LIMITATION_1>`
- Limitation: `<LIMITATION_2>`
- Future: `<FEATURE_1>`
- Future: `<FEATURE_2>`

---

### Documentation Sections Required

1. **README**: Overview, quick start, prerequisites
2. **Architecture**: Diagrams, data flow, component interaction
3. **Installation Guide**: Step-by-step setup
4. **Configuration**: Parameters, environment setup, secrets
5. **API Reference**: Function signatures, parameters, return values
6. **Deployment Guide**: How to deploy to production
7. **Troubleshooting**: Common errors and solutions
8. **Runbooks/Playbooks**: Step-by-step operational procedures
9. **FAQ**: Frequently asked questions
10. **Glossary**: Technical terms and acronyms

---

### Questions for Claude

1. Generate comprehensive documentation (all sections above)
2. Create architecture diagram (Mermaid or ASCII)
3. Provide deployment checklist
4. Write troubleshooting guide for top issues
5. Create operational runbooks for common tasks
6. Suggest monitoring dashboards and alerts

---

### Expected Output

Markdown files organized as:
```
docs/
├── README.md
├── ARCHITECTURE.md
├── INSTALLATION.md
├── CONFIGURATION.md
├── API_REFERENCE.md
├── DEPLOYMENT.md
├── TROUBLESHOOTING.md
├── RUNBOOKS.md
├── FAQ.md
└── GLOSSARY.md
```

All with clear headings, code examples, diagrams, and tables.
