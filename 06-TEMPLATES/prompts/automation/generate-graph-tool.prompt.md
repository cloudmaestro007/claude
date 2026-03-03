# Prompt Template: Generate Microsoft Graph Tool

## Context

See `07-SKILLS/m365.skill.md` and `07-SKILLS/automation.skill.md` for reference.

## Template

**System Context:**  
You are an expert Python developer for Microsoft 365 automation. Generate a production-ready Python tool that interacts with Microsoft Graph API. Include error handling, logging, pagination, and rate-limit handling.

---

### Tool Requirements

**Purpose:** `<TOOL_PURPOSE>` (e.g., Export all users with MFA status, Generate compliance report)

**Tenant ID:** `<TENANT_ID>`  
**Subscription:** Azure subscription for authentication  
**Output Format:** `<OUTPUT_FORMAT>` (CSV, JSON, database insert, email)

### API Calls Required

**API 1:**
- Endpoint: `<ENDPOINT_1>` (e.g., /users)
- Method: GET
- Scopes: `<SCOPE_1>` (e.g., User.Read.All)
- Filters: `<FILTERS>` (e.g., accountEnabled eq true)

**API 2:**
- Endpoint: `<ENDPOINT_2>`
- Method: GET/POST
- Scopes: `<SCOPE_2>`
- Filters: `<FILTERS>`

*(Add more API calls as needed)*

### Data Processing

- **Input:** `<INPUT_SOURCE>` (e.g., CSV file, interactive, database query)
- **Transform:** `<TRANSFORMATION_LOGIC>` (filter, enrich, aggregate, join)
- **Output:** Save to `<OUTPUT_LOCATION>` (file, blob storage, email)
- **Records per run:** Expect `<EXPECTED_RECORD_COUNT>` records

### Authentication Method

- **Type:** `<AUTH_TYPE>` (Service Principal / Managed Identity / Interactive)
- **Client ID:** `<CLIENT_ID>` (from Azure AD app registration)
- **Tenant ID:** `<TENANT_ID>`
- **Secret location:** `<SECRET_LOCATION>` (KeyVault secret name or env var)

### Error Handling & Retries

- **Transient errors** (429, 503, timeout): Retry with exponential backoff
- **Auth errors** (401, 403): Alert and halt
- **Data errors** (invalid record): Log and continue
- **Max retries:** `<MAX_RETRIES>` (default 3)

### Output & Logging

- **Log file:** `<LOG_FILE_PATH>` (e.g., ./logs/tool_<date>.log)
- **Log level:** `<LOG_LEVEL>` (INFO, DEBUG, WARNING)
- **Report email:** Send summary to `<REPORT_EMAIL>`

---

### Questions for Claude

1. Generate the complete Python script with all functions
2. Provide authentication setup (service principal registration)
3. Include retry/rate-limit handling with exponential backoff
4. Add pagination handling for large result sets
5. Provide unit test examples
6. Include deployment instructions (Docker, Azure Function, local)

---

### Expected Output

- Full `.py` tool file (ready to run)
- `requirements.txt` with all dependencies
- Azure AD app registration script
- Sample `.env` file for configuration
- Unit tests (`test_tool.py`)
- Deployment guide (Docker, Functions, local)
- Usage examples and output samples
