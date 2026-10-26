---
name: task-spec
description: Turn a loose task description into a short TASK.md with acceptance criteria and verification commands before writing code. Use at the start of any non-trivial task, when the user describes a feature or bug in free form, or says "spec", "define done", "criteria".
---

# Task spec

One screen that fixes what "done" means, so the plan, code, tests and review
all check against the same thing.

## Steps

1. Read before asking: README, AGENTS.md / CLAUDE.md, package manifest, test
   layout, the code the task touches. Don't ask what the repo can answer.
2. If **clarify** already ran, reuse its answers, assumptions and design — do
   not ask again. Otherwise ask at most 3 questions, only ones whose answer
   changes the design. Give a default for each ("I'll assume X unless you say
   otherwise"). No answer → take the default and record it under Assumptions.
3. Write `TASK.md` at the repo root from the template below, under ~40 lines.
4. Show it, get a yes or edits. Then propose a plan of 3–7 steps, smallest
   working slice first.
5. Scope changes mid-task → edit TASK.md first and say so.

## Template

```markdown
# <task title>

## Goal
<1–2 sentences: the user-visible outcome>

## Context
- <files/modules, external APIs, data involved>

## Constraints
- <stack, time box, what must not change, limits>

## Invariants
- <what must stay true whatever happens>

## Design
- <components, data flow, key interfaces, key decision; from clarify if it ran>

## Acceptance criteria
- [ ] AC1 <observable, testable behaviour>
- [ ] AC2 <...>
- [ ] AC-neg <failure or edge case and its expected handling>

## Out of scope
- <deliberately not doing, and why>

## Assumptions
- <defaults taken without confirmation>

## Verification
- `<test command>`
- `<lint / type-check command>`
- <manual check: run X, expect Y>
```

## Rules

- Every criterion is checkable by a command or an observable result. "Works
  well" is not a criterion.
- At least one negative or edge-case criterion.
- Out of scope matters as much as scope: under a time box, say what you skip.
- No long design doc. A real decision → options in one line each, recommend one.
