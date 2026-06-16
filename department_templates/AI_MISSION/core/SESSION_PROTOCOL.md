# SESSION_PROTOCOL

> Canonical department-facing session-protocol template for an exported
> `AI_MISSION/` package. It is the canonical upstream for
> `AI_MISSION/core/SESSION_PROTOCOL.md` in a Department Pack.
>
> Scope: this governs a deployed Department Pack inside a target project repository.
> It is distinct from, and does NOT replace, the AI-STUDIO repository's own
> `core/SESSION_PROTOCOL.md`. It is informed by that protocol for the shared spine
> (Phase 0, session health, `STOP_AND_HANDOFF`, validation) and explicitly owns
> department-pack concerns — project-local `AI_STUDIO/` precedence, Mission Pack
> Rules, project completion return — that cannot be derived from it by a
> sanitize-only transform. Where the two differ, it reflects the field-deployment
> context per `core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`, not a disagreement.
>
> Replace each `{{...}}` placeholder at export time, then remove this quote block:
> - `{{DEPARTMENT_NAME}}` — department label (e.g. `R&D`, `reskin`).
> - `{{WORK_ADJECTIVE}}` — adjective for the department's work (e.g. `R&D`,
>   `reskin`); usually the same as `{{DEPARTMENT_NAME}}`.
> - `{{MISSION_PACK_DIR}}` — Mission Pack folder (e.g. `GameRND_v1`, `Reskin_v1`).
> - `{{MISSION_PACK_PROHIBITED_DECISIONS}}` — the department's prohibited-decisions
>   list (e.g. for reskin: `account, signing, privacy, compliance, advertising,
>   store, release, commit, or push decisions`).

## Purpose

This file defines the session workflow for the {{DEPARTMENT_NAME}} department `AI_MISSION/` package.

The goal is to prevent chat-only context, preserve project evidence, and keep {{WORK_ADJECTIVE}} work reviewable across sessions.

## Source Of Truth

The target project repository is the source of truth for project implementation files.

If the target project already has `AI_STUDIO/`, project-local `AI_STUDIO/` is the source of truth for project operating rules.

`AI_MISSION/` is a startup scaffold and Mission Pack. It must not overwrite, replace, merge, or migrate project-local `AI_STUDIO/` without Human Director approval.

When package guidance conflicts with project-local instructions, stop and escalate before acting.

## New Session Bootstrap

For a new {{WORK_ADJECTIVE}} session, read in this order:

1. `START_HERE.md`
2. `AGENTS.md`
3. `core/AI_ROLE_ROUTING.md`
4. `core/TOOL_ROUTING.md`
5. `core/PROJECT_HANDOFF.md`
6. `core/TASK_TEMPLATE.md`, when structured task execution is needed
7. `{{MISSION_PACK_DIR}}/MISSION.md`
8. `PROJECT_CONTEXT.md`, when project facts already exist

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
- Confirm relevant files before editing.
- Confirm allowed and forbidden files.
- Confirm Executor and Reviewer.
- Confirm whether Human Review is required before implementation.
- Confirm protected decisions are not being made by AI tools.
- Confirm current session state: `GREEN`, `YELLOW`, or `RED`.

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

- context integrity is uncertain
- repository state is uncertain
- allowed files, forbidden files, or authority boundaries are unclear
- project-local `AI_STUDIO/` may be overwritten, merged, or replaced
- a protected decision is needed
- checkpoint work is completed
- the task is moving from planning into implementation
- the task is moving from implementation into review or commit
- Human explicitly requests stop, handoff, checkpoint, or new session

After a checkpoint, the agent must not automatically enter the next feature or next task. Continue only through a new session or explicit Human authorization.

## Task Execution Rules

When a task is approved for execution:

- define objective
- define scope
- define out of scope
- identify Executor and Reviewer
- list allowed files
- list forbidden files
- define acceptance criteria
- define objective validation evidence
- define subjective Human Review questions, if any
- note risks and rollback path
- produce a concise handoff when done

Use `core/TASK_TEMPLATE.md` when a durable task record is needed.

## Objective And Subjective Validation

AI should complete objective validation whenever practical before asking Human Director for judgment.

Objective validation may include:

- file existence checks
- before/after diffs
- configuration checks
- script or test output
- build logs
- runtime logs
- asset reference checks
- checklist results
- screenshots or recordings when they prove a concrete state

Human Review should focus on subjective experience, direction, priorities, final authorization, protected decisions, and risk acceptance.

Human Review reduction means reducing unnecessary manual checking by preparing evidence first. It does not mean removing Human Director from decisions.

## {{DEPARTMENT_NAME}} Mission Pack Rules

`{{MISSION_PACK_DIR}}/` guides one real {{WORK_ADJECTIVE}} validation run.

The project team executes the project.

AI maintains records, evidence, decisions, issues, artifacts, timeline, feedback, and completion package.

The Mission Pack must not approve {{MISSION_PACK_PROHIBITED_DECISIONS}}.

Protected decisions require Human Director approval.

## Project Completion Return

At project completion:

1. AI completes `PROJECT_COMPLETION_PACKAGE.md`.
2. AI checks that records are current.
3. AI records unresolved risks and skipped validation.
4. The team returns the entire `AI_MISSION/` folder to Human Director.
