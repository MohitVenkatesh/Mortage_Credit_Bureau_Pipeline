# Audit an approval as of 30 days ago

Record the decision timestamp, application identifier, policy/rule version and source lineage with every decision. If Snowflake Time Travel retention covers the requested point, query the decision table using `AT (TIMESTAMP => ...)` with the exact timestamp and timezone. Confirm retention settings first; 30-day Time Travel is not automatic for every table/account. If the retention window has expired, use an immutable decision-event/audit snapshot or approved backup rather than assuming Time Travel can recover it.
