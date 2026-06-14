# TASK_TEMPLATE

## Purpose

Use this template when AI-STUDIO work needs a durable task record.

Keep tasks small, reviewable, and bounded.

## Task Metadata

```text
Task ID:
Title:
Status: TODO | IN_PROGRESS | REVIEW | DONE | BLOCKED
Created:
Owner:
Executor:
Reviewer:
Session State: GREEN | YELLOW | RED
Phase: PHASE_0_READ_ONLY | PLANNING | IMPLEMENTATION | REVIEW | HANDOFF
```

## Objective

State the intended outcome in one or two sentences.

```text
Objective:
```

## Scope

List what is included.

```text
In Scope:
- 
```

## Out of Scope

List what must not be done as part of this task.

```text
Out of Scope:
- 
```

## Allowed Files

List files or directories the Executor may read or modify.

```text
Allowed Files:
- 
```

## Forbidden Files

List files or directories the Executor must not touch.

```text
Forbidden Files:
- 
```

## Acceptance Criteria

Define observable completion checks.

```text
Acceptance Criteria:
- AC-01:
- AC-02:
```

## Validation Plan

Separate objective validation from subjective Human Review.

```text
Objective Validation:
- scripts/tests/checklists/logs/diffs to run or inspect:

Objective Evidence:
-

Subjective Human Review:
-

Final Authorization Needed:
- yes/no
```

AI, scripts, tests, diffs, logs, and checklists should cover objective validation whenever practical.

Human should not be asked to manually catch objective issues that can reasonably be verified by the agent.

## Risks

List known risks, uncertainty, or review concerns.

```text
Risks:
- 
```

## Rollback

Describe how to undo or contain the change if needed.

```text
Rollback:
```

## Handoff

At completion or pause, provide:

```text
SESSION_STATUS:
CONTINUE_ALLOWED:
STOP_REASON:
CURRENT_REPO_STATE:
CURRENT_TASK_STATE:
NEXT_OWNER:
NEXT_SESSION_NAME:
NEXT_SESSION_GOAL:
NEXT_SESSION_END_CONDITION:
NEXT_SESSION_FIRST_PROMPT:
Current objective:
Completed work:
Pending work:
Known risks:
Files changed or proposed:
Next recommended action:
```

## Guardrails

- Do not expand scope without Human Review.
- Do not implement Parking Lot items without explicit approval.
- Do not write project-specific content into Core.
- Do not commit or push without explicit approval.
- Executor and Reviewer should be separate for non-trivial work.
- New sessions start in Phase 0 Read-Only Review unless Human explicitly authorizes implementation.
- `RED` session state requires `STOP_AND_HANDOFF`.
- Checkpoint completion must not automatically continue into the next task.
- Do not transfer objective validation to Human as manual fallback.
