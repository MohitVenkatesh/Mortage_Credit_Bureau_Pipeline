import logging

logger = logging.getLogger("mortgage_pipeline")

def report_pipeline_failure(dag_id: str, task_id: str, error: str) -> None:
    # Connect this function to your approved alerting integration (email/Slack/PagerDuty).
    logger.error("Pipeline failure dag=%s task=%s error=%s", dag_id, task_id, error)
