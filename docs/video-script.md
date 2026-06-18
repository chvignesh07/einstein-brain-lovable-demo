# Video Script (terminal-only, ~90 seconds, sanitized repo)

> Records **only** the public demo repo — never the private Brain, never private terminal tabs. Large font, fresh terminal window, nothing else visible.

## Shots
1. **[0:00]** `cd` into the repo. Say: "Sanitized demo — fictional data, no private system."
2. **[0:08]** `bash scripts/demo.sh` — let it print all 5 beats. Narrate per `assets/demo-transcript.txt`.
3. **[0:45]** Pause on the **ABSTENTION** beat (beat #2). This is the moment — let it sit.
4. **[1:00]** `bash scripts/verify-demo-pack.sh` — show `RESULT: PASS ✅` (the repo self-checks for leaks).
5. **[1:15]** `cat README.md | head -40` or open README — show the architecture diagram + trust loop.
6. **[1:25]** Close on the design-partner ask line.

## Capture (don't block on permissions)
- macOS: QuickTime → New Screen Recording (Cmd-Shift-5), or `asciinema rec` if installed.
- Save to `public-repo-demo.mov` (or `.cast`) in the demo-pack folder, or `assets/` in the repo.
- If screen-recording permission isn't already granted, **skip the video** — `assets/demo-output.txt` + `assets/demo-transcript.txt` are sufficient fallback evidence.

## Privacy
Only this repo on screen. No private system paths, no private terminal tabs, no secrets. Frontmatter schema only.
