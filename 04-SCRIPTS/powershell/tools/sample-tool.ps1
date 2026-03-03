<#
.SYNOPSIS
    Sample PowerShell tool demonstrating best practices.

.DESCRIPTION
    This is a production-ready PowerShell script template with:
    - Parameter validation
    - Error handling (try/catch)
    - Structured logging
    - Help documentation
    - Exit codes

.PARAMETER ResourceName
    Name of the Azure resource to process (required).

.PARAMETER ResourceGroup
    Azure resource group containing the resource (required).

.PARAMETER SubscriptionId
    Azure subscription ID (optional; defaults to current context).

.PARAMETER Verbose
    Enable verbose logging for troubleshooting.

.EXAMPLE
    & .\sample-tool.ps1 -ResourceName "myresource" -ResourceGroup "rg-prod"

.EXAMPLE
    & .\sample-tool.ps1 -ResourceName "myresource" -ResourceGroup "rg-prod" -Verbose

.NOTES
    Author: DevOps Team
    Version: 1.0.0
    Last Updated: 2026-03-02
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, HelpMessage = "Name of the resource")]
    [ValidateNotNullOrEmpty()]
    [string]$ResourceName,

    [Parameter(Mandatory = $true, HelpMessage = "Azure resource group")]
    [ValidateNotNullOrEmpty()]
    [string]$ResourceGroup,

    [Parameter(Mandatory = $false, HelpMessage = "Azure subscription ID")]
    [string]$SubscriptionId,

    [Parameter(Mandatory = $false, HelpMessage = "Dry-run mode (no changes)")]
    [switch]$DryRun
)

# === Logging Function ===
function Write-Log {
    param(
        [string]$Message,
        [ValidateSet("INFO", "WARN", "ERROR", "DEBUG", "SUCCESS")]
        [string]$Level = "INFO"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $output = "[$timestamp] [$Level] $Message"
    Write-Host $output
    
    # Optional: Write to file
    # $output | Add-Content -Path "./logs/tool.log"
}

# === Error Handler ===
function Handle-Error {
    param([string]$ErrorMessage, [int]$ExitCode = 1)
    Write-Log "FATAL: $ErrorMessage" "ERROR"
    exit $ExitCode
}

# === Validation ===
function Validate-Prerequisites {
    Write-Log "Validating prerequisites..."
    
    # Check if Azure PowerShell is installed
    if (-not (Get-Command -Name "Get-AzResource" -ErrorAction SilentlyContinue)) {
        Handle-Error "Azure PowerShell module not installed. Install with: Install-Module -Name Az"
    }
    
    Write-Log "Prerequisites OK" "SUCCESS"
}

# === Main Logic ===
function Invoke-Main {
    try {
        Write-Log "Starting tool execution"
        
        # Set subscription context
        if ($SubscriptionId) {
            Write-Log "Setting subscription context to: $SubscriptionId"
            $null = Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop
        }
        
        # Validate resource exists
        Write-Log "Checking if resource exists: $ResourceName in $ResourceGroup"
        $resource = Get-AzResource -Name $ResourceName -ResourceGroupName $ResourceGroup -ErrorAction SilentlyContinue
        
        if (-not $resource) {
            Handle-Error "Resource not found: $ResourceName in $ResourceGroup"
        }
        
        Write-Log "Found resource: $($resource.ResourceType)"
        
        # Simulate some work
        if ($DryRun) {
            Write-Log "DRY-RUN: Would process resource $ResourceName" "WARN"
        }
        else {
            Write-Log "Processing resource: $ResourceName"
            # Your actual logic here
            Start-Sleep -Seconds 2  # Simulate work
        }
        
        Write-Log "Tool completed successfully" "SUCCESS"
        return 0
    }
    catch {
        Handle-Error "Exception occurred: $($_.Exception.Message)"
    }
}

# === Entry Point ===
try {
    Write-Log "PowerShell version: $($PSVersionTable.PSVersion.ToString())"
    
    Validate-Prerequisites
    $exitCode = Invoke-Main
    
    exit $exitCode
}
catch {
    Write-Log "Unhandled exception: $_" "ERROR"
    exit 1
}
