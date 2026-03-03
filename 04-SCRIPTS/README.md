# Scripts Library

Reusable scripts organized by **language** and **purpose**.

## Structure

```
04-SCRIPTS/
├── powershell/
│   ├── modules/    # PowerShell modules (.psm1)
│   ├── snippets/   # Quick code snippets
│   └── tools/      # Complete scripts
├── python/
│   ├── packages/   # Python packages or utilities
│   ├── snippets/   # Quick code snippets
│   └── tools/      # Complete scripts
├── bash/
│   ├── snippets/   # Quick code snippets
│   └── tools/      # Complete scripts
└── sql/
    ├── snippets/   # Quick queries
    └── tools/      # Stored procs, scripts
```

## How to Use Each Subfolder

### modules / packages
**Purpose**: Reusable components you import/source elsewhere

- PowerShell modules (`.psm1`)
- Python utility classes or functions
- SQL stored procedures for inclusion

**Example Usage**:
```powershell
# In another script:
Import-Module ./04-SCRIPTS/powershell/modules/MyModule.psm1
```

### snippets
**Purpose**: Copy-paste code fragments for quick development

- No dependencies assumed
- Minimal; meant to integrate into larger scripts
- Useful for reference and learning

**Example Usage**:
```bash
# Copy a snippet:
cat 04-SCRIPTS/bash/snippets/check-subscription.sh >> my_script.sh
```

### tools
**Purpose**: Production-ready, standalone tools with parameters, error handling, logging

- Self-contained (though may use modules)
- Include help/documentation
- Handle errors gracefully
- Accept parameters (no hardcoding)

**Example Usage**:
```powershell
& .\04-SCRIPTS/powershell/tools/sample-tool.ps1 -SubscriptionId "abc123"
```

## Adding New Scripts

1. **Decide**: Is it a quick snippet, reusable module, or full tool?
2. **Choose folder**: Place in appropriate `<language>/<category>/`
3. **Follow standards**: See `00-CORE/coding-standards.md`
4. **Test locally**: Verify it runs without errors
5. **Commit**: `git add . && git commit -m "feat(tools): add new script"`

## Language-Specific Notes

### PowerShell
- Use `[CmdletBinding()]` for tools
- Document with `<# .SYNOPSIS ... #>`
- Always include error handling with `try/catch`
- Use `Write-Log` function for messaging

### Python
- Use type hints
- Include `if __name__ == "__main__":`
- Use `logging` module
- Make functions testable

### Bash
- Set `set -euo pipefail` at top
- Export functions if sourcing
- Use `log()` function for messaging
- Validate inputs early

### SQL
- Use parameterized queries (no string concatenation)
- Wrap in `BEGIN TRY ... CATCH`
- Include single-line comment header
- Avoid hardcoded values

---

**See Also**: 
- [00-CORE/coding-standards.md](../00-CORE/coding-standards.md) for detailed standards
- [Sample scripts in tools/](./powershell/tools/) for examples
