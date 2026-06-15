# Handoff Tool MVP

Minimal PowerShell helper for AI-STUDIO handoff preparation.

This is an optional helper, not a required workflow.

It does not replace Human judgment, Human Review, or Human Final Decision.

## Commands

Create a handoff skeleton from the current working directory:

```powershell
.\tools\handoff\handoff.ps1 new
```

If local PowerShell policy blocks `.ps1` execution, use a process-scoped bypass:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\handoff\handoff.ps1 new
```

Check a saved handoff file:

```powershell
.\tools\handoff\handoff.ps1 check -Path .\handoff.md
```

`new` prints the Standard Handoff Package fields, a repository snapshot, `GIT_ERROR_SUMMARY`, and a `COMPACT_BOOTSTRAP:` placeholder. If Git is unavailable, not in a repository, or fails with `dubious ownership` / `safe.directory`, Git-derived fields are `UNAVAILABLE` and the command still exits successfully.

`check` verifies the 10 required handoff fields are present and non-empty, and that Compact Bootstrap is 500 characters or fewer. Missing fields or an oversized Compact Bootstrap produce a non-zero exit and list the failed checks.

## Non-Goals

- No LLM calls.
- No automatic summary generation.
- No automatic commit or push.
- No history/state files.
- No config system, TUI, CI hooks, Runtime Probe, or benchmark workflow.
