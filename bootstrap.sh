#!/bin/bash
#
# Claude-Workspace Bootstrap Script
# Creates or verifies the complete workspace structure
#
# Usage: ./bootstrap.sh [--verify-only]
# This script is idempotent (safe to run multiple times)
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERIFY_ONLY="${1:-}"

echo "Claude-Workspace Bootstrap Script"
echo "=================================="
echo ""

# Color output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Logging
log_success() { echo -e "${GREEN}✓ $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠ $1${NC}"; }
log_error() { echo -e "${RED}✗ $1${NC}"; }

# Check if directory exists, create if not (idempotent)
ensure_dir() {
    if [[ ! -d "$1" ]]; then
        mkdir -p "$1"
        log_success "Created directory: $1"
    fi
}

# Check if file exists, skip if already present
ensure_file() {
    local file_path="$1"
    local file_name=$(basename "$file_path")
    
    if [[ ! -f "$file_path" ]]; then
        log_warn "File missing: $file_path (manual creation required)"
        return 1
    else
        log_success "File exists: $file_name"
        return 0
    fi
}

# === Directory Structure ===
verify_structure() {
    echo "Verifying directory structure..."
    
    ensure_dir "$SCRIPT_DIR/00-CORE"
    ensure_dir "$SCRIPT_DIR/01-PROJECTS"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/powershell/modules"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/powershell/snippets"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/powershell/tools"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/python/packages"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/python/snippets"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/python/tools"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/bash/snippets"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/bash/tools"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/sql/snippets"
    ensure_dir "$SCRIPT_DIR/04-SCRIPTS/sql/tools"
    ensure_dir "$SCRIPT_DIR/06-TEMPLATES/prompts/azure"
    ensure_dir "$SCRIPT_DIR/06-TEMPLATES/prompts/m365"
    ensure_dir "$SCRIPT_DIR/06-TEMPLATES/prompts/automation"
    ensure_dir "$SCRIPT_DIR/06-TEMPLATES/prompts/documentation"
    ensure_dir "$SCRIPT_DIR/07-SKILLS"
    ensure_dir "$SCRIPT_DIR/99-ARCHIVE"
    
    echo ""
}

# === File Verification ===
verify_files() {
    echo "Verifying key files..."
    
    ensure_file "$SCRIPT_DIR/00-CORE/claude.md"
    ensure_file "$SCRIPT_DIR/00-CORE/coding-standards.md"
    ensure_file "$SCRIPT_DIR/00-CORE/git-commit-rules.md"
    ensure_file "$SCRIPT_DIR/.gitignore"
    ensure_file "$SCRIPT_DIR/README.md"
    ensure_file "$SCRIPT_DIR/Makefile"
    
    local skill_files=(
        "core.skill.md"
        "azure.skill.md"
        "m365.skill.md"
        "automation.skill.md"
    )
    
    for skill in "${skill_files[@]}"; do
        ensure_file "$SCRIPT_DIR/07-SKILLS/$skill"
    done
    
    echo ""
}

# === Tool Verification ===
verify_tools() {
    echo "Checking for required tools..."
    
    local tools=("git" "python3")
    local optional_tools=("az" "pwsh" "tree")
    
    for tool in "${tools[@]}"; do
        if command -v "$tool" &> /dev/null; then
            log_success "$tool is installed"
        else
            log_error "$tool is NOT installed (required)"
            exit 1
        fi
    done
    
    echo ""
    echo "Optional tools:"
    for tool in "${optional_tools[@]}"; do
        if command -v "$tool" &> /dev/null; then
            log_success "$tool is installed"
        else
            log_warn "$tool is not installed (optional)"
        fi
    done
    
    echo ""
}

# === Display Structure ===
show_structure() {
    echo "Final Structure:"
    echo ""
    
    if command -v tree &> /dev/null; then
        tree -L 2 "$SCRIPT_DIR"
    else
        log_warn "tree command not found. Showing directory listing instead..."
        find "$SCRIPT_DIR" -maxdepth 2 -type d ! -path '*/\.*' | sort | sed 's|'$SCRIPT_DIR'||' | head -20
    fi
    
    echo ""
}

# === Main ===
if [[ "$VERIFY_ONLY" == "--verify-only" ]]; then
    echo "[Verification Mode - No changes will be made]"
    echo ""
fi

verify_structure
verify_files
verify_tools
show_structure

echo "=================================="
log_success "Claude-Workspace is ready!"
echo ""
echo "Next steps:"
echo "  1. cd Claude-Workspace"
echo "  2. make check          (verify tools)"
echo "  3. make tree           (show structure)"
echo "  4. make init           (initialize git)"
echo ""
echo "Get started:"
echo "  - Read 00-CORE/claude.md for context"
echo "  - Check 07-SKILLS/*.md for domain knowledge"
echo "  - Use templates in 06-TEMPLATES/prompts/"
echo "  - Copy starter scripts from 04-SCRIPTS/"
echo ""
