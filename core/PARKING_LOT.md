# PARKING_LOT

## Purpose

This file stores valuable ideas that are intentionally deferred.

Items in this file:

- are not approved work
- are not active tasks
- are not backlog commitments
- must not be implemented without Human approval
- may be revisited when project conditions change

The goal is to preserve potentially valuable ideas without polluting active Core rules, Mission Pack execution, or current task scope.

## Rules

### PL-RULE-001

Parking Lot is not a backlog.

Items here are ideas, hypotheses, or future directions.

They are not commitments.

### PL-RULE-002

No agent may implement a Parking Lot item directly.

A dedicated task and Human approval are required.

### PL-RULE-003

Items should be periodically reviewed after major project milestones or operating model checkpoints.

### PL-RULE-004

If an item remains irrelevant after multiple reviews, it may be archived or removed with Human Review.

## Parked Items

### PL-0001 - Skill Layer

Status: Parked

Priority: P2

Reason:
Potentially valuable, but tool routing and Mission Pack workflow should be validated first.

Description:
Create a small set of reusable skills focused on recurring AI-STUDIO workflows.

Candidate skills:

- handoff preparation
- mission review
- tool routing review
- retrospective analysis
- task planning

Gate:
Revisit after several real tasks use `PROJECT_HANDOFF` and `TOOL_ROUTING`.

### PL-0002 - Onboarding Layer

Status: Parked

Priority: P2

Reason:
Project onboarding value is clear, but the minimal repository should remain small until the first workflow is validated.

Description:
Create a lightweight onboarding document answering:

- What is AI-STUDIO?
- What should a new collaborator read first?
- How should a Mission Pack be approached?

Gate:
Revisit after the first independent repository review.

### PL-0003 - Operating Model Expansion

Status: Parked

Priority: P2

Reason:
Potential future need for a broader operating model.

Description:
Document how AI-STUDIO operates across:

- Human Final Decision
- review flow
- tool routing philosophy
- Mission Pack lifecycle
- knowledge recovery

Gate:
Revisit after the first Mission Pack has completed a full execution and retrospective cycle.

### PL-0004 - Layered Repository Architecture

Status: Parked

Priority: P3

Reason:
Promising long-term structure, but too heavy for the first repository version.

Concept:

- Core
- Mission Packs
- optional domain packs
- optional project packs
- optional skill packs

Gate:
Revisit only when a second real workflow adopts AI-STUDIO.

### PL-0005 - External Benchmarking

Status: Parked

Priority: P2

Reason:
High-quality external agent workflows and operating models exist.

Direct adoption is risky, but periodic benchmarking may reveal useful principles.

Description:
Periodically review:

- agent workflows
- skill systems
- AI operating models
- repository scaffolds
- tool orchestration patterns

Goal:
Extract principles. Do not copy implementations.

Evaluation criteria:

1. Solves a real AI-STUDIO problem
2. Improves product quality
3. Does not significantly increase bootstrap cost
4. Does not create governance bloat

Gate:
Review only after meaningful repository milestones.
