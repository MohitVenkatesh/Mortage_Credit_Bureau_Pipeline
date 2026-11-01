SELECT * FROM {{ ref('gold_underwriting_decisions') }}
WHERE dti_pct IS NULL OR dti_pct < 0
