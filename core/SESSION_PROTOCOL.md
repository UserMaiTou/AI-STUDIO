# SESSION_PROTOCOL

## Purpose

This file defines the repository-driven session workflow for AI-STUDIO.

Responsibility: owns session lifecycle, Phase 0, read order, checkpoint flow, and `STOP_AND_HANDOFF` triggers.

The goal is to prevent chat-only context, preserve useful project memory, and keep AI-STUDIO work reviewable across sessions.

## Source of Truth

The repository is the source of truth for AI-STUDIO operating rules.

Agents must not rely on memory, prior conversation, or tool output when repository files provide the relevant rule.

When repository files conflict with the human's current instruction, surface the conflict and follow Human Final Decision.

## New Session Bootstrap

For a new session, read in this order:

1. `README.md`
2. `AGENTS.md`
3. `core/PROJECT_HANDOFF.md`
4. `core/TOOL_ROUTING.md`
5. `core/PARKING_LOT.md`
6. `core/TASK_TEMPLATE.md`, when structured task execution is needed

Read Mission Pack files only when the human assigns work for that Mission Pack or asks for review of it.

## New Session Naming

Use this naming format for new sessions:

```text
[Repo/Project] [Version/Task] — [Purpose]
```

Examples:

```text
AI-STUDIO v1.1 — Scope Planning
AI-STUDIO v1.1 — Core Patch
Companion TASK-0006 — Vertical Slice Review
```

## Phase 0 Read-Only Review

Every new session starts in Phase 0 Read-Only Review by default.

During Phase 0, agents may inspect repository state, read files, identify risks, propose scope, and prepare a plan.

During Phase 0, agents must not modify files, create files, commit, push, or enter implementation unless Human explicitly authorizes implementation.

Phase 0 should confirm:

- objective
- allowed files
- forbidden files
- current repository state
- expected output
- validation method
- whether Human Review is required before implementation

## Session Start Checklist

- Confirm the current objective.
- Confirm whether the request is analysis, planning, execution, review, or handoff.
- Confirm the relevant files before editing.
- Confirm whether Human Review is required before implementation.
- Confirm that Parking Lot items are not being implemented without explicit approval.
- Confirm that project-specific content is not being written into Core.
- Confirm the current session state: `GREEN`, `YELLOW`, or `RED`.

## Session Health Check

Agents must actively monitor session health. Human is not responsible for deciding when a session should stop.

Use these session states:

| State | Meaning | Allowed action |
|---|---|---|
| `GREEN` | Context, scope, repository state, and validation path are clear. | Continue within approved scope. |
| `YELLOW` | Context, scope, repository state, or validation path has meaningful uncertainty. | Pause, clarify, reduce scope, or prepare handoff before continuing. |
| `RED` | Context integrity, repository state, task boundary, or validation confidence is not reliable. | Must `STOP_AND_HANDOFF`. |

When the state is `RED`, the agent must stop task expansion and produce a handoff package.

## STOP_AND_HANDOFF Triggers

The agent must `STOP_AND_HANDOFF` when any of the following occurs:

- automatic compaction, context truncation, or long-session drift affects confidence
- checkpoint commit is completed
- the task is moving from planning into implementation
- the task is moving from implementation into review or commit
- Human explicitly requests stop, handoff, checkpoint, or new session
- context is uncertain
- repository state is uncertain
- allowed files, forbidden files, or authority boundaries are unclear

After a checkpoint, the agent must not automatically enter the next feature or next task. Continue only through a new session or explicit Human authorization.

## Task Execution Rules

When a task is approved for execution:

- define objective
- define scope
- define out of scope
- identify executor and reviewer
- list allowed files
- list forbidden files
- define acceptance criteria
- define objective validation evidence
- define subjective Human Review questions, if any
- note risks and rollback path
- produce a concise handoff when done

Use `core/TASK_TEMPLATE.md` when a durable task record is needed.

## Objective vs Subjective Validation

AI, scripts, tests, diffs, logs, and checklists are responsible for objective validation whenever practical.

Human should not be asked to manually catch objective issues that can be verified by repository inspection, tests, scripts, runtime checks, or checklists.

Human Review should focus on subjective experience, direction, priorities, final authorization, and protected decisions.

Agents must report objective validation status before requesting Human judgment.

## Mission Pack Rules

Mission Packs are delivery packages.

A Mission Pack may contain task-specific workflow, observations, escalation rules, and retrospective templates.

A Mission Pack must not redefine Core rules.

If a Mission Pack reveals a reusable operating pattern, propose it for Core and wait for Human Review.

## Parking Lot Rules

Parking Lot items are deferred ideas.

They are not active work, not approved scope, and not backlog commitments.

Agents must not implement Parking Lot items unless the human explicitly approves that item for execution.

## Optional Future Extensions

Future AI-STUDIO deployments may add optional structures for:

- run reports
- decision logs
- project state snapshots
- retrospective archives
- benchmark reports

These structures are not required by the first independent repository version.

Do not introduce optional structures unless Human Review approves them.

## Handoff Rules

End-of-session handoff must include this standard package:

```text
SESSION_STATUS:
CONTINUE_ALLOWED:
STOP_REASON:
CURRENT_REPO_STATE:
CURRENT_TASK_STATE:
NEXT_OWNER:
NEXT_SESSION_NAME:
NEXT_SESSION_GOAL:
NEXT_SESSION_END_CONDITION:
NEXT_SESSION_FIRST_PROMPT:
```

Full Handoff is used for durable archival records and may include:

- current objective
- completed work
- pending work
- known risks
- files changed or proposed
- next recommended action

Compact Bootstrap is used for the first prompt of a new session. It should preserve only the minimum actionable context needed to restart safely.

Avoid large text blocks when a compact bootstrap prompt is enough for the next session.

Keep handoffs concise, actionable, and clear about whether continuation is allowed.

## Communication Rules

- Prefer concise, file-linked updates.
- Avoid long recaps of repository content.
- Use exact paths when referencing files.
- Separate facts, assumptions, and recommendations.
- Stop and ask for Human Review when scope or authority is unclear.
- Do not let checkpoint completion naturally slide into the next task.

## Violation Handling

If an agent notices a violation, it should:

1. stop expanding scope
2. identify the violated rule
3. identify affected files
4. propose a correction
5. wait for Human Review when the correction changes Core behavior
