-- Replace timestamp with the recorded approval timestamp in the correct session timezone.
-- Time Travel works only while the object's retention window includes the requested point.
SELECT *
FROM MORTGAGE_DB.GOLD.UNDERWRITING_DECISIONS
AT (TIMESTAMP => '2026-10-01 12:00:00'::TIMESTAMP_NTZ)
WHERE APPLICATION_ID = 'APP1001';
