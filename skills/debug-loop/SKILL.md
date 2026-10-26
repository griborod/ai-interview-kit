---
name: debug-loop
description: Root-cause loop for bugs, failing tests and unexpected behaviour. Use when something errors, fails or behaves wrong, before proposing a fix.
---

# Debug loop

1. **Reproduce.** Smallest command or input that shows the problem; write it
   down. Can't reproduce → collect data (logs, inputs, environment) first.
2. **Read.** The whole error and stack trace. Check what changed recently
   (`git diff`, `git log -5`).
3. **Hypothesis.** One sentence: "X happens because Y". Get evidence: a log
   line, inspecting the data, bisecting.
4. **Fix the cause**, not the symptom. One change at a time.
5. **Verify** with the reproduction; add a regression test if it is logic.
6. **Three failed fixes → stop.** State what is known, re-check assumptions
   (wrong layer? wrong data? wrong environment?) and tell the user.

Don't: change several things at once, catch-and-ignore errors, add retries or
sleeps to hide a timing bug you don't understand.
