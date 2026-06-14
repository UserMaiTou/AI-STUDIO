# TOOL_ROUTING

## Purpose

This file defines tool-neutral routing for AI-STUDIO work.

Tools provide capability. They do not provide authority.

## Core Principles

- Human Final Decision remains the highest authority.
- Repository files are the source of truth.
- Tool is capability, not authority.
- No tool owns a permanent role.
- Executor and Reviewer are separate responsibilities.
- Routing depends on task type, phase, expected output, and risk profile.
- Product quality and scope integrity matter more than tool preference.

## Responsibility Split

| Responsibility | Meaning |
|---|---|
| Executor | Produces the authorized output within approved scope. |
| Reviewer | Checks scope, integrity, risk, and readiness. |
| Human Final Decision | Approves direction, subjective acceptance, repository-shaping changes, commit, push, and release. |

The Executor may self-check work, but self-check is not final review for repository-shaping changes.

Human Final Decision is not a substitute for objective validation by AI, scripts, tests, diffs, logs, or checklists.

## Role Boundaries

These boundaries guide routing unless Human explicitly assigns a different role for a task.

| Role | Boundary |
|---|---|
| Codex | Task breakdown, repository state, objective validation, review, handoff, and commit recommendation. |
| Cursor | Implementation execution for code, configuration, assets, and batch file processing. |
| Claude | Read-only deep review, architecture analysis, risk analysis, and second opinion. |
| ChatGPT | Human Director decision support, direction judgment, and strategy discussion. |
| Human Director | Subjective judgment, direction, final authorization, protected decisions, commit approval, push approval, and release approval. |

Role boundaries do not authorize scope expansion, skipped validation, or protected decisions.

## Routing Tendencies

These are tendencies, not permanent roles.

| Work Type | Likely Executor | Likely Reviewer |
|---|---|---|
| Governance documentation | Codex | Human or ChatGPT |
| Mission Pack creation | Codex | Human or ChatGPT |
| Mission Pack review | ChatGPT or Codex | Human |
| Tool routing design | ChatGPT or Codex | Human |
| Benchmarking and comparison | ChatGPT or Codex | Human |
| Project execution planning | Codex | Human |
| Retrospective analysis | ChatGPT or Codex | Human |
| Repository hygiene | Codex | Human |

Use the smallest tool chain that protects quality, scope, and reviewability.

## Routing Checks

Before executing or assigning work, answer:

1. What is the task type?
2. What output is expected?
3. What is the risk profile?
4. Which files are allowed?
5. Which files are forbidden?
6. Who is the Executor?
7. Who is the Reviewer?
8. Does the human need to approve before execution, commit, or push?
9. What objective validation evidence is required before Human Review?
10. Is the session state `GREEN`, `YELLOW`, or `RED`?

## Objective vs Subjective Validation

Objective validation should be handled by AI, scripts, tests, diffs, logs, or checklists whenever practical.

Subjective Human Review should focus on taste, direction, product judgment, priority, final authorization, and protected decisions.

Do not route objective checks to Human as manual visual fallback when the agent can reasonably verify them.

## Higher-Risk Work

Require explicit Human Review before work that:

- changes Core behavior
- promotes a Mission Pack pattern into Core
- rewrites collaboration rules
- changes repository structure
- changes migration boundaries
- affects commit or push policy
- introduces new required files or directories
- moves from planning into implementation
- moves from implementation into review or commit

Checkpoint completion requires `STOP_AND_HANDOFF`; it must not automatically route into the next task.

## Forbidden Routing Patterns

- Treating a tool as final authority.
- Letting historical habit choose the executor.
- Allowing an executor to self-approve significant work.
- Using tool preference to expand scope.
- Using Human Review as a replacement for objective validation.
- Continuing from checkpoint into a new task without a new session or explicit Human authorization.
- Implementing Parking Lot items without explicit approval.
- Writing project-specific rules into Core.

## TASK Template Requirement

Every durable task should identify:

```text
Executor:
Reviewer:
```

Do not add extra required routing fields unless Human Review approves the template change.
