# Quickstart

> This is a **demo package**, not a product install. It explains what Einstein Brain is, shows the trust loop, and includes sanitized examples. The working system runs on a private corpus.

## Read in this order (5 minutes)
1. **`README.md`** — what it is, the roles, the trust loop, what's real vs roadmap.
2. **`PITCH.md`** — the 30-second + 2-minute story.
3. **`examples/`** — see the shape:
   - `sample-brain-node.md` — a verified memory node (provenance frontmatter).
   - `sample-context-packet.md` — how the governor hands an agent *labeled* context.
   - `sample-librarian-draft.md` — a quarantined draft awaiting a human stamp.
   - `sample-skill-output.md` — how a verified node could compile to an executable skill (roadmap direction).
4. **`ARCHITECTURE.md`** — retrieval pipeline + governance plane.
5. **`LIMITATIONS.md`** — honest boundaries (read this — it's the point).
6. **`DESIGN_PARTNER.md`** — the pilot offer.

## The one idea
Most AI reads your company and sometimes makes things up. Einstein Brain is the **trust layer**: verified provenance on every fact, **abstention** when it doesn't know, and a **human stamp** before anything becomes durable truth — open markdown over git.

## What's real today (re-runnable on the private system)
- Grounded, cited retrieval over 709 real nodes.
- Retrieval hit 0.9714; **abstention 1.0 — zero hallucinated facts on the eval set.**
- Provenance-weighted ranking; quarantine → human-promote primitives.

## What's roadmap
Safe auto-write (sanitize + eval gate), connectors, executable-skill generation, closed loop. See `LIMITATIONS.md`.

## How it fits Lovable
Same markdown shape as Lovable Skills; Einstein Brain adds the trust (provenance + abstention + human gate). See `docs/lovable-specific.md`.
