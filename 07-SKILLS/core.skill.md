# Core DevOps Skills

Essential patterns and best practices for all DevOps automation.

## Error Handling & Recovery

- **Try/Catch blocks**: Wrap volatile operations; handle exceptions explicitly
- **Exit codes**: Always return meaningful exit codes (0 = success, 1+ = failure)
- **Retry logic**: Add exponential backoff for transient failures
- **Rollback plans**: Script should undo changes on error when possible
- **Fail fast**: Validate inputs and prerequisites before doing work

## Logging & Observability

- **Timestamps**: Every log entry should have `YYYY-MM-DD HH:MM:SS` timestamp
- **Log levels**: Use INFO (normal), WARN (concerning), ERROR (fatal), DEBUG (verbose)
- **What to log**:
  - Start/end of operation
  - Key decisions and branches taken
  - Parameter values (never secrets)
  - Errors with stack traces
- **Where to log**: Console + file (if long-running)

## Parameters & Configuration

- **No hardcoding**: All values should be parameters or environment variables
- **Defaults sensibly**: Provide defaults for optional parameters
- **Validation**: Check parameters are legit before using them
- **Documentation**: Every parameter needs a comment explaining purpose and format

## Security Best Practices

- **Secrets in parameters**: Accept via `-SecureString` or env vars, never CLI args
- **No logging secrets**: Filter sensitive data from logs
- **Principle of least privilege**: Use minimal required permissions
- **Audit trail**: Log who did what and when
- **Version secrets**: Use KeyVault or similar, not config files

## Code Quality

- **Readable > Clever**: Others (or future you) must understand the code
- **DRY (Don't Repeat Yourself)**: Extract common patterns into functions
- **Comments explain why**: Code shows what; comments explain why
- **Modular design**: One tool = one responsibility
- **Testable functions**: Keep functions pure; easy to unit test

## Git & Version Control

- **Atomic commits**: One logical change per commit
- **Meaningful messages**: Use Conventional Commits (see 00-CORE/git-commit-rules.md)
- **Branches for features**: `feat/new-runbook` not `development`
- **Tag releases**: `v1.0.0` for production-ready scripts
- **Single source of truth**: One repo per project/toolset

## Deployment Patterns

- **Infrastructure as Code**: Script everything; no manual console clicks
- **Idempotent**: Run script multiple times safely (same result each time)
- **Dry-run mode**: Offer `--dry-run` flag to preview changes
- **Health checks**: Post-deployment verification of success
- **Canary deployments**: Test in low-risk environment first

## Documentation

- **README for each project**: What it does, how to use, prerequisites
- **Function documentation**: Every function has a brief comment
- **Examples**: Show real usage with actual commands
- **Troubleshooting**: Common errors and solutions

## Monitoring & Alerts

- **Define success**: What indicates the task worked?
- **Thresholds**: Set alert triggers for anomalies
- **Dashboards**: Collect metrics; visualize trends
- **On-call playbooks**: Runbook for fixing common failures

---

**See Also**: [00-CORE/coding-standards.md](../00-CORE/coding-standards.md) for language-specific examples
