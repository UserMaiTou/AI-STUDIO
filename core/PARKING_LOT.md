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

Internal-only note:
Parking Lot is internal roadmap and deferred strategy material.
It must not be included in external packages, friends training packages, department exports, or sanitized `AI_MISSION/` exports unless Human explicitly approves.

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

Authorization note:
v1.1.1 is Human-approved to implement only the handoff preparation sub-item as a minimal executable tool.

This does not approve the full Skill Layer, Agent OS, CI/hooks, Runtime Probe, benchmark system, or any automatic commit/push workflow.

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

### PL-0006 - AI-Operated Department Model

Status: Parked

Priority: P1

Reason:
This is one of AI-STUDIO's long-term directions.

Current focus should remain on real project validation now that AI_MISSION v1 is frozen, rather than continuing to expand organizational architecture.

Without real project evidence, this should not enter implementation.

Description:
Long-term target:

```text
Human Director
↓
AI-STUDIO
↓
Department Lead
↓
Specialized AI Agents
```

Principle:
This is not about replacing people with AI.

It is about:

```text
1 experienced human
+
multiple AI Agents
```

forming a high-efficiency project department.

Goal:
Reduce department dependence on a large number of execution personnel.

Possible future evolution:

Phase 1:
AI records experience.

Status: Completed.

Phase 2:
AI bootstraps projects.

Phase 3:
AI assigns specialist agents.

Phase 4:
AI executes most workflow steps.

Human responsibility remains:

- strategic decisions
- resource allocation
- risk acceptance
- final approval

Key Question:
Which work can be safely transferred from people to AI without reducing project quality?

Gate:
Wait for at least:

- reskin project #1 completed and returned with AI_MISSION
- R&D project #1 completed and returned with AI_MISSION

Re-evaluate only after real project analysis is complete.

### PL-0007 - Cold-start navigation: README Start Here pointer vs dedicated AI_CONTEXT_GUIDE.md
Status: PARKING_LOT_FIRST / DO_NOT_ADD_FOR_NOW
Decision: Do not add root `AI_CONTEXT_GUIDE.md` for now because README and `core/SESSION_PROTOCOL.md` already cover startup navigation.
Risk: Avoid duplicate bootstrap truth, maintenance drift, extra root entrypoints, and mini-Core expansion.
Future candidate: If cold-start pain persists, prefer adding a one-line Start Here pointer in `README.md` to `core/SESSION_PROTOCOL.md` New Session Bootstrap, rather than creating a new root `AI_CONTEXT_GUIDE.md`.

### PL-0008 - Department export bootstrap drift

Status: Parked

Priority: P3

Reason:
Department export packages currently contain duplicate bootstrap/read-order surfaces:

- `START_HERE.md`
- `core/SESSION_PROTOCOL.md`

Observed drift:
Both `D:\AI\研发部` and `D:\AI\换皮部` show the same low-severity bootstrap drift:

- `START_HERE.md` lists `core/SESSION_PROTOCOL.md` but not `PROJECT_CONTEXT`.
- `core/SESSION_PROTOCOL.md` lists `PROJECT_CONTEXT` but not itself.

Current action:
Do not edit exported department folders now.

Blocker:
The department package source-of-truth / generation path is unclear.

Future target:
Option C, pending source-of-truth decision:

- `START_HERE.md` should be a short human-facing entry.
- department `core/SESSION_PROTOCOL.md` should own the canonical read order.

Export note:
Keep this item internal-only. Do not include it in external packages, department exports, or sanitized export packages unless Human explicitly approves.

### PL-0009 - Claude-centered workflow migration

Status: Approved for staged minimal bootstrap (Phase 2G, Pass 1)

Priority: P2

Reason:
A Phase 2F0 read-only planning review considered shifting AI-STUDIO from the current multi-tool workflow (ChatGPT direction, Codex execution/records, Cursor implementation, Claude read-only review) toward a Claude-centered workflow where Claude Code becomes the primary daily repo interface / project lead with subagents for implementation, review, boundary checking, docs consistency, and risk review.

This overlaps existing parked items:

- It is substantially the AI-Operated Department Model parked as PL-0006.
- It extends the Agent OS direction noted in PL-0001.
- It relates to the unresolved department source-of-truth / generation path noted in PL-0008.

Human approval (Phase 2G):
The Human Director approved starting a staged Claude-centered multi-agent workflow. Codex moves to advisory / second-opinion only. Claude Code becomes the primary daily repo execution interface. This approval is for a minimal staged bootstrap, not unlimited automation.

Gate override record:
This approval consciously overrides PL-0009 Gate 1 (resolve Phase 2F / PL-0008 first) and Gate 2 (PL-0006 real-project return evidence) for the minimal staged bootstrap only. Those gates were written to prevent premature org-model commitment; the override is a Human Final Decision and is recorded here rather than left to contradict the file. Phase 2F / PL-0008 canonical-home work remains open and independent.

Pass 1 scope (approved):

- create three Claude Code subagents under `.claude/agents/`: `repo-reviewer` (read-only), `boundary-checker` (read-only), and `implementer` (scoped write, no git authority)
- update the role boundaries in `AGENTS.md` and `core/TOOL_ROUTING.md` (Codex advisory; Claude primary execution; Executor != Reviewer preserved)
- add a Human-Facing Language Policy to `AGENTS.md` with a pointer from `core/TOOL_ROUTING.md`

Still out of scope until further explicit Human Review:

- Claude settings, hooks, Agent Teams config, templates, generator, manifest, or zip
- editing exported role-routing content in department packs or `core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`
- any automated commit / push / export workflow
- full automation beyond the staged bootstrap

Disposition:
Human Final Decision remains the highest authority. Git and the Human Gate remain hard sources of truth. Commit, push, and export-package changes remain Human-approved. Commit and push for Pass 1 itself remain pending Human approval.

Export note:
Keep this item internal-only. Do not include it in external packages, friends training packages, department exports, or sanitized `AI_MISSION/` exports unless Human explicitly approves.

### PL-0010 - Phase 2F export canonical-home coherence (audit record)

Status: Recorded / Human-gated

Priority: P2

Source:
Recorded from a Claude-primary read-only coherence audit (post-2G, HEAD `1119066`) with adversarial scope verification. This item records findings only. It does not authorize edits to `core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`, role-routing changes, or template creation.

Finding 1 - Accidental-canonical export surfaces (no canonical source yet):
These surfaces are emitted into exported Department Packs by `core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md` but have no canonical source tracked in AI-STUDIO. They fall under the protocol's existing `department-authored / no canonical source yet` directionality class:

- `START_HERE.md`
- `core/AI_ROLE_ROUTING.md`
- the eight `AI_MISSION/PROJECT_*` records (`PROJECT_CONTEXT`, `PROJECT_OBSERVATIONS`, `PROJECT_DECISIONS`, `PROJECT_ISSUES`, `PROJECT_ARTIFACTS`, `PROJECT_TIMELINE`, `PROJECT_AI_FEEDBACK`, `PROJECT_COMPLETION_PACKAGE`)
- the exported / sanitized `AI_MISSION/core/SESSION_PROTOCOL.md`

Precision: `core/SESSION_PROTOCOL.md` IS canonical and tracked; only the exported sanitized copy lacks a distinct source. `core/PROJECT_HANDOFF.md` IS canonical and is NOT in this set.

Risk: with no upstream copy, a returned / field pack can become the de-facto canonical for these surfaces — the "accidental canonical" the protocol warns against (`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md:101-104`). Overlaps PL-0008 (department source-of-truth drift).

Status (2026-06-16): `core/AI_ROLE_ROUTING.md` now has a canonical source at `department_templates/AI_MISSION/core/AI_ROLE_ROUTING.md` (see Finding 3). `START_HERE.md` and the eight `AI_MISSION/PROJECT_*` records remain follow-ups (canonical templates not yet authored). The exported/sanitized `SESSION_PROTOCOL` is handled by sanitize-on-export from canonical `core/SESSION_PROTOCOL.md`, not by a stored source.

Finding 2 - Export protocol role/tool routing aligned to Claude-primary (RESOLVED):
`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md:62` says exported role guidance "should stay aligned with `AGENTS.md` and `core/TOOL_ROUTING.md`". The "AI Role Routing Requirement" (`:58-74`) and "Tool Routing Requirement" (`:76-86`) previously described the pre-2G model (ChatGPT main brain, Codex orchestration, Cursor execution, Claude second-opinion), contradicting the post-2G canonical (`AGENTS.md:61-62`, `core/TOOL_ROUTING.md:39-40`: Claude primary, Codex advisory).

Disposition: RESOLVED — Human Director approved alignment (Choice A). The two sections were updated to reflect the established Claude-primary / Codex-advisory model (reflecting the already-established operating model, not inventing a new field-team model). The PL-0009 (`:312-313`) out-of-scope fence on this specific alignment is lifted by this explicit Human decision.

Finding 3 - Department template home decision (reserved):
The protocol defers canonical department templates (`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md:124-128`) without naming a home. A candidate top-level name (e.g. `department_templates/`) has been discussed but is RESERVED for Human decision: naming or creating a top-level template home is an architecture decision (stop-and-ask) and must not be inscribed into Core or created autonomously. Overlaps PL-0004 (layered architecture) and PL-0008.

Status (2026-06-16): Human Director confirmed the canonical home decisions — top-level `department_templates/`; SESSION_PROTOCOL uses sanitize-on-export (no forked source; canonical stays `core/SESSION_PROTOCOL.md`). A minimal home was created: `department_templates/README.md` + `department_templates/AI_MISSION/core/AI_ROLE_ROUTING.md` (Claude-primary). START_HERE, the eight PROJECT_* templates, and the full sanitize-transform spec are documented follow-ups in `department_templates/README.md`. Still no generator, manifest, automation, or zip; deployed field packs not edited. Anything resembling a template engine / manifest system / export automation requires fresh Human Review.

Minor staleness follow-ups (low priority):
- `README.md:58` still enumerates role boundaries in pre-2G order (Codex, Cursor, Claude, ChatGPT) — role-drift echo; Human-gated, do not silently rewrite role framing.
- `README.md` "Bootstrap Status" (`:79-87`) reads as initial-bootstrap aspiration and is now historically stale.
- `core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md` is absent from the New Session Bootstrap read order (`core/SESSION_PROTOCOL.md:21-28`) and the `core/PROJECT_HANDOFF.md` Pointers table — plausibly intentional (export-time / specialist file); recorded for awareness, not flagged as a defect.

Gate:
Finding 2 is RESOLVED by Human Choice A (role/tool-routing alignment). Finding 3's minimal home is created (see its Status); any further `department_templates/` template/manifest/generator/automation expansion, or any `core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md` template edit, requires fresh Human Review. Finding 1 and the README role / Bootstrap-Status items may be actioned only via separate Human-approved tasks.

Export note:
Keep this item internal-only. Do not include it in external packages, friends training packages, department exports, or sanitized `AI_MISSION/` exports unless Human explicitly approves.
