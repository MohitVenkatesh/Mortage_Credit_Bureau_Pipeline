{{ config(materialized='view') }}
SELECT *,
  CASE
    WHEN application_id IS NULL THEN 'MISSING_APPLICATION_ID'
    WHEN applicant_id IS NULL THEN 'MISSING_APPLICANT_ID'
    WHEN property_value IS NULL OR property_value <= 0 THEN 'INVALID_PROPERTY_VALUE'
    WHEN monthly_gross_income IS NULL OR monthly_gross_income <= 0 THEN 'INVALID_GROSS_INCOME'
    WHEN fico_score IS NULL THEN 'MISSING_FICO_SCORE'
    WHEN loan_amount IS NULL OR loan_amount <= 0 THEN 'INVALID_LOAN_AMOUNT'
    WHEN monthly_debt IS NULL OR monthly_debt < 0 THEN 'INVALID_MONTHLY_DEBT'
    ELSE NULL
  END AS technical_rejection_reason
FROM {{ ref('int_applicant_join') }}
