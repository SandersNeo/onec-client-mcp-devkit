---
name: remarks-handling
description: Use when handling EDT remarks/issues for ClientMcp; outlines how to obtain remarks and when @skip-check is acceptable.
---

# Remarks Handling

Rules:
- Obtain remarks using `edt get_project_errors` with `projectName = ClientMcp`.
- Use `@skip-check` annotations only in exceptional cases.
