#!/usr/bin/env python3
"""
Sample Python tool demonstrating best practices.

This is a production-ready Python script template with:
- Type hints
- Structured logging
- Error handling (try/except)
- Argument parsing
- Exit codes
- Docstrings
"""

import argparse
import logging
import sys
from pathlib import Path
from typing import Optional


# === Logging Setup ===
def setup_logging(verbose: bool = False) -> logging.Logger:
    """Configure structured logging."""
    level = logging.DEBUG if verbose else logging.INFO
    
    logging.basicConfig(
        level=level,
        format="%(asctime)s [%(levelname)s] %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S"
    )
    
    return logging.getLogger(__name__)


# === Validation ===
def validate_prerequisites(logger: logging.Logger) -> bool:
    """Validate that required prerequisites exist."""
    logger.info("Validating prerequisites...")
    
    # Check Python version
    if sys.version_info < (3, 10):
        logger.error("Python 3.10+ required")
        return False
    
    logger.info("Prerequisites OK")
    return True


# === Main Logic ===
def process_resource(resource_name: str, resource_group: str, dry_run: bool = False) -> int:
    """
    Process an Azure resource.
    
    Args:
        resource_name: Name of the resource
        resource_group: Azure resource group
        dry_run: If True, don't make changes
        
    Returns:
        Exit code (0 = success, 1+ = failure)
    """
    logger = logging.getLogger(__name__)
    
    try:
        logger.info(f"Processing resource: {resource_name} in {resource_group}")
        
        # Validate inputs
        if not resource_name or not resource_group:
            logger.error("Resource name and group are required")
            return 1
        
        if dry_run:
            logger.warning(f"DRY-RUN: Would process {resource_name}")
        else:
            logger.info(f"Executing: {resource_name}")
            # Your actual logic here
            pass
        
        logger.info("Processing completed successfully")
        return 0
        
    except Exception as e:
        logger.error(f"Exception occurred: {e}", exc_info=True)
        return 1


# === CLI Argument Parsing ===
def parse_arguments() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Sample Python tool for Azure resource processing",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python sample_tool.py -r myresource -g rg-prod
  python sample_tool.py -r myresource -g rg-prod --dry-run --verbose
        """
    )
    
    parser.add_argument(
        "-r", "--resource",
        required=True,
        help="Name of the Azure resource"
    )
    
    parser.add_argument(
        "-g", "--resource-group",
        required=True,
        help="Azure resource group containing the resource"
    )
    
    parser.add_argument(
        "-s", "--subscription",
        required=False,
        help="Azure subscription ID (optional)"
    )
    
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview changes without making them"
    )
    
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable verbose logging (DEBUG level)"
    )
    
    return parser.parse_args()


# === Entry Point ===
def main() -> int:
    """Main entry point."""
    args = parse_arguments()
    logger = setup_logging(verbose=args.verbose)
    
    try:
        logger.info(f"Python {sys.version.split()[0]}")
        
        if not validate_prerequisites(logger):
            return 1
        
        exit_code = process_resource(
            resource_name=args.resource,
            resource_group=args.resource_group,
            dry_run=args.dry_run
        )
        
        return exit_code
        
    except KeyboardInterrupt:
        logger.warning("Interrupted by user")
        return 130
    except Exception as e:
        logger.error(f"Unhandled exception: {e}", exc_info=True)
        return 1


if __name__ == "__main__":
    sys.exit(main())
