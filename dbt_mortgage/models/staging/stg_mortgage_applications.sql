{{ config(materialized='view') }}
SELECT
  RAW_RECORD:application_id::STRING AS application_id,
  RAW_RECORD:applicant_id::STRING AS applicant_id,
  RAW_RECORD:applicant_name::STRING AS applicant_name,
  RAW_RECORD:ssn::STRING AS ssn,
  RAW_RECORD:loan_amount::NUMBER(14,2) AS loan_amount,
  RAW_RECORD:property_value::NUMBER(14,2) AS property_value,
  RAW_RECORD:monthly_gross_income::NUMBER(14,2) AS monthly_gross_income,
  RAW_RECORD:application_timestamp::TIMESTAMP_NTZ AS application_timestamp,
  SOURCE_FILE,
  INGESTED_AT
FROM {{ source('bronze', 'MORTGAGE_APPLICATIONS_RAW') }}
