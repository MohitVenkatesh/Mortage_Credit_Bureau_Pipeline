SELECT * FROM {{ ref('gold_underwriting_decisions') }}
WHERE ltv_pct IS NULL OR ltv_pct < 0
