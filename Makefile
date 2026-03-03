.PHONY: help check tree init clean

# Claude-Workspace Makefile
# Quick commands for workspace setup and verification

help:
	@echo "Claude-Workspace Makefile"
	@echo ""
	@echo "Available commands:"
	@echo "  make check       - Verify required tools exist"
	@echo "  make tree        - Display directory tree"
	@echo "  make init        - Initialize git repository"
	@echo "  make clean       - Remove temporary files and logs"
	@echo "  make status      - Show git status"
	@echo ""

check:
	@echo "Verifying required tools..."
	@echo ""
	@command -v git >/dev/null 2>&1 && echo "✓ git" || (echo "✗ git NOT FOUND"; exit 1)
	@command -v python3 >/dev/null 2>&1 && echo "✓ python3" || (echo "✗ python3 NOT FOUND"; exit 1)
	@command -v az >/dev/null 2>&1 && echo "✓ az CLI" || echo "⚠ az CLI not found (optional for Azure work)"
	@command -v pwsh >/dev/null 2>&1 && echo "✓ PowerShell 7+" || echo "⚠ PowerShell not found (optional for PS scripts)"
	@echo ""
	@echo "All critical tools present!"

tree:
	@echo "Claude-Workspace Directory Structure:"
	@echo ""
	@if command -v tree >/dev/null 2>&1; then \
		tree -L 3 -I '__pycache__|*.pyc|.git'; \
	else \
		echo "Note: 'tree' command not available. Install with: sudo apt-get install tree"; \
		echo ""; \
		find . -type d -not -path '*/\.*' | sort | sed 's|^\./||' | awk 'NR==1{print "."} NR>1{depth=gsub(/\//, "/", $$0); for(i=0; i<depth; i++) printf "  "; print "├── " $$0}' | head -50; \
	fi

init:
	@echo "Initializing git repository..."
	@if [ -d .git ]; then \
		echo "Git already initialized."; \
	else \
		git init; \
		git add .; \
		git commit -m "init: create Claude-Workspace bootstrap"; \
		echo ""; \
		echo "✓ Git repository initialized!"; \
		git log --oneline | head -5; \
	fi

status:
	@git status

clean:
	@echo "Cleaning temporary files..."
	@find . -type f -name "*.log" -delete
	@find . -type f -name "*.tmp" -delete
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	@echo "✓ Cleanup complete"

# Development targets (optional)
.PHONY: lint format test

lint:
	@echo "Running linters..."
	@echo "PS: Consider adding pylint, shellcheck, flake8 hooks"

format:
	@echo "Code formatting..."
	@echo "PS: Consider adding black, prettier hooks"

test:
	@echo "Running tests..."
	@echo "PS: Add unit tests in project folder"
