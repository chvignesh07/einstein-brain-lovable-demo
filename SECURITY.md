# Security Policy

## Reporting
If you believe you've found a security issue, a leak of private data, or sensitive content that shouldn't be in this **sanitized demo** package, please open a GitHub issue marked `security` (or contact the maintainer via the repo) and avoid sharing the content further until it's addressed.

## Scope
This repository is a documentation + sanitized-sample demo. It is designed to contain **no** secrets, credentials, private corpus, customer/PII data, or local paths. The automated check `scripts/verify-demo-pack.sh` (run in CI) scans for forbidden strings and PII patterns on every push.

## What's intentionally absent
- No production code, no live keys, no private knowledge nodes.
- The governed-write/auto-ingest path is **not** built here (auto-write is off by design). See `LIMITATIONS.md`.

See also `SECURITY_NOTES.md` for the trust/privacy design properties.
