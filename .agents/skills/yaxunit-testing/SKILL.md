---
name: yaxunit-testing
description: Run, scope, and interpret YAxUnit tests for 1C projects. Use when selecting or executing tests located in `./tests/src/CommonModules/`, especially modules prefixed with `ОМ_`, or when verifying changes against YAxUnit test suites.
---

# YAxUnit Testing

## Overview
Use this skill to locate relevant YAxUnit test modules, understand test coverage, and run or scope tests using YAxUnit tooling.

## Workflow
1. Identify relevant test modules.
- Test modules live in `./tests/src/CommonModules/`.
- Test module names start with `ОМ_` and usually mirror the tested module name, e.g. `ОМ_ЮТКоллекции` for `ЮТКоллекции`.
- Use `rg --files -g 'Module.bsl' ./tests/src/CommonModules` and filter by `ОМ_`.

2. Inspect the module’s `ИсполняемыеСценарии()`.
- This procedure enumerates tests via `ЮТТесты.ДобавитьТест("ИмяМетода")`.
- The listed methods are the test entry points to focus on.

3. Run tests (choose an available path).
- CLI launch: run 1C with `/C RunUnitTests=<path to config>` (see the run guide in references).
- Ensure the YAxUnit extension has **safe mode** and **dangerous action protection** disabled as required by YAxUnit docs.

4. Report results.
- If tests are not run, state why and list the relevant modules and methods identified.

## Resources
- `references/yaxunit-tests.md` for paths, naming conventions, and run documentation pointers.
