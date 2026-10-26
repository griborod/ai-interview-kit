---
name: clarify
description: Prepare questions for a stakeholder (interviewer, product owner, customer) to pin down requirements, then sketch a mini system design from the answers. Use when a task arrives with a repo or existing code and requirements need clarifying with another person, or the user asks for "questions", "requirements", "clarify", "what should I ask".
---

# Clarify

The questions go to **another person** in a live conversation, not to the
user. The user picks and asks them, so keep everything short enough to read
aloud. Read-only until the user says otherwise.

## 1. Explore (read-only)

Read the task, README, manifest, entrypoints, tests, the code the task
touches. Report a **code map** in 5–8 lines: what exists, how to run it, how
to test it, where the change will go, anything surprising.

## 2. Questions

Go through the categories below. Drop any question the code or task already
answers. Output:

**Top 7**, most decision-changing first, as a table:

| # | Question | Decision it drives | Default if no answer |
|---|---|---|---|

Then **If time allows**: up to 5 more, one line each.

One idea per question, no compound questions. Prefer closed or
either-or questions ("A or B?") over open ones — they are faster to answer
live.

### Categories

- **Goal & user** — who uses it, what problem, what does success look like.
- **Scope** — MVP vs nice-to-have; what is explicitly out.
- **Inputs & outputs** — formats, sources, data volume, examples.
- **Existing code** — may it be changed or refactored; conventions to follow.
- **Non-functional** — latency, load, reliability, concurrency, security.
- **Failure & edge cases** — bad input, external API down, partial failure,
  retries, idempotency.
- **Integrations** — real external services or mocks/stubs allowed.
- **Evaluation** — how the result will be judged; tests, demo, code reading.
- **Priorities** — if time runs out, what matters most.

## 3. Record answers

Collect answers in a short list. Unanswered → take the default and mark it as
an assumption.

## 4. Mini design (≤ 15 lines)

- **Components** and their responsibility.
- **Data flow** from input to output.
- **Interfaces**: key function signatures, endpoints or messages.
- **Key decision**: chosen option, one alternative, why.
- **Risks** and how each is handled or tested.
- **Slices**: build order, smallest working slice first.

Show it and wait for agreement, then hand over to **task-spec** with the
answers, assumptions and design — it must not ask the same questions again.
