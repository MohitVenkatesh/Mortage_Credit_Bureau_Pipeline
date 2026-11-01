# Handle a 1000x volume spike

- Land files/events in scalable object storage and use Snowpipe/streaming ingestion where appropriate.
- Separate ingestion and transformation compute; use auto-suspend/resume and controlled multi-cluster scaling.
- Process incrementally with stable business keys, deduplication and idempotent MERGE logic.
- Partition work by ingestion window or business key where it improves parallelism; avoid uncontrolled small-file creation.
- Monitor ingestion lag, queueing, warehouse load, query spills, credits and SLA attainment.
- Load-test realistic peak volumes, define back-pressure and retry policies, and alert before SLA breaches.
