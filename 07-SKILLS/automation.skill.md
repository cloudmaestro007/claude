# Automation & Workflow Skills

Patterns for RPA, runbooks, and DevOps workflows.

## PowerShell Runbooks

- **Execution environment**: Azure Automation Account (managed service)
- **Runtimes**: PowerShell 5.1, 7.2 (choose per runbook)
- **Timeout**: Default 3 hours; max 12 hours
- **Triggers**:
  - Schedule (cron-like)
  - Webhook (HTTP POST)
  - Directly from portal
  - On resource change
- **Logging**: Use `Write-Output` for job output; view in "Output" tab
- **Modules**: Pre-import required modules (Az.*, ExchangeOnlineManagement, etc.)
- **Error handling**: `try/catch` required; errors halt execution

## Hybrid Runbook Workers

- **Purpose**: Run runbooks on on-premises machines or private networks
- **Setup**: VM + Monitoring Agent + Automation extension
- **Benefit**: Access to on-premises resources without VPN
- **Groups**: Organize multiple workers for load distribution
- **Health**: Monitor worker status; replace failed workers
- **Scaling**: Add workers to handle concurrent runbooks

## Scheduled Task Workflows

- **Windows Task Scheduler**: Run scripts on schedule
- **Cron (Linux/Mac)**: Crontab for recurring jobs
- **Trigger options**: Daily, weekly, monthly, on reboot, on login
- **Error handling**: Redirect stdout/stderr to log files
- **Retry logic**: Wrap in bash/PowerShell script with exponential backoff
- **Monitoring**: Check exit codes; alert on failure

## API Workflows & Webhooks

- **Webhook endpoint**: Script listens on HTTP port; triggers on POST
- **Payload**: Pass parameters as JSON body
- **Headers**: Include authorization token or API key
- **Response**: Return status (200 = success, 4xx = client error, 5xx = server error)
- **TLS/SSL**: Always encrypt in production
- **Scaling**: Use load balancer for multiple instances

## State Management

- **Session state**: Store in memory (fast but lost on restart)
- **File state**: Persist to disk (slower, survives restart)
- **Database state**: Central state store (scalable, queryable)
- **Lock mechanisms**: Prevent concurrent modifications
- **Idempotent design**: Tolerate re-execution safely

## Parallel Execution

- **Loop batching**: Process 10 items / second (avoid rate limits)
- **Thread pool**: Limit concurrent jobs (e.g., max 5 parallel operations)
- **Queuing**: Producer adds work; worker processes in order
- **Job tracking**: Unique ID per job; poll for completion
- **Rate limiting**: Respect API throttling; implement exponential backoff

## Data Pipeline Patterns

- **ETL (Extract, Transform, Load)**:
  - Extract: Pull data from source (API, file, database)
  - Transform: Cleanse, enrich, aggregate
  - Load: Write to destination (warehouse, lake, API)
- **Scheduling**: Daily/hourly runs; stagger to avoid conflicts
- **Validation**: Check row counts, schema, data quality before load
- **Dependencies**: Wait for upstream pipelines to complete
- **Rollback**: Keep staging area; swap on success only

## Error Handling in Workflows

- **Trap errors**: Distinguish between transient (retry) and fatal (alert)
- **Exponential backoff**: 1s, 2s, 4s, 8s, ... up to max
- **Circuit breaker**: After N failures, stop retrying; alert ops
- **Graceful degradation**: Continue partial processing if some items fail
- **Alerts**: Slack, Teams, email on critical errors

## Monitoring & Observability

- **Metrics**: Execution time, success rate, error rates
- **Alerts**: Threshold-based (execution time > 5 min, failure rate > 10%)
- **Dashboards**: Real-time view of running jobs, historical trends
- **Logs**: Centralize to Application Insights, Log Analytics, Splunk
- **SLA tracking**: Define target success rate and MTTR (mean time to recovery)

## Security in Workflows

- **Credentials**: Store in KeyVault; retrieve at runtime (not in config)
- **Service principal**: Use least-privilege app registration
- **Managed identity**: For Azure resources (zero credential management)
- **Audit logs**: Track who triggered what and when
- **Encryption**: TLS for transit, encryption at rest for sensitive data
- **Secrets rotation**: Automate secret renewal (handle grace period)

## Backup & Disaster Recovery

- **Backup frequency**: Critical jobs daily; non-critical weekly
- **Recovery plan**: How to restore failed state from backup
- **RTO (Recovery Time Objective)**: Max acceptable downtime
- **RPO (Recovery Point Objective)**: Max data loss (e.g., last hour)
- **Testing**: Monthly DR drills; document recovery steps

---

**See Also**: 
- [06-TEMPLATES/prompts/automation/](../06-TEMPLATES/prompts/automation/) for automation prompt templates
- [04-SCRIPTS/powershell/tools/](../04-SCRIPTS/powershell/tools/) for runbook examples
