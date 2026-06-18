---
title: "Refund Policy — Standard Plans"
type: business-rule
category: business-rules
tags: [refund, cancellation, billing, customer-success]
status: active
confidence: verified
created: 2026-05-02
last_verified: 2026-06-10
expires_after_days: 90
generation: 0            # 0 = human-authored (highest trust)
source_type: human
valid_from: 2026-05-02
valid_to:                # empty = currently valid
project: acme-cloud
related_files:
  - billing/refunds.md
  - src/billing/refund_service.ts
wikilinks: [[dunning-and-recovery]], [[support-tiers]]
---

# Refund Policy — Standard Plans

> SANITIZED SAMPLE for a fictional company "Acme Cloud." Not real data.

- Self-serve refunds within 14 days of charge, no questions asked.
- After 14 days: pro-rated only for annual plans; monthly plans non-refundable mid-cycle.
- Disputes route to the customer-success owner; exceptions require a manager stamp.

**Provenance:** human-authored (`generation: 0`), verified against `refund_service.ts`. Outranks any machine-generated note on the same topic.

**Currency:** `last_verified` + `expires_after_days` drive a "due for review" flag (display-only; does not silently demote ranking).
