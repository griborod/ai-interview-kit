---
name: tdd-lite
description: Test-first loop for logic with clear inputs and outputs, and for bug fixes that need a reproduction. Use when implementing core or domain logic, parsers, calculations, state transitions, or fixing a bug; skip for glue code, UI layout, config and throwaway prototypes.
---

# TDD lite

**Use for:** pure functions, calculations, parsing, state machines, bug fixes
(reproduction test first). **Skip for:** wiring, config, UI pixels,
exploratory spikes — verify those by running them.

## Loop

1. Take one acceptance criterion from TASK.md.
2. Write one test for it. Run it. Confirm it fails for the right reason (an
   assertion, not an import error).
3. Write the minimal code to pass. Run the test and the related suite.
4. Refactor only if it clarifies; rerun.
5. Next criterion.

## Rules

- Test behaviour through the public interface, not internals.
- Mock only external boundaries: network, clock, randomness, filesystem.
- One edge or negative test per criterion where it matters.
- Never edit a test just to make it pass. If the test was wrong, say why.
- Keep the suite fast; put the command in TASK.md → Verification.
