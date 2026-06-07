# PROJECT_HANDOFF

## Purpose

This file provides stable handoff context for AI-STUDIO.

AI-STUDIO is an AI-driven Product Development Operating System for product outcomes, Mission Pack execution, Tool Routing, Knowledge Recovery, and continuous optimization.

This file is not a project history dump, task log, implementation plan, or parallel authority.

## Read First

For a new session in this repository, read:

1. `README.md`
2. `AGENTS.md`
3. `core/PROJECT_HANDOFF.md`
4. `core/TOOL_ROUTING.md`
5. `core/PARKING_LOT.md`
6. `core/TASK_TEMPLATE.md`, when a task needs structured execution

Mission Pack files are read only when the human assigns or reviews that Mission Pack.

## Authority Principles

- Human Final Decision is the highest decision gate.
- Repository files are the source of truth.
- Chat context is not authority unless reflected in approved repository files.
- Tools are capabilities, not authorities.
- Executor and Reviewer are separate responsibilities.
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
- Handoffs should be concise, actionable, and repository-linked.
- Reusable lessons from Mission Packs may be proposed for Core only after Human Review.

## Handoff Format

Every handoff should include:

- current objective
- completed work
- pending work
- known risks
- files changed or proposed
- next recommended action

Avoid long narrative recaps when a repository pointer is enough.

## Pointers

| Need | File |
|---|---|
| Repository identity | `README.md` |
| Agent collaboration rules | `AGENTS.md` |
| Session workflow | `core/SESSION_PROTOCOL.md` |
| Tool routing | `core/TOOL_ROUTING.md` |
| Task structure | `core/TASK_TEMPLATE.md` |
| Deferred ideas | `core/PARKING_LOT.md` |
