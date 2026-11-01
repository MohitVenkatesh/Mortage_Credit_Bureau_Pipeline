{{ config(materialized='view') }}
SELECT
  a.application_id, a.applicant_id, a.applicant_name, a.ssn,
  a.loan_amount, a.property_value, a.monthly_gross_income,
  c.fico_score, c.monthly_debt,
  a.application_timestamp, c.credit_report_timestamp
FROM {{ ref('stg_mortgage_applications') }} a
LEFT JOIN {{ ref('stg_credit_bureau') }} c USING (applicant_id)
