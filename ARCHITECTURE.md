# Architecture

## Storage
- One node = one markdown file with YAML frontmatter, over **git** (auditable, portable, exportable).
- Stores: BM25 index + vector embeddings (LanceDB) + a wikilink graph (KuzuDB) + a cache.
- Frontmatter fields that carry trust: `generation` (0=human, 1+=generated), `source_type` (human / verified_generated / generated), `valid_from`/`valid_to` (bi-temporal), `last_verified`, `expires_after_days`, `tags`, `project`.

## Retrieval pipeline (one consolidated core)
```
query
 → BM25 (lexical)  +  vector (LanceDB, semantic)  +  graph (1-hop wikilinks)
 → RRF fusion
 → cross-encoder rerank (ettin-150m)
 → generation-weighting   (human gen:0 ranks above generated gen:1+)
 → temporal / staleness filter
 → ranked, cited nodes  (or ABSTAIN if nothing is grounded)
```
- Served two ways, same core: an HTTP **daemon** and an **MCP server** (`search_brain`) — tool-agnostic.
- **Eval-gated:** a golden dataset gates every change (current: hit 0.9714, abstention 1.0, ~190 ms).

## Governance plane
- **Hermes (governor):** hands a worker a **Context Packet** — each fact labeled `verified` / `memory` / `historical` / `inference` — and verifies evidence before any promote.
- **Librarian (draft writer):** captures a worker's output, sanitizes, dedups, writes a **draft** to quarantine. **Never promotes.**
- **Human stamp:** `promote_draft` moves a draft → category, setting provenance (`generation`, `recorded_at`). Sensitive categories are human-only. `discard_draft` archives (never deletes).

## The trust loop (end to end)
```
worker finishes task
 → Librarian: sanitize → dedup → draft to _drafts/  (quarantine)
 → write-eval gate (safe? injection? duplicate? golden held?)   [roadmap]
 → Hermes verifies evidence
 → human stamp (owner) for sensitive lanes
 → promote → trusted node
 → index refresh → retrieval proves the new memory is searchable
 → evidence ledger updated
```

## Design principles
- **Control plane ≠ content plane:** the governor (Hermes) is separate from the capture engine (Librarian).
- **Abstain over guess:** no grounded fact → no answer.
- **Curated > auto-dumped:** human-stamped knowledge is weighted above machine output (auto-dumps degrade quality; curation improves it).
- **Open + auditable:** plain files over git; nothing locked in a vendor cloud.

## Honest status markers
- Read pipeline + abstention + provenance + quarantine = **real**.
- Write-eval/sanitize, Librarian orchestration, Context Packet wiring, connectors, skill-generation = **roadmap** (see `LIMITATIONS.md`).
