## EDT Build & Checks
- After changes, run build using `update_database` (EDT tools).
- Check extension issues with `get_project_errors` using `projectName = ClientMcp`.
- To obtain current remarks/issues, use EDT tools (primarily `get_project_errors` for `ClientMcp`).

## Remarks Handling Rule
- Use `edt get_project_errors` with `projectName = ClientMcp` to obtain remarks.
- Use `@skip-check` annotations only in exceptional cases.

