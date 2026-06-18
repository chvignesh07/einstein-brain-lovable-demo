# Demo Harness

Two scripts, no private dependencies, safe for anyone to run.

## `scripts/demo.sh`
Prints the trust loop end-to-end on fictional "Acme Cloud" data:
1. a **known** answer (grounded + cited to a sample node),
2. an **unknown** answer → **abstention** (no guess),
3. **provenance** frontmatter (schema only),
4. a **quarantined draft** path,
5. the **human-stamp** promotion message.

```bash
bash scripts/demo.sh
```
It touches no network, no daemon, and no private corpus — pure illustration.

## `scripts/verify-demo-pack.sh`
Self-checks the package and prints `PASS`/`FAIL`:
- required files present,
- **no forbidden strings** (local paths, secrets, key markers, provider ENV prefixes, id fields),
- **no PII patterns** (real emails/phone numbers; fictional placeholders like `acme`/`example.com` allowed),
- no `.DS_Store`,
- scripts are executable,
- README has the required sections,
- the sample Skill exists with frontmatter.

```bash
bash scripts/verify-demo-pack.sh
```

## CI
`.github/workflows/demo-pack-check.yml` runs both on every push/PR — so the repo continuously proves it self-checks for leaks and structure.

## Relation to the live system
The live Einstein Brain runs the **same loop** over a private corpus with a real retrieval engine (hybrid BM25 + vector + graph, cross-encoder rerank, generation-weighting, eval-gated). This harness shows the *shape* without exposing any of it. See `ARCHITECTURE.md`.
