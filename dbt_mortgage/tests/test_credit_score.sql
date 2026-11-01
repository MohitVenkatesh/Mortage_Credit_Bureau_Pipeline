SELECT * FROM {{ ref('gold_underwriting_decisions') }}
WHERE fico_score NOT BETWEEN 300 AND 850
