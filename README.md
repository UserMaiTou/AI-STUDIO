# AI-STUDIO

AI-STUDIO is an AI-driven Product Development Operating System.

It supports project governance, agent collaboration, tool routing, Mission Pack management, project experience recovery, and continuous optimization.

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
core/
mission_packs/
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

## Mission Packs

Mission Packs are delivery packages for specific workflows.

The first included Mission Pack is:

- Reskin_v1

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
