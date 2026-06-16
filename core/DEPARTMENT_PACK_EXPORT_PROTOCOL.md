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

Exported role guidance should stay aligned with `AGENTS.md` and `core/TOOL_ROUTING.md`.

At minimum, it must explain:

- Claude: primary daily repo execution interface and project lead, via scoped subagents (implementation, read-only review, boundary checking, risk review); Executor, not final Reviewer
- Codex: advisory / second-opinion only — task breakdown input, repository-state sanity, and commit recommendation
- Cursor: implementation execution for code, configuration, assets, and batch file processing, when assigned
- ChatGPT: Human Director decision support, direction judgment, and strategy discussion
- Human Director: final decisions, account, signing, privacy, advertising, store submission, commit, push, and release authorization

These roles are routing guidance, not permanent authority.

Human Final Decision remains the highest authority.

## Tool Routing Requirement

Every Department Pack must explain tool routing for common execution cases:

- complex code, multi-file refactor, difficult bug, execution planning, repo hygiene: Claude (primary execution interface / project lead, via scoped subagents)
- simple batch modification, assets, code/configuration execution when assigned: Cursor
- task breakdown input, repository-state sanity, commit recommendation, second opinion: Codex (advisory only)
- complex plan retrospective, long-document review, risk review, boundary checking: Claude (read-only subagents; final review authority remains Human)
- direction discussion, strategy judgment, next-stage decision: ChatGPT (Human Director decision support)

Tool routing must not authorize scope expansion or protected decisions.

## Project Repository Source Of Truth

For R&D and other project-repository-based Department Packs:

- if the real project repository already has `AI_STUDIO/`, the project-local `AI_STUDIO/` is the source of truth for that project
- department `AI_MISSION/` is a startup scaffold and Mission Pack
- department `AI_MISSION/` must not overwrite, migrate, merge, or replace project-local `AI_STUDIO/` without approval
- migration, merge, or replacement of project-local `AI_STUDIO/` must be approved by Human Director

When project-local instructions conflict with a Department Pack, escalate before acting.

## Source Map / Manifest Expectations

Exported Department Packs are field copies and feedback inputs.

They are not canonical AI-STUDIO source.

At export review time, each pack should have enough source-map or manifest information to explain where exported content came from and how returned changes should be reviewed.

This protocol does not require creating a new manifest file yet.

A source map may classify exported files or file groups by directionality:

- `canonical -> export`: copied or adapted from AI-STUDIO canonical source
- `export-only`: created only to make the delivered pack usable
- `department-authored / no canonical source yet`: created for the department pack with no approved canonical source
- `bidirectional-needs-review`: may return useful changes, but must be reviewed before any upstream adoption

Minimum source-map fields or categories:

- exported path
- directionality classification
- canonical source path, or `none yet`
- export purpose
- expected return-review gate

## Canonical Department Template Source

Canonical templates for department-pack scaffold surfaces live in the top-level
`department_templates/` directory (Human-approved; see PL-0010 in
`core/PARKING_LOT.md`). It is the source side of a `canonical -> export`
relationship, mirroring how `mission_packs/` is the canonical source for Mission
Pack content. It is not an exported pack, a field copy, generator output, or a
manifest.

Directionality of the standard `AI_MISSION/` surfaces:

- `canonical -> export` from `department_templates/AI_MISSION/`: `START_HERE.md`,
  `core/AI_ROLE_ROUTING.md`, `core/SESSION_PROTOCOL.md` (a department-facing
  template — a controlled derivation of the repo's own `core/SESSION_PROTOCOL.md`,
  distinct from and not a replacement for it), and the eight `PROJECT_*` records.
- `canonical -> export` from AI-STUDIO `core/` / root at export time (not stored in
  `department_templates/`): `core/TOOL_ROUTING.md`, `core/PROJECT_HANDOFF.md`, and
  the department-adapted `AGENTS.md`.
- No standard `AI_MISSION/` surface remains `department-authored / no canonical
  source yet`. A filled `PROJECT_*` record in a delivered pack is a field copy and
  is `bidirectional-needs-review` for any returned change.

Export generator scripts remain out of scope. Department-pack export resolves
template placeholders by the documented manual procedure, not a generator.

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

## Return Feedback Review

Returned Department Pack or friend-package content is feedback input.

It must not auto-merge into AI-STUDIO, Core, Mission Packs, templates, tools, or future exports.

Returned changes must be reviewed by Human Director before they become canonical source, reusable protocol, or future export content.

Review should identify:

- what changed in the returned package
- whether the change is project-specific, department-specific, or generally reusable
- whether the change should remain feedback only
- whether a follow-up task is needed before any AI-STUDIO source edit

## Packaging Safety Rules

Department Pack zip files must not include:

Windows example exclusions:

- `D:\AI\AI-STUDIO`
- `D:\AI\AI-STUDIO\.git`
- `D:\AI\.git`

General exclusions:

- `core/PARKING_LOT.md` or internal roadmap material unless Human explicitly approves
- other department packages
- temporary files
- cache files
- system files

The recommended package root is the department folder being delivered, not a broad workspace root such as `D:\AI`.

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
