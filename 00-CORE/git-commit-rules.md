# Git Commit Rules

**Standard:** Conventional Commits (simplified)

## Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

## Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **refactor**: Code refactoring (no feature change)
- **test**: Adding or updating tests
- **chore**: Build, deps, config changes
- **perf**: Performance improvements

## Scope (Optional)

Brief category: `azure`, `m365`, `automation`, `script`, etc.

## Examples

### Good Commits

```
feat(azure): add runbook for SQL MI refresh

This introduces a new PowerShell runbook that handles
automated refresh of SQL Managed Instance backups.

Includes error handling and logging.
Closes #123
```

```
fix(automation): correct Graph API pagination logic

Previously, pagination was not handling empty result sets.
Now checks for null/empty before looping.
```

```
docs(skills): update azure.skill.md with new capabilities
```

```
chore: update dependencies in requirements.txt
```

---

## Guidelines

1. **Keep it short**: Subject line ≤ 50 characters
2. **Imperative mood**: "add", "fix", "refactor" (not "adds", "fixed")
3. **No period at end** of subject
4. **Body**: Explain *why*, not *what* (50-72 characters per line)
5. **Reference issues**: Use `Closes #123` or `Fixes #456`
6. **Atomic commits**: One change per commit (prefer many small commits)

---

## Commands

```bash
# View commit history
git log --oneline

# View detailed commit
git show <commit-hash>

# Amend last commit
git commit --amend

# Prettify log
git log --pretty=format:"%h %ad %s" --date=short
```

---

**Template**: Install a `.gitmessage` in your global config:

```bash
git config --global commit.template ~/.gitmessage
```

Then create `~/.gitmessage`:

```
<type>(<scope>): <subject>

<body>

<footer>
```

---

**See:** https://www.conventionalcommits.org/
