#!/bin/bash
#
# Sample Bash tool demonstrating best practices.
#
# This is a production-ready bash script template with:
# - Error trapping (set -e, set -u, set -o pipefail)
# - Structured logging
# - Input validation
# - Help documentation
# - Exit codes
#
# Usage: ./sample-tool.sh --resource <name> --resource-group <group>
#

set -euo pipefail  # Exit on error, undefined vars, pipe failures
IFS=$'\n\t'       # Safer IFS for word splitting

# === Configuration ===
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="$(basename "$0")"
LOG_LEVEL="${LOG_LEVEL:-INFO}"


# === Logging Functions ===
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" >&2
}

log_info() { log "INFO" "$@"; }
log_warn() { log "WARN" "$@"; }
log_error() { log "ERROR" "$@"; }
log_success() { log "SUCCESS" "$@"; }
log_debug() { [[ "$LOG_LEVEL" == "DEBUG" ]] && log "DEBUG" "$@" || true; }


# === Error Handler ===
error_exit() {
    local message="${1:-Unknown error}"
    local exit_code="${2:-1}"
    log_error "FATAL: $message"
    exit "$exit_code"
}

# Trap errors and print line number
trap 'error_exit "Script failed at line $LINENO" 1' ERR


# === Validation ===
validate_prerequisites() {
    log_info "Validating prerequisites..."
    
    # Check if az CLI is installed
    if ! command -v az &> /dev/null; then
        error_exit "Azure CLI not installed. Install from: https://aka.ms/azurecli"
    fi
    
    log_info "Prerequisites OK"
}

validate_inputs() {
    local resource_name="$1"
    local resource_group="$2"
    
    if [[ -z "$resource_name" ]]; then
        error_exit "Resource name is required"
    fi
    
    if [[ -z "$resource_group" ]]; then
        error_exit "Resource group is required"
    fi
    
    log_debug "Inputs validated: resource=$resource_name, group=$resource_group"
}


# === Main Logic ===
process_resource() {
    local resource_name="$1"
    local resource_group="$2"
    local dry_run="${3:-false}"
    
    log_info "Processing resource: $resource_name in $resource_group"
    
    if [[ "$dry_run" == "true" ]]; then
        log_warn "DRY-RUN: Would process $resource_name"
    else {
        log_info "Executing resource processing..."
        # Your actual logic here
        sleep 1
    }
    fi
    
    log_success "Processing completed successfully"
}


# === Help Documentation ===
show_help() {
    cat << EOF
Usage: $SCRIPT_NAME [OPTIONS]

OPTIONS:
    -r, --resource <name>       Resource name (required)
    -g, --resource-group <name> Resource group (required)
    -s, --subscription <id>     Subscription ID (optional)
    --dry-run                   Preview changes without applying
    --verbose                   Enable verbose logging
    -h, --help                  Show this help message

EXAMPLES:
    # Basic usage
    $SCRIPT_NAME -r myresource -g rg-prod
    
    # With dry-run
    $SCRIPT_NAME -r myresource -g rg-prod --dry-run
    
    # With verbose logging
    $SCRIPT_NAME -r myresource -g rg-prod --verbose

EOF
}


# === Argument Parsing ===
parse_arguments() {
    local resource_name=""
    local resource_group=""
    local subscription_id=""
    local dry_run="false"
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r|--resource)
                resource_name="$2"
                shift 2
                ;;
            -g|--resource-group)
                resource_group="$2"
                shift 2
                ;;
            -s|--subscription)
                subscription_id="$2"
                shift 2
                ;;
            --dry-run)
                dry_run="true"
                shift
                ;;
            --verbose)
                LOG_LEVEL="DEBUG"
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # Export for use in functions
    export RESOURCE_NAME="$resource_name"
    export RESOURCE_GROUP="$resource_group"
    export SUBSCRIPTION_ID="$subscription_id"
    export DRY_RUN="$dry_run"
}


# === Entry Point ===
main() {
    local exit_code=0
    
    log_info "Starting $SCRIPT_NAME"
    
    # Parse arguments
    parse_arguments "$@"
    
    # Validate inputs
    validate_inputs "$RESOURCE_NAME" "$RESOURCE_GROUP"
    validate_prerequisites
    
    # Process resource
    process_resource "$RESOURCE_NAME" "$RESOURCE_GROUP" "$DRY_RUN"
    
    log_success "Script completed successfully"
    return "$exit_code"
}


# Run main function if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
