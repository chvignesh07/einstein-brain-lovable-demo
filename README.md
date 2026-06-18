# Einstein Brain — the trust layer for company memory

**Verified company memory for AI agents: provenance on every fact, abstention when it doesn't know, and a human stamp before anything becomes trusted truth. Open markdown over git.**

> Sanitized public demo. The working system runs on a **private corpus** (not included here). All examples are fictional ("Acme Cloud"). This repo self-checks for leaks in CI.

---

## What it does
Gives AI agents company knowledge they can actually trust:
- **Grounded + cited** retrieval over verified nodes.
- **Abstention** — refuses to answer when there's no verified fact (instead of hallucinating).
- **Provenance-weighted** — human-verified facts outrank machine-generated ones.
- **Human-gated writeback** — new knowledge is quarantined until a person stamps it.

## Why this exists
AI agents read company docs and confidently make things up — the #1 blocker to letting them do real work. Skills and Knowledge tell an agent *what to do*; nothing tells it *what to trust*. YC's current RFS names this gap exactly: *"the biggest blocker to AI automation of companies is no longer the models … now the blocker is the domain knowledge."* ([YC RFS, accessed 2026-06-18](https://www.ycombinator.com/rfs)). Einstein Brain is the missing trust layer.

## 30-second demo
```bash
bash scripts/demo.sh            # the trust loop on fictional data (no private deps)
bash scripts/verify-demo-pack.sh # repo self-check: no leaks, structure OK -> PASS
```
(Sample output: [`assets/demo-output.txt`](assets/demo-output.txt).)

## Architecture
```
                 ┌──────────────────────────── Einstein Brain ────────────────────────────┐
   query ─▶      │  BM25 + vector(LanceDB) + graph(KuzuDB) ─▶ RRF ─▶ rerank ─▶ gen-weight  │ ─▶ cited nodes
                 │                         ─▶ temporal/staleness filter                     │     (or ABSTAIN)
                 └───────────────────────────────────────────────────────────────────────┘
                         ▲ eval-gated (golden set: hit + abstention)        │
   workers ──────────────┘                                                  ▼
   (Claude/Codex/Lovable)        Hermes (Governor) ── Context Packet ──▶ verify evidence
                                        │  labels: verified / memory / historical / inference
   Librarian (draft writer) ──▶ _drafts/ (quarantine) ──▶ human stamp ──▶ trusted node
```
See [`ARCHITECTURE.md`](ARCHITECTURE.md) and [`docs/agent-loop.md`](docs/agent-loop.md).

## Trust loop
```
retrieve → cite → abstain if missing → draft → quarantine → human stamp → promote
```
Nothing becomes "true" without a human stamp. Sensitive lanes (pricing, compliance, legal) are human-only.

## What is real today
- Grounded, cited retrieval over a real **709-node** corpus.
- Retrieval **hit 0.9714**; **abstention 1.0 — zero hallucinated facts on our eval set** (re-runnable on the private system).
- Provenance-weighted ranking; quarantine → human-promote primitives (archive-never-delete).
- **Production-grade read layer; governed-write loop in pilot.** (Not "production-ready"; not "complete company brain.")

## What is intentionally NOT included
- No private corpus / no real company data / no secrets / no local paths.
- The injection-sanitize + write-eval gate (so **auto-write is off by design**), live connectors, and knowledge→executable-skill compilation are **roadmap** — see [`LIMITATIONS.md`](LIMITATIONS.md).

## For Lovable
Lovable Skills are portable `SKILL.md` markdown — the right *shape*. Einstein Brain is the **trust layer** around it: provenance + abstention + a human gate. A Lovable Skill can be the executable output of a Brain-verified node. A sample, importable Skill lives in [`skills/trusted-company-memory/`](skills/trusted-company-memory/SKILL.md). Details: [`docs/lovable-specific.md`](docs/lovable-specific.md). *(Complementary — not a replacement for Knowledge/Skills.)*

## Run the demo harness
```bash
git clone <this-repo> && cd einstein-brain-lovable-demo
bash scripts/demo.sh
bash scripts/verify-demo-pack.sh
```
No network, no daemon, no private access required. CI runs the same on every push ([`.github/workflows/demo-pack-check.yml`](.github/workflows/demo-pack-check.yml)).

## Limitations
Read this — it's the point: [`LIMITATIONS.md`](LIMITATIONS.md). Short version: read+trust layer is real; safe auto-write, connectors, and executable-skill generation are roadmap; metrics are on our eval set; no enterprise security certs yet (strengths are open + local + auditable).

## Design-partner ask
One painful workflow, two weeks, scoped read access, ~15 real questions, feedback. Success = fewer hallucinations + abstains on unknowns + "I'd trust this." No cash — feedback + a reference + case-study rights. See [`DESIGN_PARTNER.md`](DESIGN_PARTNER.md).

---
**Start here:** [`QUICKSTART.md`](QUICKSTART.md) · [`PITCH.md`](PITCH.md) · [`docs/yc-alignment.md`](docs/yc-alignment.md) · [`SECURITY_NOTES.md`](SECURITY_NOTES.md)
*MIT licensed. A demo package, not the product.*
