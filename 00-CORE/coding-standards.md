# Coding Standards

**For:** All scripts and tools in Claude-Workspace  
**Applies To:** PowerShell, Python, Bash, SQL

## General Principles

- **Clear > Clever**: Readability first; optimize later
- **Explicit Parameters**: All scripts accept parameters; no hardcoded values
- **Error Handling**: Trap errors; log them; fail gracefully
- **Logging**: Minimal but informative; include timestamps
- **Comments**: Explain *why*, not *what* (code shows what it does)

---

## PowerShell Standards

```powershell
# Header with purpose, parameters, examples
<#
.SYNOPSIS
    Short description

.DESCRIPTION
    Longer description of what this does

.PARAMETER ParameterName
    What this parameter does

.EXAMPLE
    & .\script.ps1 -ParameterName "value"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ParameterName
)

# Logging function
function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] [$Level] $Message"
}

# Always use Try/Catch
try {
    Write-Log "Starting script"
    # Do work
    Write-Log "Completed successfully" "SUCCESS"
}
catch {
    Write-Log "Error: $_" "ERROR"
    exit 1
}
```

## Python Standards

```python
#!/usr/bin/env python3
"""
Module docstring: Purpose and usage.
"""

import logging
import sys
from typing import Optional

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s"
)
logger = logging.getLogger(__name__)

def main(param_name: str) -> int:
    """Main function with type hints."""
    try:
        logger.info("Starting task")
        # Do work
        logger.info("Completed successfully")
        return 0
    except Exception as e:
        logger.error(f"Error: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else "default"))
```

## Bash Standards

```bash
#!/bin/bash
set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Header comment block
# Purpose: Description
# Usage: ./script.sh <arg1> <arg2>

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$1] $2"
}

# Trap errors
trap 'log ERROR "Script failed at line $LINENO"' ERR

# Validate input
if [[ $# -lt 1 ]]; then
    log ERROR "Usage: $0 <argument>"
    exit 1
fi

log INFO "Starting script"
# Do work
log INFO "Completed successfully"
```

## SQL Standards

```sql
-- Purpose: Brief description
-- Params: @Param1 (type), @Param2 (type)
-- Returns: Result set or success/failure

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRY
    -- Parameters with defaults
    DECLARE @Param1 NVARCHAR(255) = 'default_value';
    
    -- Clear, well-formatted queries
    SELECT * FROM [Schema].[Table]
    WHERE [Column] = @Param1
    ORDER BY [DateCreated] DESC;
    
    PRINT 'Query completed successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
```

---

## File Naming Conventions

- **PowerShell**: `kebab-case.ps1`  
  Example: `create-azure-resource.ps1`
- **Python**: `snake_case.py`  
  Example: `create_azure_resource.py`
- **Bash**: `kebab-case.sh`  
  Example: `create-azure-resource.sh`
- **SQL**: `snake_case.sql`  
  Example: `stored_proc_create_resource.sql`

---

## Version Control

- Commit early and often
- Use meaningful commit messages (see `git-commit-rules.md`)
- Never commit secrets; use parameters or `.gitignore`
- Tag releases: `git tag v1.0.0`

---

**See:** `git-commit-rules.md` for commit message standards
