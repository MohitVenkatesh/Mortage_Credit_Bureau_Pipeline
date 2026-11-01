from pathlib import Path
import csv
import random
from datetime import datetime, timezone

random.seed(43)
out = Path(__file__).resolve().parents[1] / "data" / "raw" / "credit_bureau_records.csv"
out.parent.mkdir(parents=True, exist_ok=True)
with out.open("w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=[
        "applicant_id", "ssn", "fico_score", "monthly_debt", "credit_report_timestamp"
    ])
    writer.writeheader()
    for i in range(1, 101):
        writer.writerow({
            "applicant_id": f"CUS{i:05d}",
            "ssn": f"DEMO-{i:05d}",
            "fico_score": random.randint(580, 820),
            "monthly_debt": random.randint(500, 5000),
            "credit_report_timestamp": datetime.now(timezone.utc).isoformat()
        })
print(f"Wrote synthetic credit bureau records to {out}")
