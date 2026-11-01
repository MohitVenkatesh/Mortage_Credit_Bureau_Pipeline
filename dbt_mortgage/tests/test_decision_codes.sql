SELECT * FROM {{ ref('gold_underwriting_decisions') }}
WHERE decision NOT IN ('APPROVED', 'DECLINED', 'CO_SIGNER_REQUIRED')
