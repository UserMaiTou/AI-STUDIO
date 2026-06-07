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
| Human Final Decision | Approves direction, acceptance, repository-shaping changes, commit, and push. |

The Executor may self-check work, but self-check is not final review for repository-shaping changes.

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

## Higher-Risk Work

Require explicit Human Review before work that:

- changes Core behavior
- promotes a Mission Pack pattern into Core
- rewrites collaboration rules
- changes repository structure
- changes migration boundaries
- affects commit or push policy
- introduces new required files or directories

## Forbidden Routing Patterns

- Treating a tool as final authority.
- Letting historical habit choose the executor.
- Allowing an executor to self-approve significant work.
- Using tool preference to expand scope.
- Implementing Parking Lot items without explicit approval.
- Writing project-specific rules into Core.

## TASK Template Requirement

Every durable task should identify:

```text
Executor:
Reviewer:
```

Do not add extra required routing fields unless Human Review approves the template change.
