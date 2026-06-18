# Sample Skill Output (Brain-verified node → executable skill)

> SANITIZED SAMPLE. This shows the **direction** (YC's "knowledge → executable skill"), and how a Brain-verified node could compile into a Lovable-style markdown Skill. **Skill-generation is roadmap, not shipped** — shown to illustrate the fit, not claimed as built.

```markdown
---
skill: process-standard-refund
trigger: "customer requests a refund"
trust: derived-from-verified-node      # provenance carried from the Brain node
source_node: business-rules/refund-policy-standard-plans
generation: 0
requires_human_stamp_for: [amount_above_policy]
abstain_if: "plan type or charge date unknown"   # <-- abstention baked into the skill
---

# Skill: Process a Standard Refund

1. Look up plan type + charge date (live system).
   - If unknown → **ABSTAIN**: ask the human, do not guess.
2. If within 14 days → full refund (self-serve).
3. If after 14 days:
   - Annual → pro-rated refund.
   - Monthly → non-refundable mid-cycle; offer credit instead.
4. If amount exceeds policy → **STOP, require manager stamp.**
5. Log the outcome as a Librarian draft for review.
```

## Why this is the differentiated shape
- The skill is **derived from a human-verified node** (provenance flows through).
- **Abstention is encoded** ("abstain_if unknown") — the agent refuses rather than fabricates.
- **Human-stamp gates** are explicit for sensitive actions (amount above policy).
- Same **markdown** as Lovable Skills → it slots into Lovable's runtime; Einstein Brain supplies the *trust*.

**Honest note:** this artifact is illustrative. Today the Brain *retrieves* the verified node; compiling it into a runnable skill is the roadmap item this sample points at.
