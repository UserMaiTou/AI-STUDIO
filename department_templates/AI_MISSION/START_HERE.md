# START_HERE

> Canonical department-neutral template. Replace each `<...>` placeholder at
> export time, then remove this quote block. Placeholders:
> - `<DepartmentName>` — human-readable department/team label (e.g. `R&D`, `reskin`).
> - `<ProjectKind>` — work-type phrase used in the launch prompt and planning
>   round (e.g. `R&D`, `reskin`).
> - `<MissionPack_v1>` — the Mission Pack folder name for this pack
>   (e.g. `GameRND_v1`, `Reskin_v1`).

## Purpose

This AI_MISSION package is self-contained for a new project <DepartmentName> team.

The project team can copy the whole `AI_MISSION/` folder into the project root and start without reading the external AI-STUDIO repository.

If the target project already has its own `AI_STUDIO/`, that project-local `AI_STUDIO/` is the source of truth for that project.

AI_MISSION is a startup scaffold and Mission Pack. It must not overwrite, replace, or merge project-local `AI_STUDIO/` without Human Director approval.

## Human Launch Steps

1. Copy the entire `AI_MISSION/` folder into the target project root.
2. Open Claude (the primary daily interface) and say:

```text
We are starting a new <ProjectKind> task using AI_MISSION.
Read AI_MISSION/START_HERE.md, AI_MISSION/AGENTS.md, AI_MISSION/core/AI_ROLE_ROUTING.md, and AI_MISSION/<MissionPack_v1>/MISSION.md.
If this project already has AI_STUDIO/, treat project-local AI_STUDIO/ as source of truth.
Start in Phase 0 Read-Only Review unless Human explicitly authorizes implementation.
First, help us fill AI_MISSION/PROJECT_CONTEXT.md.
Then start the first <ProjectKind> planning round.
```

3. Let Claude fill or update `PROJECT_CONTEXT.md` first.
4. Let Claude maintain the project records during execution.
5. Return the entire `AI_MISSION/` folder to Human Director when the project ends.

## Interface Roles

Full role boundaries are in `core/AI_ROLE_ROUTING.md` and `AGENTS.md`. In short:

- Claude — primary daily interface and project lead (Executor, not final Reviewer).
- Codex — advisory / second opinion only.
- Cursor — implementation execution when assigned.
- ChatGPT — Human Director decision support (direction and strategy).
- Human Director — final authority and all protected decisions.

## First Files To Read

1. `START_HERE.md`
2. `AGENTS.md`
3. `core/AI_ROLE_ROUTING.md`
4. `core/TOOL_ROUTING.md`
5. `core/SESSION_PROTOCOL.md`
6. `core/PROJECT_HANDOFF.md`
7. `core/TASK_TEMPLATE.md`, when structured task execution is needed
8. `<MissionPack_v1>/MISSION.md`

## Project Team Responsibility

- do the project
- collaborate with AI
- provide facts, files, screenshots, build results, and project constraints when AI asks
- escalate protected decisions to Human Director

## AI Responsibility

- record process
- record decisions
- record issues
- record artifacts
- record timeline
- generate completion package

AI maintains:

- `PROJECT_CONTEXT.md`
- `PROJECT_OBSERVATIONS.md`
- `PROJECT_DECISIONS.md`
- `PROJECT_ISSUES.md`
- `PROJECT_ARTIFACTS.md`
- `PROJECT_TIMELINE.md`
- `PROJECT_AI_FEEDBACK.md`
- `PROJECT_COMPLETION_PACKAGE.md`

The project team does not need to manually organize project experience.

AI should complete objective validation with evidence such as diffs, logs, scripts, builds, configuration checks, and checklists whenever practical before asking Human Director for judgment.
