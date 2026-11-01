# Architecture

Sources (mortgage JSON + credit bureau CSV) -> Snowflake stage -> Bronze raw -> dbt staging/intermediate -> Silver validation -> Gold underwriting decisions -> dashboard / approved auditor share.

Airflow coordinates readiness and dbt execution. Terraform provisions repeatable Snowflake infrastructure. Monitoring covers ingestion, data quality, transformation and warehouse consumption.
