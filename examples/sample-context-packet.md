# Sample Context Packet (Hermes → worker)

> SANITIZED SAMPLE. The Context Packet is how the governor (Hermes) hands an agent *labeled* context. Each fact carries a trust label so the worker knows what to rely on. (Format is designed; wiring is roadmap.)

```yaml
packet_id: ctx-2026-06-18-0007
task: "Draft a response to a customer asking for a refund on day 20 of an annual plan"
requested_by: support-agent
created_for: worker/claude-code

context:
  - fact: "Annual plans are pro-rated for refunds after 14 days."
    label: verified            # from a human-stamped Brain node
    source: business-rules/refund-policy-standard-plans
    confidence: high

  - fact: "This customer is on the Team annual plan."
    label: live-verified       # checked against the live system at packet time
    source: billing-system
    confidence: high

  - fact: "Similar day-20 cases were handled with a 60% pro-rated refund."
    label: historical          # past pattern, not a rule
    source: patterns/refund-precedents
    confidence: medium

  - fact: "Customer seems likely to churn."
    label: inference           # model judgment, NOT a fact
    confidence: low

constraints:
  - "Refund amounts above policy require a human (manager) stamp."
  - "Do NOT promise anything in the 'inference' bucket as fact."

writeback_policy:
  may_draft: true              # worker may propose a new note
  may_promote: false           # never — human stamp required
  sensitive_categories: [pricing, compliance]   # human-only
```

**Why it matters:** the worker acts on `verified` + `live-verified`, treats `historical` as precedent, and never states `inference` as fact. Evidence is verified by Hermes before any resulting note is promoted.
