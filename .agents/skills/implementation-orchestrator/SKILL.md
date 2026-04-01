---
name: implementation-orchestrator
description: Orchestrate repository task implementation through subagents from a user-provided or approved plan. Use when Codex must keep the main session as coordinator, turn the plan into a tracked TODO checklist, delegate analysis, planning, coding, testing, and review to explorer, worker, and reviewer subagents, run iterative review-fix loops, and drive the task to completion with scoped diffs, stage outputs, and controlled commits.
---

# Implementation Orchestrator

## Overview

Use this skill to run implementation as an orchestration workflow.
Keep the main session focused on scope, context curation, progress tracking, and stage outputs.
Delegate every substantive task action to subagents.

## Preconditions

- Read `AGENTS.md` before planning or implementation.
- Start from a user-provided plan or from a planning artifact that is ready to be converted into implementation work.
- Inspect the current git branch and worktree before any branch or commit action.
- Record whether unrelated changes already exist in the worktree.
- Load other local skills when needed:
  - `plan-review` for plan approval loops.
  - `onec-bsl-coding` for BSL changes.
  - `v8-runner` and `yaxunit-testing` for checks.
  - `remarks-handling` for EDT remarks.

## Workflow

1. Requirements analysis
   - Launch an `explorer` subagent.
   - Ask for concise requirements, assumptions, risks, non-goals, scope boundaries, and a branch recommendation.
   - Launch a `reviewer` subagent on the analysis result before moving forward.
   - If the reviewer finds issues, send them back for correction and rerun the review.
   - Reject refactors, formatting, cleanup, or unrelated checks at this stage.

2. Branch decision
   - Create a task branch for the implementation before any substantive work starts.
   - Use `feat/<issue-i>-<short-description>` when repository naming rules require that format.
   - Delegate branch creation to a subagent and then launch a `reviewer` subagent to verify the active branch and branch naming.
   - If the worktree already contains unrelated changes, stop and surface the blocker before carrying unrelated work into the task branch.

3. Build the implementation TODO plan
   - Launch a `worker` subagent to turn the input plan into an executable checklist.
   - Track progress with `[ ]`, `[-]`, and `[x]`.
   - Require every checklist item to include scope, expected artifacts, and verification.
   - Keep the list flat and ordered for sequential execution.

   Example:

   ```text
   [ ] Step 1: ...
       Verify: ...
   [-] Step 2: ...
       Verify: ...
   [x] Step 3: ...
       Verify: ...
   ```

4. Review and harden the plan
   - Prefer the `plan-review` skill when it is available.
   - Otherwise run iterative `reviewer -> worker` loops.
   - Require the reviewer to return either the exact line `APPROVED` or concrete findings grouped as:
     - `Scope issues`
     - `Correctness risks`
     - `Missing verification`
   - Keep a findings ledger and do not start implementation before the plan is approved unless the user explicitly waives approval.

5. Execute each TODO item
   - Work on one open item at a time and mark it `[-]` while active.
   - Launch a `worker` subagent to implement only the current item.
   - Launch a separate `reviewer` subagent to check the current item against the approved plan, repository rules, and current diff.
   - If the reviewer finds issues, send the findings back to the `worker` and repeat until the findings are resolved or explicitly blocked.
   - Delegate tests, builds, or syntax checks for the current item to subagents and capture the exact commands and results.
   - Mark the item `[x]` only after review passes and required checks succeed.

6. Commit a completed implementation item
   - In the target user task, delegate staging and commit creation to a subagent after each completed TODO item.
   - Use Conventional Commits.
   - Before every commit, verify the staged set with `git diff --cached --name-only` and confirm that it contains only the intended files for the current item.
   - Launch a `reviewer` subagent on the staged diff before creating the commit.
   - If repository rules conflict with the required per-item commit flow, stop and surface the conflict instead of silently choosing one policy.

7. Run the final task review loop
   - After all TODO items are complete, launch a fresh `reviewer` on the full task result.
   - If findings remain, launch a `worker` for fixes, rerun the required checks, and review again.
   - Stop only when the reviewer reports no findings or when an explicit blocker remains.

8. Publish the stage outputs
   - Return the required outputs in this order:
     - `Analysis`: requirements, assumptions, risks.
     - `Planning`: approved TODO plan and verification plan.
     - `Implementation`: completed items and file references.
     - `Testing`: commands, results, or the reason a check was not run.
     - `Review`: reviewer findings or explicit `no findings`.
   - Include the branch decision, commit list, and unresolved blockers.

## Rules

- Keep the main session in the coordinator role: select subagents, pass curated context, update checklist status, track findings, and report outcomes.
- Delegate all substantive work to `explorer`, `worker`, and `reviewer`: analysis, plan drafting, code changes, tests, review, branch actions, staging, and commit preparation.
- Keep diffs minimal. Do not allow refactors, formatting runs, lint cleanup, or unrelated checks.
- Stop and correct scope whenever any agent proposes out-of-scope work.
- Preserve reviewer independence. Do not send intended fixes to the reviewer before a review pass.
- Keep one active TODO item at a time unless the user explicitly asks for parallel work and the write scopes do not overlap.
- When the task touches BSL modules, follow `docs/code-style.md` and use `onec-bsl-coding`.
- When the task requires runner or test tooling, use `v8-runner` and `yaxunit-testing` as appropriate.

## Recovery

- If reviewer output is malformed, rerun the reviewer once with a strict format reminder.
- If worker output is malformed, rerun the worker once with the missing sections called out.
- If two review passes make mutually exclusive demands, stop and escalate the contradiction.
- If the worktree is dirty and safe branch or commit isolation cannot be guaranteed, stop before committing and report the blocker.
- If plan approval or final review cannot be achieved within the loop limit, present the latest reviewer-validated artifact and list the unresolved findings.

## Deliverable

Return:

- branch decision and branch name;
- approved TODO checklist with statuses;
- per-item implementation, test, and review evidence;
- commit list or commit blocker;
- final review result: `no findings` or unresolved blockers.
