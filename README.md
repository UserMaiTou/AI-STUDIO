# AI-STUDIO

AI-STUDIO is an AI-driven Product Development Operating System.

It supports project governance, agent collaboration, tool routing, Mission Pack management, project experience recovery, and continuous optimization.

Start here for AI sessions: read `core/SESSION_PROTOCOL.md` for the New Session Bootstrap before choosing task-specific files.

## What This Repository Is

This repository contains the minimal independent AI-STUDIO operating rules and the first validated Mission Pack.

## What This Repository Is Not

AI-STUDIO is not:

- a Unity project
- BlockCore
- Runtime
- Package
- Framework
- SDK
- code library

## Repository Structure

```text
.claude/
core/
department_templates/
mission_packs/
tools/
AGENTS.md
README.md
.gitignore
```

## Core

Core contains project-neutral operating protocols:

- Project handoff
- Tool routing
- Session protocol
- Task template
- Parking Lot
- Department pack export protocol

## v1.1 Core Focus

AI-STUDIO v1.1 adds project-neutral guardrails for:

- session health checks and `STOP_AND_HANDOFF`
- standard handoff packages
- compact bootstrap prompts for new sessions
- Phase 0 read-only review before implementation
- objective validation by AI, scripts, tests, or checklists
- role boundaries for Claude, Codex, Cursor, ChatGPT, and Human Director

## Mission Packs

Mission Packs are delivery packages for specific workflows.

Included Mission Packs:

- Reskin_v1
- GameRND_v1

## Collaboration Rules

Agent collaboration is governed by `AGENTS.md`.

Human Review is required for repository-shaping decisions.

## Migration Boundary

This repository intentionally excludes Unity, BlockCore Runtime, Gameplay history, secrets, and unrelated project-specific content.

## Bootstrap Status

Initial bootstrap target:

- migrate approved AI_STUDIO Core documents
- migrate approved Reskin_v1 Mission Pack documents
- create lightweight independent README
- create lightweight independent AGENTS.md
- create safe .gitignore
