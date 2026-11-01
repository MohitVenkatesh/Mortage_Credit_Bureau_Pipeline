from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.sensors.python import PythonSensor

def both_sources_ready():
    # Replace with S3/Snowflake manifest checks for your environment.
    # Do not mark the pipeline ready until both application and bureau inputs exist.
    return True

default_args = {
    "owner": "data-engineering",
    "retries": 2,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    dag_id="mortgage_underwriting_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args=default_args,
    description="Load mortgage and credit data, then execute dbt transformations",
) as dag:
    wait_for_sources = PythonSensor(
        task_id="wait_for_both_sources",
        python_callable=both_sources_ready,
        poke_interval=60,
        timeout=60 * 60 * 4,
        mode="reschedule",
    )
    run_dbt = BashOperator(
        task_id="dbt_build",
        bash_command="cd $DBT_PROJECT_DIR && dbt build --target prod",
    )
    wait_for_sources >> run_dbt
