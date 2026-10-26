# AGENTS.md

Rules for AI agents in this repository. Keep it short: task details live in
`TASK.md`.

## Workflow

1. Requirements unclear → **clarify**: code map, ranked questions for the
   stakeholder, mini design.
2. Before code: **task-spec** → `TASK.md` with acceptance criteria and
   verification commands; get approval.
3. Plan 3–7 steps, smallest working slice first.
4. Implement with minimal diffs; **tdd-lite** for core logic, **debug-loop**
   for failures.
5. Independent parts → **parallel-agents**.
6. Before "done": **verify-done**; for non-trivial changes **review-diff**.

## Rules

- State assumptions; ask only questions that change the design.
- Touch only files the task needs; no speculative abstractions.
- Never claim something passes without running the command in this session.
- No secrets in code or commits. No destructive git (`reset --hard`,
  `push --force`, `clean -fd`) without asking.

## Commands

- Test: `<fill in>`
- Lint / types: `<fill in>`
- Run: `<fill in>`
