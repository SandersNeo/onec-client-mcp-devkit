# Check Code Style

Workflow for automated BSL code style review and remediation.

## Inputs

- Current branch and uncommitted changes in `exts/client-mcp/src/**/*.bsl`

## Standards

Load the following references before analysis:

1. `.agents/skills/onec-bsl-coding/SKILL.md` — skill overview and review checklist.
2. `docs/code-style.md` — project code style conventions.
3. `.agents/skills/onec-bsl-coding/references/codex-rules-1c.md` — design principles (SRP, OCP, DRY, YAGNI).
4. `.agents/skills/onec-bsl-coding/references/steel-morgan-coding-standards.md` — detailed BSL coding standards.

## Steps

### 1. Analyse changed files

- Determine the current git branch.
- Collect the list of changed `.bsl` files (staged, unstaged, and untracked) relative to `main` or the merge base.
- For each changed file, read its full content and evaluate it against the standards listed above.
- Record every finding as `file:line — description (rule reference)`.
- If there are **no findings**, report "No code-style issues found" and **stop**.

### 2. Create a fix branch

- If the current branch is `main` or `develop`, create and checkout a new branch:
  `style/code-style-fixes-<YYYY-MM-DD>`
- If already on a feature branch, stay on it.

### 3. Build a remediation plan

- Group findings by file.
- For each file list the concrete changes to make (minimal diffs only).
- Present the plan to the user for confirmation before proceeding.

### 4. Apply fixes

- Apply the planned changes file by file.
- Keep diffs minimal: fix only the reported issues, do not reformat or refactor unrelated code.

### 5. Commit

- Stage all modified files.
- Commit with message: `style: fix BSL code-style issues`.

### 6. Re-analyse

- Re-read every file that was modified in step 4.
- Evaluate against the same standards.
- Record any remaining findings.

### 7. Iterate if needed

- If new findings exist, return to **step 4** with the updated finding list.
- Maximum **3 iterations** to avoid infinite loops.
- After the final iteration, report any remaining findings that could not be auto-fixed.
