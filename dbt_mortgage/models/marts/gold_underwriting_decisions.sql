{{ config(materialized='table') }}
WITH valid AS (
  SELECT *,
    loan_amount / NULLIF(property_value, 0) * 100 AS ltv_pct,
    monthly_debt / NULLIF(monthly_gross_income, 0) * 100 AS dti_pct
  FROM {{ ref('int_data_validation') }}
  WHERE technical_rejection_reason IS NULL
)
SELECT
  application_id, applicant_id,
  ROUND(ltv_pct, 2) AS ltv_pct,
  ROUND(dti_pct, 2) AS dti_pct,
  fico_score,
  CASE
    WHEN ltv_pct > 95 THEN 'DECLINED'
    WHEN dti_pct > 43 THEN 'DECLINED'
    WHEN fico_score < 620 THEN 'DECLINED'
    WHEN fico_score BETWEEN 620 AND 660 AND dti_pct > 36 THEN 'CO_SIGNER_REQUIRED'
    ELSE 'APPROVED'
  END AS decision,
  CASE
    WHEN ltv_pct > 95 THEN 'DECLINED_LTV_EXCEEDED'
    WHEN dti_pct > 43 THEN 'DECLINED_DTI_EXCEEDED'
    WHEN fico_score < 620 THEN 'DECLINED_FICO_BELOW_MINIMUM'
    WHEN fico_score BETWEEN 620 AND 660 AND dti_pct > 36 THEN 'CO_SIGNER_REQUIRED'
    ELSE 'APPROVED'
  END AS reason_code,
  CURRENT_TIMESTAMP() AS decided_at
FROM valid
