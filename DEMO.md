# Demo (5 minutes)

> The live demo runs on the private system. This file shows the *shape*; sample artifacts are in `examples/`.

## Flow
1. **Pain (30s):** agents guess because company truth is unclear.
2. **Known answer (1m):** query the Brain for a real, known fact → grounded + cited node.
3. **Unknown answer (1m):** query something the corpus doesn't contain → **abstention** (no grounded answer; it won't invent one). *This is the centerpiece.*
4. **Provenance (45s):** open a node's frontmatter → `generation` / `source_type` / `last_verified` (see `examples/sample-brain-node.md`).
5. **Governed write (45s):** a draft lands in quarantine (`_drafts/`) → a human promotes it → trusted node. Nothing auto-promotes.
6. **Governor (30s):** Hermes hands the agent a Context Packet (verified / memory / historical / inference) and verifies evidence before promote (see `examples/sample-context-packet.md`).
7. **Ask (30s):** one workflow, two weeks, a case study.

## Representative commands (private system)
```bash
curl -s http://127.0.0.1:8742/health                       # daemon + node count
curl -s "http://127.0.0.1:8742/search?q=<a known question>"   # grounded + cited
curl -s "http://127.0.0.1:8742/search?q=<a question not in corpus>"   # abstains
python eval/brain_eval.py --dataset=eval/golden_dataset_v3.json       # hit 0.9714 / abstention 1.0
```

## What to emphasize
- The **abstention** moment — I haven't found an incumbent shipping calibrated, confidence-gated abstention.
- **Provenance + human stamp** — trust is decided by a person, not the model.
- **Open markdown** — same shape as Lovable Skills; slots in, doesn't replace.

## What NOT to show
- Pricing, customer/lead data, compliance-legal bodies, secrets, provider keys, private repo internals. Use neutral queries and the sanitized `examples/` only.
