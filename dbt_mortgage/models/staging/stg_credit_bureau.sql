{{ config(materialized='view') }}
SELECT
  APPLICANT_ID AS applicant_id,
  SSN AS ssn,
  FICO_SCORE AS fico_score,
  MONTHLY_DEBT AS monthly_debt,
  CREDIT_REPORT_TIMESTAMP AS credit_report_timestamp,
  INGESTED_AT
FROM {{ source('bronze', 'CREDIT_BUREAU_RAW') }}
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY APPLICANT_ID ORDER BY CREDIT_REPORT_TIMESTAMP DESC, INGESTED_AT DESC
) = 1
