# DEPARTMENT_PACK_EXPORT_PROTOCOL

## Purpose

This protocol defines the minimum source rules for exporting AI-STUDIO Department Packs.

It exists to prevent department packages from depending on files that are not included in the package, leaking unrelated repositories, or confusing project teams about startup and return scope.

This protocol does not modify existing department packs by itself.

## Department Pack Must Be Self-Contained

Every Department Pack must be usable without reading the external AI-STUDIO repository.

At export time, the package must contain:

```text
README.md
AI_MISSION/
  START_HERE.md
  AGENTS.md
  README.md
  PROJECT_CONTEXT.md
  PROJECT_OBSERVATIONS.md
  PROJECT_DECISIONS.md
  PROJECT_ISSUES.md
  PROJECT_ARTIFACTS.md
  PROJECT_TIMELINE.md
  PROJECT_AI_FEEDBACK.md
  PROJECT_COMPLETION_PACKAGE.md
  core/
    AI_ROLE_ROUTING.md
    TOOL_ROUTING.md
    SESSION_PROTOCOL.md
    PROJECT_HANDOFF.md
  <MissionPack_v1>/
    MISSION.md
    README.md
    ...
```

The exact Mission Pack folder name may vary by department, such as `Reskin_v1/` or `GameRND_v1/`.

## README Reference Rules

Department Pack README files must not reference files that are not included in the package.

Department Pack README files must not require the project team to read external `AI-STUDIO/core/...` files unless those files are copied into the package.

The outer department `README.md` must state:

- the project team should copy or use the entire `AI_MISSION/` folder
- the first entry point is `AI_MISSION/START_HERE.md`
- the project team should return the entire `AI_MISSION/` folder at project completion

The outer department `README.md` must not say that the team should use or return only a Mission Pack subfolder.

## AI Role Routing Requirement

Every Department Pack must make AI role boundaries readable to the project team.

At minimum, it must explain:

- ChatGPT: main brain, direction judgment, and Human decision support
- Codex: task breakdown, repository orchestration, diff review, run summary, and checkpoint judgment
- Cursor: execution edits, code, configuration, assets, and batch file processing
- Claude: complex review, long-context retrospective, risk check, and second opinion
- Human Director: final decisions, account, signing, privacy, advertising, store submission, commit, push, and release authorization

These roles are routing guidance, not permanent authority.

Human Final Decision remains the highest authority.

## Tool Routing Requirement

Every Department Pack must explain tool routing for common execution cases:

- simple batch modification: Cursor Composer
- complex code, multi-file refactor, difficult bug: Cursor GPT-5.5
- task breakdown, acceptance criteria, review, run summary: Codex
- complex plan retrospective, long-document review, risk review: Claude
- direction discussion, strategy judgment, next-stage decision: ChatGPT

Tool routing must not authorize scope expansion or protected decisions.

## Project Repository Source Of Truth

For R&D and other project-repository-based Department Packs:

- if the real project repository already has `AI_STUDIO/`, the project-local `AI_STUDIO/` is the source of truth for that project
- department `AI_MISSION/` is a startup scaffold and Mission Pack
- department `AI_MISSION/` must not overwrite, migrate, merge, or replace project-local `AI_STUDIO/` without approval
- migration, merge, or replacement of project-local `AI_STUDIO/` must be approved by Human Director

When project-local instructions conflict with a Department Pack, escalate before acting.

## Return Scope Rule

At project completion, the team must return the entire:

```text
AI_MISSION/
```

Do not ask the team to return only:

- `Reskin_v1/`
- `GameRND_v1/`
- any single Mission Pack subfolder

Mission Pack subfolders are part of the returned `AI_MISSION/` package.

## Packaging Safety Rules

Department Pack zip files must not include:

- `D:\AI\AI-STUDIO`
- `D:\AI\AI-STUDIO\.git`
- `D:\AI\.git`
- other department packages
- temporary files
- cache files
- system files

The recommended package root is the department folder being delivered, not `D:\AI`.

Before export, inspect the package tree and confirm the zip boundary.

## Department Trial Gate

Every Department Pack must pass these checks before it is sent out:

- entry consistency check
- self-contained file existence check
- AI role readability check
- return scope check
- packaging scope check
- no `.git`
- no AI-STUDIO repository
- no other department packages

## Gate Names

Use these gate names:

```text
NOT_READY_FOR_DEPARTMENT_TRIAL
CANDIDATE_READY
READY_FOR_DEPARTMENT_TRIAL
```

Use `NOT_READY_FOR_DEPARTMENT_TRIAL` when required files are missing, README references are broken, role routing is unclear, return scope is wrong, or packaging boundaries are unsafe.

Use `CANDIDATE_READY` when the pack appears complete but has not completed final export validation.

Use `READY_FOR_DEPARTMENT_TRIAL` only after all Department Trial Gate checks pass.

## Non-Goals

This protocol does not create a full department management system.

This protocol does not modify existing department packages automatically.

This protocol does not approve implementation of parked organizational models.

This protocol does not authorize commits, pushes, releases, account changes, signing changes, privacy changes, advertising changes, or store submission decisions.
