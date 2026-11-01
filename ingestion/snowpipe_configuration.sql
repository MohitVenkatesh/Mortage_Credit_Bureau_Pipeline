-- Illustrative Snowpipe template. Add an approved notification integration and cloud event
-- configuration before enabling AUTO_INGEST. Keep cloud credentials out of SQL/source control.
CREATE OR REPLACE PIPE MORTGAGE_DB.BRONZE.CREDIT_BUREAU_PIPE
  AUTO_INGEST = TRUE
AS
COPY INTO MORTGAGE_DB.BRONZE.CREDIT_BUREAU_RAW
FROM @MORTGAGE_DB.BRONZE.MORTGAGE_STAGE
FILE_FORMAT = (FORMAT_NAME = MORTGAGE_DB.BRONZE.CSV_FORMAT);
