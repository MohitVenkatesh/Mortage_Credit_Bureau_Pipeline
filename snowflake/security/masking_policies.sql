-- Example policy: analysts see a masked token; authorized compliance role may see cleartext.
CREATE OR REPLACE MASKING POLICY MORTGAGE_DB.GOLD.SSN_MASK
AS (VAL STRING) RETURNS STRING ->
  CASE WHEN CURRENT_ROLE() IN ('MORTGAGE_COMPLIANCE_ROLE') THEN VAL
       ELSE '***-**-' || RIGHT(VAL, 4) END;
-- Apply only after validating role names and governance requirements.
