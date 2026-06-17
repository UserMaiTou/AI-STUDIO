# department_templates

## What this is

`department_templates/` is the **canonical upstream template source** for the
AI-STUDIO department-pack scaffold surfaces that otherwise have no canonical home.

It is the source side of a `canonical -> export` relationship, mirroring how
`mission_packs/` is the canonical source for Mission Pack content.

## What this is NOT

- This is **not** an exported Department Pack.
- This is **not** a field copy of any delivered or returned pack.
- This is **not** generator output, a manifest, or an export-automation artifact.

Exported Department Packs remain field copies and feedback inputs (see
`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`). Content here does not become a field
copy by being exported, and returned field content does not become canonical here
without Human Director review.

## Scope

This directory holds canonical templates ONLY for department-pack surfaces that
have no other canonical source. Files that already have a canonical home are NOT
duplicated here:

- `core/TOOL_ROUTING.md`, `core/PROJECT_HANDOFF.md`, and `core/TASK_TEMPLATE.md` are
  copied from the AI-STUDIO canonical `core/` at export time, not stored here.
- `core/SESSION_PROTOCOL.md` (the AI-STUDIO repo's own session protocol) is **not**
  stored here and is not replaced. The department-facing session protocol is a
  **separate exported-surface template** at `AI_MISSION/core/SESSION_PROTOCOL.md`
  (see "Current contents" and "Department session protocol" below): a controlled
  derivation informed by `core/SESSION_PROTOCOL.md` that explicitly owns
  department-pack concerns. The two are distinct canonical sources for distinct
  scopes (the repo vs a deployed pack), not a fork of one file.

## Current contents

- `AI_MISSION/core/AI_ROLE_ROUTING.md` — canonical role-routing template, aligned
  to the Claude-primary model (`AGENTS.md`, `core/TOOL_ROUTING.md`).
- `AI_MISSION/core/SESSION_PROTOCOL.md` — department-facing session-protocol
  template (parameterized: `{{DEPARTMENT_NAME}}` / `{{WORK_ADJECTIVE}}` /
  `{{MISSION_PACK_DIR}}` / `{{MISSION_PACK_PROHIBITED_DECISIONS}}`). A controlled
  derivation of the repo's `core/SESSION_PROTOCOL.md` — distinct from and not a
  replacement for it; owns project-local `AI_STUDIO/` precedence, Mission Pack
  Rules, and project completion return.
- `AI_MISSION/START_HERE.md` — canonical, department-neutral entry template with a
  Claude-primary launch flow and `<DepartmentName>` / `<ProjectKind>` /
  `<MissionPack_v1>` placeholders.
- `AI_MISSION/PROJECT_CONTEXT.md`, `PROJECT_OBSERVATIONS.md`,
  `PROJECT_DECISIONS.md`, `PROJECT_ISSUES.md`, `PROJECT_ARTIFACTS.md`,
  `PROJECT_TIMELINE.md`, `PROJECT_AI_FEEDBACK.md`, `PROJECT_COMPLETION_PACKAGE.md`
  — blank record templates (project-data-free; byte-faithful to the deployed field
  forms, which were already model-neutral blanks).

## Department session protocol (resolved: option A)

The department-facing `AI_MISSION/core/SESSION_PROTOCOL.md` is NOT produced by a
sanitize-only transform of the repo's `core/SESSION_PROTOCOL.md`. A read-only
investigation of the deployed field packs found the department variant is not a
sanitized subset of canonical: it carries department-authored content with no
canonical equivalent (project-local `AI_STUDIO/`-precedence Source-of-Truth, a
Project Completion Return section, department Mission Pack Rules, and extra
bootstrap / validation entries) while omitting several repo-only sections. A
sanitize-from-canonical would be lossy in both directions.

Per Human Director decision (option A), the department session protocol is its own
canonical exported-surface template here — informed by `core/SESSION_PROTOCOL.md`
for the shared spine (Phase 0, session health, `STOP_AND_HANDOFF`, validation) and
owning the department-pack-specific sections. To keep this a **controlled**
derivation rather than an uncontrolled fork:

- `core/SESSION_PROTOCOL.md` remains the canonical protocol for the AI-STUDIO repo;
  the template here is canonical only for the exported Department Pack surface.
- The template's header states its scope and its relationship to the repo protocol.
- It does not contradict the repo protocol's shared spine; where it differs, the
  difference is a documented field-deployment-scope concern.

No generator is used; placeholders are resolved by the documented manual export.

## Status

All department-pack scaffold surfaces that previously had no canonical home now
have a canonical template here: `START_HERE.md`, `core/AI_ROLE_ROUTING.md`,
`core/SESSION_PROTOCOL.md`, and the eight `PROJECT_*` records. The export
protocol's Source Map (`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`) classifies these
as `canonical -> export`; no department-pack surface remains
`department-authored / no canonical source yet`.

## Field-pack reconciliation (next Human-approved export only)

Deployed field packs (e.g. `D:\AI\研发部`, `D:\AI\换皮部`) still carry pre-alignment
content. Do NOT edit deployed packs directly. At each pack's next Human-approved
export, regenerate from these canonical templates:

1. `core/AI_ROLE_ROUTING.md` and `AGENTS.md` — realign from pre-2G
   (ChatGPT main brain / Codex orchestration / Cursor heavy execution / Claude
   second-opinion) to Claude-primary / Codex-advisory / Cursor-when-assigned /
   ChatGPT-decision-support / Human-final.
2. `START_HERE.md` — Claude-primary launch flow ("Open Claude"), resolved
   placeholders, and the explicit `AI maintains:` record list.
3. `core/SESSION_PROTOCOL.md` — regenerate from the department-facing
   `core/SESSION_PROTOCOL.md` template (resolve the placeholders). The template
   already keeps `core/PARKING_LOT.md` out of the field read order.
4. `PROJECT_*` records — match the blank canonical structure; preserve any real
   project DATA already in a deployed pack (structure reconcile, not data wipe);
   returned content is feedback, reviewed before any upstream adoption.
5. Re-run the Department Trial Gate (`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`
   Department Trial Gate) before sending.

## Authority

Human Final Decision is the highest authority. Changes here flow
`canonical -> export`; returned field changes are feedback inputs reviewed by the
Human Director before adoption. No generator, manifest, or export automation is
implied by this directory.
