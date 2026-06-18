#!/usr/bin/env bash
# Einstein Brain — sanitized demo (the trust loop), runnable by anyone.
# NO private services, NO daemon, NO access to any private corpus.
# All data below is FICTIONAL ("Acme Cloud"). Illustrative only.
set -euo pipefail
b(){ printf '\n\033[1m%s\033[0m\n' "$1"; }

b "Einstein Brain — Trust Loop Demo (sanitized / fictional 'Acme Cloud')"
echo "retrieve -> cite -> abstain if missing -> draft -> quarantine -> human stamp -> promote"

b "1) KNOWN ANSWER  (grounded + cited)"
echo "Q: How are refunds handled on standard plans?"
echo "A: Self-serve refund within 14 days. After 14 days: annual plans pro-rated;"
echo "   monthly plans non-refundable mid-cycle."
echo "   source: examples/sample-brain-node.md   (generation:0, human-verified)"

b "2) UNKNOWN ANSWER  (abstention — the differentiator)"
echo "Q: What is the refund policy for enterprise annual contracts in Germany?"
echo "A: [ABSTAIN] No grounded node for this. The Brain returns no answer"
echo "   rather than inventing one. (Eval-set abstention: 1.0 — zero ghost answers.)"

b "3) PROVENANCE  (frontmatter schema only — no sensitive bodies)"
echo "  generation: 0          # 0 = human-authored (highest trust)"
echo "  source_type: human"
echo "  last_verified: 2026-06-10"
echo "  expires_after_days: 90  # drives a 'due for review' flag (display-only)"

b "4) GOVERNED WRITE  (a new fact is quarantined, not trusted)"
echo "  draft written to: _drafts/[DRAFT]-day20-annual-refund-precedent.md"
echo "  status: draft   needs_review: true   generation: 1 (machine-drafted)"
echo "  -> see examples/sample-librarian-draft.md"

b "5) HUMAN STAMP  (promotion requires a person)"
echo "  reviewer action: promote_draft  ->  status: active, generation stamped,"
echo "  recorded_at set, moved to a category. Sensitive lanes (pricing/compliance)"
echo "  are human-only. Rejected drafts are archived, never deleted."
echo "  RESULT: only after a human stamp is the node trusted + retrievable."

b "Done. This is the shape; the live system runs the same loop on a private corpus."
