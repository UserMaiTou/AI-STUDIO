# SESSION_PROTOCOL

## Purpose

This file defines the repository-driven session workflow for AI-STUDIO.

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

## Session Start Checklist

- Confirm the current objective.
- Confirm whether the request is analysis, planning, execution, review, or handoff.
- Confirm the relevant files before editing.
- Confirm whether Human Review is required before implementation.
- Confirm that Parking Lot items are not being implemented without explicit approval.
- Confirm that project-specific content is not being written into Core.

## Task Execution Rules

When a task is approved for execution:

- define objective
- define scope
- define out of scope
- identify executor and reviewer
- list allowed files
- list forbidden files
- define acceptance criteria
- note risks and rollback path
- produce a concise handoff when done

Use `core/TASK_TEMPLATE.md` when a durable task record is needed.

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

End-of-session handoff should include:

- current objective
- completed work
- pending work
- known risks
- files changed or proposed
- next recommended action

Keep handoffs short and actionable.

## Communication Rules

- Prefer concise, file-linked updates.
- Avoid long recaps of repository content.
- Use exact paths when referencing files.
- Separate facts, assumptions, and recommendations.
- Stop and ask for Human Review when scope or authority is unclear.

## Violation Handling

If an agent notices a violation, it should:

1. stop expanding scope
2. identify the violated rule
3. identify affected files
4. propose a correction
5. wait for Human Review when the correction changes Core behavior
