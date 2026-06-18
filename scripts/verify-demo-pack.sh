#!/usr/bin/env bash
# Self-check the demo pack: required files present, no leaks, scripts runnable, README complete.
# Exit 0 = PASS, non-zero = FAIL. Safe to run anywhere (read-only).
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"
FAIL=0; note(){ echo "    - $1"; }
SELF="scripts/verify-demo-pack.sh"   # exclude this file from its own pattern scans

echo "== Einstein Brain demo-pack verifier =="
echo "root: $ROOT"

echo "[1] required files"
req=(README.md QUICKSTART.md PITCH.md ARCHITECTURE.md DEMO.md LIMITATIONS.md DESIGN_PARTNER.md \
SECURITY_NOTES.md LICENSE NOTICE.md CONTRIBUTING.md CODE_OF_CONDUCT.md \
docs/yc-alignment.md docs/lovable-specific.md docs/demo-harness.md docs/agent-loop.md docs/research-sources.md \
examples/sample-brain-node.md examples/sample-context-packet.md examples/sample-librarian-draft.md examples/sample-skill-output.md \
skills/trusted-company-memory/SKILL.md skills/trusted-company-memory/provenance-rules.md skills/trusted-company-memory/abstention-rules.md \
scripts/demo.sh scripts/verify-demo-pack.sh .github/workflows/demo-pack-check.yml assets/.gitkeep)
miss=0; for f in "${req[@]}"; do [ -f "$f" ] || { note "MISSING: $f"; miss=1; FAIL=1; }; done
[ "$miss" = 0 ] && note "all present (${#req[@]})"

echo "[2] forbidden private/secret strings (exact)"
# Private paths, repo names, key/secret markers, provider ENV-VAR prefixes, id fields.
EXACT='/Users/vigneshch|/Users/[a-z]|\.hermes|/VF/|velocityflow|sk-[A-Za-z0-9]{8}|BEGIN[ A-Z]*PRIVATE KEY|STRIPE_|TWILIO_|SUPABASE_|lead_id|api[_-]?key'
if grep -rInE "$EXACT" --exclude-dir=.git . 2>/dev/null | grep -v "$SELF"; then note "FORBIDDEN STRING FOUND ^"; FAIL=1; else note "none"; fi

echo "[3] PII patterns (real emails / phone numbers)"
# Bare words customer/phone/email are allowed in prose; real PII data is not.
# example.com / acme / democo are permitted placeholders.
if grep -rInE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|[0-9]{3}[-.][0-9]{3}[-.][0-9]{4}' --exclude-dir=.git . 2>/dev/null \
   | grep -v "$SELF" | grep -viE 'example\.com|acme|democo|your-?org|user@'; then note "POSSIBLE PII ^"; FAIL=1; else note "none (placeholders allowed)"; fi

echo "[4] no .DS_Store"
if find . -name .DS_Store -not -path './.git/*' | grep -q .; then note ".DS_Store present"; FAIL=1; else note "none"; fi

echo "[5] scripts executable"
for s in scripts/demo.sh scripts/verify-demo-pack.sh; do [ -x "$s" ] || { note "not +x: $s"; FAIL=1; }; done; note "checked"

echo "[6] README required sections"
for h in "What it does" "Why this exists" "Trust loop" "What is real" "not included" "Lovable" "demo harness" "Limitations" "Design-partner"; do
  grep -qi "$h" README.md || { note "README missing hint: $h"; FAIL=1; }; done; note "checked"

echo "[7] sample Skill present + has frontmatter"
{ [ -f skills/trusted-company-memory/SKILL.md ] && grep -q '^name:' skills/trusted-company-memory/SKILL.md; } || { note "SKILL.md missing or no name: frontmatter"; FAIL=1; }
note "checked"

echo
if [ "$FAIL" = 0 ]; then echo "RESULT: PASS ✅"; else echo "RESULT: FAIL ❌"; fi
exit "$FAIL"
