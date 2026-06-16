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
  protocol remains `core/SESSION_PROTOCOL.md`. The exported department variant is
  produced by an explicit documented manual sanitize/export transform (see
  "Sanitize-on-export" below). AI-STUDIO does not maintain a second, forked
  SESSION_PROTOCOL source.

## Current contents

- `AI_MISSION/core/AI_ROLE_ROUTING.md` — canonical role-routing template, aligned
  to the Claude-primary model (`AGENTS.md`, `core/TOOL_ROUTING.md`).

## Sanitize-on-export (SESSION_PROTOCOL)

When a Department Pack is exported, the department-facing
`AI_MISSION/core/SESSION_PROTOCOL.md` is produced from canonical
`core/SESSION_PROTOCOL.md` by a documented manual transform:

- remove internal-only / roadmap pointers not meant for field teams (for example
  the `core/PARKING_LOT.md` entry in the New Session Bootstrap read order)
- keep the session lifecycle, Phase 0, read order (minus internal-only entries),
  checkpoint flow, and `STOP_AND_HANDOFF` rules

This transform is manual and documented. It is not a generator and does not
maintain a forked source.

## Documented follow-ups (not yet created)

- `AI_MISSION/START_HERE.md` canonical template (department-neutral, Claude-primary
  launch flow).
- `AI_MISSION/PROJECT_*` blank record templates (`PROJECT_CONTEXT`,
  `PROJECT_OBSERVATIONS`, `PROJECT_DECISIONS`, `PROJECT_ISSUES`,
  `PROJECT_ARTIFACTS`, `PROJECT_TIMELINE`, `PROJECT_AI_FEEDBACK`,
  `PROJECT_COMPLETION_PACKAGE`).
- Full written spec of the SESSION_PROTOCOL sanitize-on-export transform.
- Reconciliation: existing field packs still carry pre-alignment role content and
  should be reconciled to these canonical templates at their next Human-approved
  export. Do not edit deployed field packs directly.

## Authority

Human Final Decision is the highest authority. Changes here flow
`canonical -> export`; returned field changes are feedback inputs reviewed by the
Human Director before adoption. No generator, manifest, or export automation is
implied by this directory.
