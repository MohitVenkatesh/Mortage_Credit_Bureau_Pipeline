# Delayed credit bureau API

- Land mortgage applications immediately into Bronze and retain the raw payload.
- Track application and credit-source readiness independently using applicant/application keys.
- Use a left join in the Silver preparation layer so unmatched applications remain visible.
- Do not issue a final decision until required credit data arrives; route missing-FICO cases to a pending/technical exception state.
- Use Airflow sensors or event notifications with an agreed SLA, retries, timeout and alerting.
- When the bureau file arrives, process incrementally and idempotently, then re-run affected applications.
