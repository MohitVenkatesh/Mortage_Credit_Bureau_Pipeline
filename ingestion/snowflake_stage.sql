USE DATABASE MORTGAGE_DB;
CREATE SCHEMA IF NOT EXISTS BRONZE;
CREATE OR REPLACE STAGE BRONZE.MORTGAGE_STAGE
  URL = 's3://replace-with-approved-bucket/mortgage/'
  DIRECTORY = (ENABLE = TRUE);
-- Configure STORAGE_INTEGRATION with your cloud/security team; do not embed cloud keys.
