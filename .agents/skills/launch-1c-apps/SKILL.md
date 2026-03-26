---
name: launch-1c-apps
description: Launch 1C applications in the local development environment. Use when the user asks to open a thin client, thick client, configurator/designer, or test client, or when colloquial names must be mapped to `mcp__v8_runner__launch_app` utility aliases.
---

# Launch 1C Apps

## Overview

Use this skill to start the requested 1C application with a consistent workflow and alias mapping.
Prefer `mcp__v8_runner__launch_app`; if the exact `utilityType` alias is not yet confirmed, use the alias list in `references/aliases.md` and stop on the first successful launch.

## Quick Start

1. Determine the requested app kind: thin client, thick client, configurator/designer, or test client.
2. Read `references/aliases.md` and map the user phrasing to the normalized app kind.
3. Launch with `mcp__v8_runner__launch_app` using the candidate aliases in the listed order.
4. On first success, report which alias worked and reuse it later in the same task.
5. If all aliases fail, report the exact failure and fall back to project-specific docs only when needed.

## Workflow

- Normalize user wording first. Examples:
  - "запусти тонкий клиент" -> thin client
  - "открой конфигуратор" -> configurator/designer
  - "нужен тест-клиент" -> test client
- Use the alias table from `references/aliases.md`.
- Try aliases one by one with `mcp__v8_runner__launch_app`.
- Do not assume the alias from memory when it has not been confirmed in the current environment.
- If the request is specifically about test-client behavior, also consult `/workspace/docs/mcp-test-client/tasks/01-client-control.md`.

## Reporting

- State which application was requested.
- State which alias was used successfully, or list the aliases that were tried and failed.
- If launch fails, include the exact tool error message.

## References

- Alias map and launch order: `references/aliases.md`
