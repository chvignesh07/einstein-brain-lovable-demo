# Security & Privacy Notes

## What this package contains
- Sanitized documentation + **fictional** sample nodes (a made-up "Acme Cloud" company).
- **No** private corpus, **no** real customer/company data, **no** secrets/keys/tokens, **no** absolute local paths, **no** vendor-internal references.

## Design properties relevant to enterprise trust
- **Open + local:** plain markdown over git. Runs on your machine / your cloud. Nothing forced into a third-party SaaS.
- **Auditable:** every node is a readable file with provenance frontmatter; every change is a git diff.
- **Deletable / exportable:** it's files — you keep or delete them; clean exit.
- **No PII/secrets in the corpus:** Brain stores policy/knowledge and *references*, not raw customer records, payment data, or credentials.
- **Human-gated ingestion (pilot):** the automated injection-sanitize layer is in build, so during a pilot all ingestion is human-reviewed. Untrusted content is quarantined, never auto-promoted.

## Honest security boundaries (not yet built)
- No SSO, no SOC2/ISO certification, no signed DPA yet.
- The injection-sanitize screen + write-eval gate are **roadmap** → **auto-write is OFF by design**.
- Treat this as an early-stage design-partner artifact, not a certified enterprise product.

## If you fork/publish this package
- Keep it sanitized; never add real nodes, paths, keys, or customer data.
- The examples are illustrative; the metrics quoted are from the maintainer's private eval set and are re-runnable on the private system, not on this package.

## Reporting
Found something that looks like a leak or an overclaim in this package? It shouldn't be here — flag it to the maintainer before sharing further.
