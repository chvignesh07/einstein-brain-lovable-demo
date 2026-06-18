---
name: trusted-company-memory
description: Use when an agent must answer from verified company knowledge — retrieve a grounded, cited fact; abstain if no verified fact exists; and route any new knowledge through a human stamp before trusting it. Trigger on company-policy / "what's our X" / "have we decided this" questions.
---

# Trusted Company Memory

> **This is a sample target output** showing how verified Einstein Brain nodes can compile into a Lovable-compatible Skill. The automated compiler is **not fully built** — this file is illustrative and fictional ("Acme Cloud").

## When to use
Trigger when a task needs an authoritative company answer: policies, decisions, runbooks, "what is our X", "how do we handle Y", "have we decided Z before".

## Instructions
1. **Retrieve** the most relevant verified node(s) for the question.
2. **Cite** the source node and its provenance (human-verified vs generated, last-verified date).
3. If **no grounded, verified node** answers the question → **ABSTAIN**: say you don't have a verified answer and offer to route it for review. Do **not** guess. (See `abstention-rules.md`.)
4. If the user supplies a **new fact/decision**, do **not** treat it as truth. Write it as a **draft** to quarantine (`_drafts/`) with `status: draft`, `needs_review: true`. (See `provenance-rules.md`.)
5. **Never auto-promote.** A human stamps a draft before it becomes trusted. Sensitive lanes (pricing, compliance, legal, payment) are **human-only**.

## Boundaries
- Answer **only** from verified nodes; never fabricate a policy.
- Never expose secrets, customer/PII data, or raw payment data.
- Never modify a sensitive node (pricing/compliance/legal) — propose a draft for human review instead.
- Prefer "I don't know / let me route this" over a plausible guess.

## Abstention rule (hard)
If retrieval returns nothing grounded above the confidence bar → return: *"No verified company knowledge answers this yet — I can draft it for review."* Never invent.

## Human-stamp rule (hard)
New durable knowledge is **proposed, not committed**. It lands in quarantine and requires a human promotion. Rejected drafts are archived, never deleted.

## Supporting files
- `provenance-rules.md` — how trust/weighting is assigned.
- `abstention-rules.md` — exactly when to refuse.
- Sample inputs/outputs: `../../examples/sample-brain-node.md`, `../../examples/sample-librarian-draft.md`, `../../examples/sample-skill-output.md`.
