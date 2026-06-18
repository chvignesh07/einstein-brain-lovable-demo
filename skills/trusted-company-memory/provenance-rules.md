# Provenance Rules

Every node carries provenance frontmatter. Trust is assigned, not assumed.

## Fields
- `generation` — `0` = human-authored (highest trust); `1` = human-verified or curated generated; `2+` = raw machine output (lowest; capped).
- `source_type` — `human` / `verified_generated` / `generated`.
- `last_verified` + `expires_after_days` — drive a "due for review" flag (display-only; does not silently demote ranking).
- `valid_from` / `valid_to` — bi-temporal validity (a fact can be true for a period).
- `recorded_at` — set when a human promotes a draft.

## Weighting
- In ranking, **human (`generation: 0`) outranks generated (`generation: 1+`)** for the same relevance — curated knowledge is preferred over machine output.
- Generated nodes must cite at least one non-memory source (a file, a doc, a thread) to be promotable.

## Lifecycle → provenance transitions
- Draft (machine): `generation: 1`, `source_type: generated`, `status: draft`, `needs_review: true`.
- On human promotion: provenance stamped, `recorded_at` set, `status: active`.
- On discard: archived to `.discarded/`, never deleted.

## Hard rules
- Never upgrade trust automatically. Promotion is a human action.
- Never store secrets/PII/payment data as node content — store policy and references only.
- Sensitive categories (pricing, compliance, legal, payment, auth) are **human-authored only**; agents may propose drafts, never write the trusted node.

*(Fictional/illustrative; mirrors the live system's frontmatter contract.)*
