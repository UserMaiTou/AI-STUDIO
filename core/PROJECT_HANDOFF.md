# PROJECT_HANDOFF

## Purpose

This file provides stable handoff context for AI-STUDIO.

Responsibility: owns the handoff/bootstrap artifact specification, including the 10-field standard package, full handoff, compact bootstrap, and session naming.

AI-STUDIO is an AI-driven Product Development Operating System for product outcomes, Mission Pack execution, Tool Routing, Knowledge Recovery, and continuous optimization.

This file is not a project history dump, task log, implementation plan, or parallel authority.

## Read First

For new-session read order, use `core/SESSION_PROTOCOL.md` / `New Session Bootstrap`.

This file intentionally points to that canonical bootstrap order instead of duplicating it.

## Authority Principles

- Human Final Decision is the highest decision gate.
- Repository files are the source of truth.
- Chat context is not authority unless reflected in approved repository files.
- Tools are capabilities, not authorities.
- Executor and Reviewer are separate responsibilities.
- Objective validation belongs to AI, scripts, tests, diffs, logs, or checklists whenever practical.
- Human Review should focus on subjective judgment, direction, final authorization, and protected decisions.
- Core must remain project-neutral.
- Mission Packs are delivery packages, not Core.

## AI-STUDIO Operating Focus

AI-STUDIO helps teams preserve and improve the operating system around product development:

- product objective clarity
- task boundary definition
- agent collaboration
- tool routing
- delivery package management
- review and handoff discipline
- experience recovery from completed work
- continuous process improvement

## Core Boundaries

Core may define:

- collaboration rules
- session protocol
- tool routing principles
- handoff expectations
- task structure
- Parking Lot rules

Core must not contain:

- project-specific product truths
- client-specific strategy
- domain-specific implementation rules
- Mission Pack execution details
- secrets or machine-local configuration

Project-specific or workflow-specific content belongs in a Mission Pack, not Core.

## Stable Workflow Truths

- One task should have one clear deliverable.
- Scope and out-of-scope boundaries must be explicit.
- Allowed and forbidden files define the execution boundary.
- Parking Lot items are not approved work.
- New sessions begin with Phase 0 Read-Only Review unless Human explicitly authorizes implementation.
- Session state must be tracked as `GREEN`, `YELLOW`, or `RED`.
- `RED` session state requires `STOP_AND_HANDOFF`.
- Checkpoint completion stops the current task flow; it must not automatically become the next task.
- Handoffs should be concise, actionable, and repository-linked.
- Reusable lessons from Mission Packs may be proposed for Core only after Human Review.

## Handoff Format

Every handoff must include this standard package:

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

Full Handoff is for durable archival context.

Compact Bootstrap is for a new session prompt and should be short enough to paste without dragging unnecessary history forward.

Additional handoff detail may include:

- current objective
- completed work
- pending work
- known risks
- files changed or proposed
- next recommended action

Avoid long narrative recaps when a repository pointer is enough.

## New Session Naming

Use this format:

```text
[Repo/Project] [Version/Task] — [Purpose]
```

Examples:

```text
AI-STUDIO v1.1 — Scope Planning
AI-STUDIO v1.1 — Core Patch
Companion TASK-0006 — Vertical Slice Review
```

## Pointers

| Need | File |
|---|---|
| Repository identity | `README.md` |
| Agent collaboration rules | `AGENTS.md` |
| Session workflow | `core/SESSION_PROTOCOL.md` |
| Tool routing | `core/TOOL_ROUTING.md` |
| Task structure | `core/TASK_TEMPLATE.md` |
| Deferred ideas | `core/PARKING_LOT.md` |
