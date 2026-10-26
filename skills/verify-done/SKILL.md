---
name: verify-done
description: Check work against TASK.md acceptance criteria with fresh evidence before saying a task or step is done, fixed or passing. Use before any completion claim, commit, or hand-back to the user.
---

# Verify done

No success claim without evidence produced in this session.

1. Run the Verification commands from TASK.md now: tests, lint/types, the app
   or script itself. Not from memory, not "should pass".
2. Read the output: exit code, failures, warnings that matter.
3. For each acceptance criterion find evidence: a test name, command output,
   or a manual check result.
4. Report a short table: criterion | done / partial / not done | evidence.
   Name what was not verified and why.
5. Something failed → say so plainly with the output. Never relabel it as done.

Stop and verify when you catch yourself at: "should work", "looks correct",
no test run since the last edit, a subagent reporting success whose output you
have not seen, or a test that was edited to make it pass.
