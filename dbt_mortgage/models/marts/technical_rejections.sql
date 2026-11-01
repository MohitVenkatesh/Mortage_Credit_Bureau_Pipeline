{{ config(materialized='table') }}
SELECT
  application_id, applicant_id,
  technical_rejection_reason AS rejection_reason,
  CURRENT_TIMESTAMP() AS rejected_at
FROM {{ ref('int_data_validation') }}
WHERE technical_rejection_reason IS NOT NULL
