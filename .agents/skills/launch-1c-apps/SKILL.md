---
name: launch-1c-apps
description: Launch 1C applications in the local development environment. Use when the user asks to open a thin client, thick client, or configurator/designer, or when colloquial names must be mapped to `mcp__v8_runner__launch_app` utility aliases.
---

# Launch 1C Apps

## Overview

Use this skill to start the requested 1C application with a consistent workflow and alias mapping.
Prefer `mcp__v8_runner__launch_app`; use the supported alias list from `references/aliases.md`.

## Quick Start

1. Determine the requested app kind: thin client, thick client, or configurator/designer.
2. Read `references/aliases.md` and map the user phrasing to the normalized app kind.
3. Launch with `mcp__v8_runner__launch_app` using one of the supported aliases from the list.
4. On first success, report which alias worked and reuse it later in the same task.
5. If all aliases fail, report the exact failure.

## Workflow

- Normalize user wording first. Examples:
  - "запусти тонкий клиент" -> thin client
  - "открой конфигуратор" -> configurator/designer
- Use the alias table from `references/aliases.md`.
- Use only the supported aliases from the list; do not invent extra variants.
- If the user asks for a test client, do not route it through this alias list. Use project-specific docs such as `/workspace/docs/mcp-test-client/tasks/01-client-control.md`.

## Reporting

- State which application was requested.
- State which alias was used successfully, or list the aliases that were tried and failed.
- If launch fails, include the exact tool error message.

## References

- Alias map and launch order: `references/aliases.md`
