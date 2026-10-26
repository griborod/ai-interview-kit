---
name: parallel-agents
description: Decide when and how to run agents in parallel — background research, test writing, independent modules, git worktrees. Use when a task has independent parts, or the user asks to parallelise or speed up.
---

# Parallel agents

Parallelise only independent work: merging costs time and attention.

**Good:** read-only research (API docs, how module X works) while you
implement; a reviewer subagent; tests for an agreed interface while it is
being implemented; independent modules behind an agreed contract.

**Bad:** two agents editing the same files; step 2 depends on a decision in
step 1; tiny tasks where overhead exceeds the gain.

## How

1. Fix the contract first: types, signatures, file ownership — in TASK.md.
2. Brief each agent with: goal, files it owns, files it must not touch, done
   criteria, how to verify, output format (short summary + files changed).
3. Parallel writers → separate worktrees:
   `git worktree add ../wt-<name> -b <name>`. Read-only agents can share the
   checkout.
4. Integrate yourself: review each result (review-diff), merge, run the full
   verification (verify-done).

Say out loud why you parallelise or why not — the choice is part of the
engineering.
