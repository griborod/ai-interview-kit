---
name: review-diff
description: Independent review of agent-written changes by a fresh-context reviewer against TASK.md, then verify each finding before fixing. Use after implementing a step, before declaring the task done, or when the user asks to review or check the agent's code.
---

# Review diff

Catch what the author agent cannot see in its own work.

1. Collect inputs: TASK.md, the diff against the starting commit
   (`git diff <base>` plus untracked files), the test command.
2. Give a reviewer subagent (or a separate session) only those inputs — not
   your reasoning or the chat. Ask it to:
   - check every acceptance criterion is implemented **and** tested;
   - find correctness bugs, each with a concrete failing input;
   - find missing edge and negative cases;
   - flag needless complexity, dead code, changes outside scope;
   - run the tests itself.
   Findings ranked by severity, each with `file:line` and the failure
   scenario. No style nits.
3. Verify each finding yourself: reproduce it or read the code. Reject wrong
   ones with a reason — reviewers are wrong too.
4. Fix confirmed findings, rerun verification, summarise: found / fixed /
   rejected.

No subagents available → do a separate pass yourself: read the diff top to
bottom as if someone else wrote it, with TASK.md open.

## Typical agent mistakes to look for

- Invented APIs, parameters or config keys that do not exist.
- Errors swallowed silently (`except: pass`, empty catch, default on failure).
- Tests that assert mocks instead of behaviour, or were changed to pass.
- Values hard-coded to match test data.
- Off-by-one, time zones, float for money, unhandled empty / None / missing key.
- Concurrency: shared state, retries without idempotency.
- Scope creep: refactors and files nobody asked for.
