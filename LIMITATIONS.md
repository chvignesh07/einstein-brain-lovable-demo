# Limitations (honest boundaries)

We state these up front. Over-promising is the failure mode of every AI-agent product; honesty is the point of a *trust* layer.

## What is NOT built / NOT safe yet
- **Safe auto-write is OFF by design.** The injection-sanitize screen and the write-eval gate are not built. Today it's auto-*draft* to quarantine + human-*promote*, never un-gated auto-write.
- **No live connectors.** Slack / GitHub / meetings / tickets are not ingested automatically — ingestion is manual/assisted today.
- **No executable-skill generation.** Knowledge is retrieved, not yet compiled into runnable agent skills (the YC "executable skills file" is the direction, not a shipped feature).
- **No closed loop.** It does not yet monitor "what happened vs what should" and adjust.
- **Librarian is a concept** with working primitives (draft/promote/discard) but no autonomous orchestration.
- **Context Packet + evidence ledger** are designed formats, not fully wired.

## Known quality caveats
- **Staleness labels are over-broad** — currently pure wall-clock; ~70% of nodes flagged, including durable rules. It's **display-only** (does not demote ranking; the eval bar holds). Calibration is a near-term fix. We will not claim currency is perfect.
- **Multi-project isolation is not enforced** — irrelevant for a single-company deployment, but we don't claim live cross-tenant isolation.
- Metrics (hit 0.9714 / abstention 1.0) are **on our 38-case eval set**, not a universal guarantee.

## No enterprise posture yet
- No SSO, no compliance certifications, no signed DPA. The strengths are **open + local + auditable + deletable** (plain files over git), not certified enterprise security.

## What IS solid
- Grounded cited retrieval, measured abstention, provenance weighting, quarantine/promote primitives, open markdown over git — all real and re-runnable today, proven on a real SaaS.

> If a claim isn't in "What IS solid," treat it as roadmap and say so.
