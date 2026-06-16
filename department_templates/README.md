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

- `core/TOOL_ROUTING.md` and `core/PROJECT_HANDOFF.md` are copied from the
  AI-STUDIO canonical `core/` at export time, not stored here.
- `core/SESSION_PROTOCOL.md` is **not** stored here. The canonical session
  protocol remains `core/SESSION_PROTOCOL.md`, and AI-STUDIO does not maintain a
  second, forked SESSION_PROTOCOL source. How the department-facing variant should
  be produced is currently under Human review (see "Sanitize-on-export" below).

## Current contents

- `AI_MISSION/core/AI_ROLE_ROUTING.md` — canonical role-routing template, aligned
  to the Claude-primary model (`AGENTS.md`, `core/TOOL_ROUTING.md`).
- `AI_MISSION/START_HERE.md` — canonical, department-neutral entry template with a
  Claude-primary launch flow and `<DepartmentName>` / `<ProjectKind>` /
  `<MissionPack_v1>` placeholders.
- `AI_MISSION/PROJECT_CONTEXT.md`, `PROJECT_OBSERVATIONS.md`,
  `PROJECT_DECISIONS.md`, `PROJECT_ISSUES.md`, `PROJECT_ARTIFACTS.md`,
  `PROJECT_TIMELINE.md`, `PROJECT_AI_FEEDBACK.md`, `PROJECT_COMPLETION_PACKAGE.md`
  — blank record templates (project-data-free; byte-faithful to the deployed field
  forms, which were already model-neutral blanks).

## Sanitize-on-export (SESSION_PROTOCOL) — under Human review

The original intent was a simple manual transform: take canonical
`core/SESSION_PROTOCOL.md`, drop internal-only pointers (e.g. the
`core/PARKING_LOT.md` read-order entry), and ship the rest.

A read-only investigation of the deployed field packs found this is not viable as
a pure transform: the department `SESSION_PROTOCOL.md` is **not** a sanitized
subset of canonical. It carries department-authored content with no canonical
equivalent — a project-local `AI_STUDIO/`-precedence Source-of-Truth section, a
"Project Completion Return" section, department-specific Mission Pack Rules, and
extra bootstrap / validation entries — while omitting several canonical sections.
A sanitize-from-canonical would therefore be lossy in both directions.

This is an open fork escalated to the Human Director (see PL-0010 in
`core/PARKING_LOT.md`). Two options:

- A — author a parameterized department-facing SESSION_PROTOCOL template here
  (informed by canonical but owning the department sections); this creates the
  forked source the no-fork decision aimed to avoid.
- B — keep the no-fork decision and leave the department SESSION_PROTOCOL classed
  `department-authored / no canonical source yet` (not canonicalized).

No SESSION_PROTOCOL source is created here pending that decision. No generator is
implied either way.

## Human-gated follow-ups

- SESSION_PROTOCOL: resolve the sanitize-on-export fork above (Human decision A/B).
- Source Map: once a surface has a canonical template here, the export protocol's
  Source Map (`core/DEPARTMENT_PACK_EXPORT_PROTOCOL.md`) should reclassify it from
  `department-authored / no canonical source yet` to `canonical -> export`. Editing
  that Core protocol file is Human-gated (PL-0010 Finding 3), so it is deferred to
  a Human-approved step (bundled with the SESSION_PROTOCOL decision).

## Field-pack reconciliation (next Human-approved export only)

Deployed field packs (e.g. `D:\AI\研发部`, `D:\AI\换皮部`) still carry pre-alignment
content. Do NOT edit deployed packs directly. At each pack's next Human-approved
export, regenerate from these canonical templates:

1. `core/AI_ROLE_ROUTING.md` and `AGENTS.md` — realign from pre-2G
   (ChatGPT main brain / Codex orchestration / Cursor GPT-5.5 / Claude
   second-opinion) to Claude-primary / Codex-advisory / Cursor-when-assigned /
   ChatGPT-decision-support / Human-final.
2. `START_HERE.md` — Claude-primary launch flow ("Open Claude"), resolved
   placeholders, and the explicit `AI maintains:` record list.
3. `core/SESSION_PROTOCOL.md` — produced per the resolved sanitize-on-export
   decision; keep `core/PARKING_LOT.md` out of the field read order.
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
