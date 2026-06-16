# AI_ROLE_ROUTING

## Purpose

This file defines lightweight role boundaries for Claude, Codex, Cursor, ChatGPT,
and the Human Director during a department project run.

It is the department-facing reflection of the canonical AI-STUDIO operating model
in `AGENTS.md` and `core/TOOL_ROUTING.md`. These roles are routing guidance, not
permanent authority.

## Shared Boundaries

- Human Final Decision remains the highest authority.
- Project-local files and project-local `AI_STUDIO/`, when present, are the source
  of truth.
- No role may use tool preference to expand scope or make protected decisions.
- Executor and Reviewer are separate responsibilities. The Executor does not
  self-approve repository-shaping work.
- Objective validation should be backed by evidence such as diffs, logs, scripts,
  builds, configuration checks, or checklists whenever practical.
- Human Director remains responsible for subjective judgment, direction, protected
  decisions, final authorization, and risk acceptance.

## Claude

Claude is the primary daily repo execution interface and project lead, working
through scoped subagents (implementation, read-only review, boundary checking,
risk review).

Use Claude for:

- execution planning and day-to-day repo execution
- complex code, multi-file refactors, and difficult bugs (with Cursor for
  execution edits when assigned)
- complex plan retrospective, long-document review, risk review, and boundary
  checking (read-only subagents)
- repository hygiene

Claude is Executor, not final Reviewer. Final review authority remains with the
Human Director.

## Codex

Codex is advisory / second-opinion only.

Use Codex for:

- task breakdown input
- repository-state sanity checks
- commit recommendation
- second opinion

Codex does not own execution authority and does not directly change implementation
files unless explicitly assigned.

## Cursor

Use Cursor for implementation execution when assigned:

- code implementation
- configuration
- assets
- batch file processing

Cursor should not decide protected business, account, signing, privacy,
advertising, store, commit, push, or release matters.

### Cursor Composer

Use Cursor Composer for simple batch modifications when target files are known, the
desired change is clear, scope is narrow, and rollback is understandable.

### Cursor implementation agent

Use the strongest approved Cursor implementation model available for heavy
execution work assigned to Cursor (complex code, multi-file refactors, difficult
bugs) under Claude's lead.

## ChatGPT

Use ChatGPT for Human Director decision support:

- direction judgment
- technical route discussion
- strategy discussion
- next-stage recommendation

## Human Director

Human Director owns:

- final approval
- account, signing, privacy, advertising, and store decisions
- commit, push, and release authorization
- risk acceptance

## Startup Assignment

Recommended first round:

1. Claude (primary interface) starts the project and, with the team, fills
   `PROJECT_CONTEXT.md`; ChatGPT supports direction.
2. Claude breaks down the first task and acceptance criteria; Codex provides an
   advisory second opinion.
3. Claude executes approved project-local changes through scoped subagents; Cursor
   executes when assigned.
4. Read-only review (Claude subagents) checks risk and boundaries at major
   decision points.
5. Human Director approves protected decisions.
