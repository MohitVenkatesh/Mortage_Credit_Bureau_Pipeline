{{ config(materialized='view') }}
-- HMDA reporting is a placeholder. Map and validate required fields with compliance.
SELECT application_id, decision, reason_code, decided_at
FROM {{ ref('gold_underwriting_decisions') }}
