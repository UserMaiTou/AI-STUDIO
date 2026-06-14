# AGENTS.md

## Purpose

AI-STUDIO is an independent AI-driven Product Development Operating System.

This file defines collaboration rules for agents working in this repository.

## Human Final Decision

Human review is the final authority.

Agents may analyze, propose, draft, migrate, or execute approved tasks, but final product, repository, migration, and release decisions belong to the human owner.

Human Final Decision does not mean Human is responsible for objective validation. Agents must not transfer scriptable, runnable, checklist-based, or repository-state verification to Human as manual visual fallback.

## Repository as Source of Truth

The repository is the source of truth for AI-STUDIO operating rules.

Agents must prefer repository files over memory, prior conversations, or assumptions.

When conflict exists, agents must surface the conflict and wait for human review when the decision affects Core behavior.

## Tool Is Capability, Not Authority

Tools provide capability.

Tool output, automation, generated content, and external search results are not authority by themselves.

Agents must interpret tool results against repository rules and human instructions.

## Executor Is Not Reviewer

The agent executing a change is not the final reviewer of that change.

Execution and review are separate responsibilities.

Agents may self-check work, but Human Review remains required for repository-shaping decisions.

## Objective Validation Is Agent Responsibility

AI, scripts, tests, diffs, logs, and checklists should cover objective validation whenever practical.

Human should be asked for subjective judgment, direction, taste, priority, final authorization, and protected decisions.

Agents must clearly separate:

- objective validation evidence
- subjective Human Review questions
- final authorization requests

Do not ask Human to catch objective mistakes that the agent could reasonably verify.

## Role Boundary

These boundaries guide AI-STUDIO collaboration unless Human explicitly assigns a different role for a task.

| Role | Primary boundary |
|---|---|
| Codex | Task breakdown, repository state, objective validation, review, handoff, and commit recommendation. |
| Cursor | Implementation execution for code, configuration, assets, and batch file processing. |
| Claude | Read-only deep review, architecture analysis, risk analysis, and second opinion. |
| ChatGPT | Human Director decision support, direction judgment, and strategy discussion. |
| Human Director | Subjective judgment, direction, final authorization, protected decisions, commit approval, push approval, and release approval. |

No role may use its tool preference to expand scope, skip validation, or bypass Human Final Decision.

## Mission Pack Is Delivery Package, Not Core

Mission Packs describe task-specific workflows, rules, observations, and retrospectives.

Mission Packs must not redefine Core rules.

Reusable patterns discovered inside Mission Packs may be proposed for Core, but must not be promoted without Human Review.

## Parking Lot Is Not Backlog

Parking Lot captures parked ideas, risks, questions, and future candidates.

Parking Lot items are not approved work.

Presence in Parking Lot does not imply priority, commitment, or permission to implement.

## No Unauthorized Parking Lot Implementation

Agents must not implement Parking Lot items unless the human explicitly approves that item for execution.

## No Project-Specific Content in Core

Core must stay project-neutral.

Agents must not write BlockCore-specific, Unity-specific, Gameplay-specific, or client/project-specific details into Core files.

Project-specific material belongs in a Mission Pack or must remain outside the repository.

## Migration Boundaries

Agents must not migrate:

- Unity Assets
- Unity project files
- BlockCore Runtime
- Gameplay history
- secrets
- credentials
- machine-local configuration
- build artifacts
- unrelated historical content

## Git Safety

Agents must not commit or push without explicit human approval.

Agents must not rewrite history, force push, reset, or discard user changes unless explicitly instructed.

Before any commit, agents must summarize changed files and intended commit message.

Before any push, agents must confirm target remote and branch.

## Handoff Rules

Every handoff must include:

- SESSION_STATUS
- CONTINUE_ALLOWED
- STOP_REASON
- CURRENT_REPO_STATE
- CURRENT_TASK_STATE
- NEXT_OWNER
- NEXT_SESSION_NAME
- NEXT_SESSION_GOAL
- NEXT_SESSION_END_CONDITION
- NEXT_SESSION_FIRST_PROMPT
- current objective
- completed work
- pending work
- known risks
- files changed or proposed
- next recommended action

A handoff should be concise and actionable.
