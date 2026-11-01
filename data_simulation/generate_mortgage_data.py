from pathlib import Path
import json
from faker import Faker
import random

fake = Faker()
random.seed(42)
out = Path(__file__).resolve().parents[1] / "data" / "raw" / "mortgage_applications.json"
records = []
for i in range(1, 101):
    property_value = random.randint(150_000, 800_000)
    records.append({
        "application_id": f"APP{i:05d}",
        "applicant_id": f"CUS{i:05d}",
        "applicant_name": fake.name(),
        "ssn": f"DEMO-{i:05d}",  # Synthetic token; never use real SSNs.
        "loan_amount": round(property_value * random.uniform(0.55, 1.02), 2),
        "property_value": property_value,
        "monthly_gross_income": random.randint(3500, 18000),
        "application_timestamp": fake.iso8601()
    })
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(json.dumps(records, indent=2), encoding="utf-8")
print(f"Wrote {len(records)} synthetic applications to {out}")
