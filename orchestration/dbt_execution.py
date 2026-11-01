import subprocess
from pathlib import Path

def run_dbt_build(project_dir: str) -> None:
    result = subprocess.run(
        ["dbt", "build"],
        cwd=Path(project_dir),
        check=False,
        text=True,
        capture_output=True,
    )
    if result.returncode:
        raise RuntimeError(f"dbt build failed: {result.stderr}")
