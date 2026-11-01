# Data flow

1. Generate or receive source JSON and CSV.
2. Land files in the approved cloud bucket.
3. Load raw payloads to Bronze with source file and ingestion timestamp.
4. Parse and standardize in dbt staging.
5. Join by applicant_id; preserve unmatched applications.
6. Route invalid/missing required data to technical rejections.
7. Calculate LTV and DTI; apply underwriting policy.
8. Publish decisions and reason codes to Gold.
9. Expose approved metrics through dashboard and restricted auditor views.
