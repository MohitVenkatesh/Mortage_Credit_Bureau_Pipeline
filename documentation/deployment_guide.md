# Deployment guide

1. Create Snowflake database, schemas and warehouses.
2. Configure secure storage integration and external stage.
3. Create file formats and Bronze tables.
4. Load source data and validate file-load history.
5. Configure dbt profile locally using environment variables.
6. Run `dbt debug`, `dbt build` and review test results.
7. Configure Airflow connections, variables and source readiness sensors.
8. Apply Terraform only after reviewing `terraform plan` and environment-specific values.
9. Deploy dashboard with a read-only Snowflake role.
10. Validate alerts, access policies, retention and audit requirements before production.
