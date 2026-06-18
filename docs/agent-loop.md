# The Agent Loop (roles + governance)

Einstein Brain separates the **control plane** (who may act / approve) from the **content plane** (capture / curation). That separation is the safety property.

## Roles
- **Brain** — verified company memory. The source of trusted knowledge (markdown + provenance over git).
- **Hermes (Governor)** — approves, verifies evidence, and hands each worker a **Context Packet** where every fact is labeled `verified` / `live-verified` / `memory` / `historical` / `inference`.
- **Librarian (Draft writer)** — captures a worker's output, sanitizes, dedups, and writes a **draft** to quarantine. **It never promotes.**
- **Workers** — Claude / Codex / Lovable-style agents. They execute tasks from an approved Context Packet and may *propose* (draft) new knowledge — never *commit* it.

## The loop
```
1. retrieve        Brain returns grounded, cited nodes (or ABSTAINS if none)
2. cite            every fact carries provenance + source
3. abstain         no grounded fact -> no answer (never guess)
4. draft           Librarian writes a candidate node to _drafts/ (quarantine)
5. quarantine      drafts are NOT trusted; sensitive lanes are human-only
6. human stamp     a person promotes (or discards -> archived, never deleted)
7. promote         stamped node becomes trusted + retrievable
8. (ledger)        the evidence ledger records what was promoted and why
```

## Why each guardrail exists
- **Abstention** prevents confident-wrong answers (the enterprise adoption blocker).
- **Quarantine + human stamp** prevents agents from silently poisoning the knowledge base (auto-dumps degrade quality; curated knowledge improves it).
- **Provenance weighting** keeps human-verified facts above machine-generated ones.
- **Control ≠ content** means a governor bug and a capture bug can't compound.

## Honest status
Roles + the draft→quarantine→promote primitives are real. The Librarian's autonomous orchestration, the Context-Packet wiring, the sanitize/write-eval gate, and the evidence ledger are **designed / roadmap** (see `LIMITATIONS.md`). Sample artifacts: `examples/sample-context-packet.md`, `examples/sample-librarian-draft.md`.
