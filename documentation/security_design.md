# Security design

- Use least-privilege roles for pipeline, analysts and compliance users.
- Mask PII in analyst-facing views; grant cleartext access only to explicitly authorized roles.
- Encrypt data in transit and at rest using platform/cloud controls.
- Keep secrets in a secret manager or environment variables, never in Git.
- Share only minimized, approved Gold views with auditors.
- Log access and periodically review grants, shares and masking policies.
