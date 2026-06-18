# Contributing

Thanks for looking. This is a small **demo package**, not a large open-source project — but contributions that improve clarity or catch a leak are welcome.

## Ground rules
1. **Keep it sanitized.** Never add real company data, customer/PII data, secrets, API keys, local absolute paths, or private repo references. All examples must stay fictional ("Acme Cloud" / "DemoCo").
2. **No overclaims.** Pair every capability with its boundary. Do not introduce "complete company brain," "fully autonomous," "production-ready," "auto-write safe," or "zero hallucination" (without "on our eval set").
3. **Run the checks before a PR:**
   ```bash
   bash scripts/demo.sh
   bash scripts/verify-demo-pack.sh   # must print PASS
   ```
   CI (`.github/workflows/demo-pack-check.yml`) runs the same on every push/PR.
4. **Docs over code.** This repo is mostly documentation + sanitized samples; prefer clear prose and accurate diagrams.

## PR checklist
- [ ] `verify-demo-pack.sh` passes locally
- [ ] No new forbidden strings / PII / `.DS_Store`
- [ ] Examples remain fictional
- [ ] Claims stay honest (boundaries attached)
- [ ] Links resolve

## Reporting a concern
See `SECURITY.md` / `SECURITY_NOTES.md`. If you spot a leak or an overclaim, flag it before sharing further.
