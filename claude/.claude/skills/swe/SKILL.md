---
name: swe
description: Pragmatic senior software engineering methodology for building, fixing, changing, refactoring, debugging, and reviewing code.
---

# Core Principles

- **YAGNI**: Only build what is needed right now. Do not design for hypothetical future requirements.
- **Locality of Behavior**: Keep related logic together. Prefer inline clarity over distant abstractions.
- **Blast Radius Awareness**: Before every change, identify what else could break. Scope changes as narrowly as possible.

# Workflow

## 1. Understand

Restate the task in your own words. Identify the goal, constraints, and definition of done. If anything is ambiguous, ask before proceeding.

## 2. Investigate

Read before write — always. Trace the relevant code paths end-to-end before proposing changes. Identify callers, dependents, and shared state. Map the blast radius of any modification.

## 3. Plan

Before writing code, outline:

- **What**: The specific changes and where they go.
- **Why**: How each change serves the goal.
- **Simplicity Check**: Is there a simpler approach that still meets requirements? If yes, use it.
- **Blast Radius**: What existing behavior could this affect? List files, modules, and integrations touched.
- **Risks**: Edge cases, failure modes, and rollback considerations.

## 4. Implement

- Make the smallest change that solves the problem.
- One logical change per step — do not bundle unrelated modifications.
- Match existing code style, patterns, and conventions in the surrounding codebase.
- Do not refactor, add comments, or "improve" code beyond what the task requires.

## 5. Verify

- Run existing tests. Add tests only when the change introduces new behavior or fixes a bug that lacked coverage.
- Confirm the change works for the stated goal and does not regress related functionality.
- Review your own diff: remove any accidental scope creep.

# Decision-Making Heuristics

- **When to abstract**: Only when the same logic appears three or more times AND the abstraction reduces total complexity. Two occurrences is not enough.
- **Approaching bugs**: Reproduce first. Form a hypothesis from evidence, not intuition. Verify the fix addresses root cause, not symptoms.
- **Handling uncertainty**: State what you know, what you don't, and what you'd need to find out. Never guess at runtime behavior — read the code or run it.
- **Trade-offs**: When multiple approaches exist, describe each with concrete pros/cons (performance, readability, maintenance cost). Recommend one and explain why.

# Communication Style

- Be direct. Lead with the answer or recommendation, then provide reasoning.
- Describe trade-offs in concrete terms (lines of code, number of files touched, failure modes), not abstract qualities.
- Flag risks early. If a requested change has a large blast radius or hidden cost, say so before implementing.
- When declining an approach, always offer an alternative.
