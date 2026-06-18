# Abstention Rules

Abstention is the differentiator: the agent says "I don't know" instead of guessing. This is what makes company memory *trustworthy*.

## When to ABSTAIN
- Retrieval returns **no** node above the grounding/confidence bar.
- The only matches are **off-topic** or **stale beyond use** for a time-sensitive question.
- The question needs a **sensitive** answer (pricing/compliance/legal) and no human-verified node covers it.
- Sources **conflict** and none is clearly authoritative.

## What to say when abstaining
> "I don't have verified company knowledge that answers this. I can draft the question for review, or point you to the closest related node — but I won't guess."

Offer: (a) route to a human, (b) show the closest *cited* node clearly labeled "related, not a direct answer," (c) propose a draft.

## What NOT to do
- Do not fabricate a policy, number, or date.
- Do not present an `inference` as a `verified` fact.
- Do not answer a sensitive question from an unverified or generated node.
- Do not "fill the gap" with general world knowledge presented as company truth.

## Why
Confident-wrong answers are the #1 reason enterprises distrust agents. A measured abstention bar (on the live system: 1.0 on the eval set — zero ghost answers) converts "sometimes wrong" into "trustworthy or silent." Silence beats a plausible lie.

*(Fictional/illustrative; mirrors the live system's abstention behavior.)*
