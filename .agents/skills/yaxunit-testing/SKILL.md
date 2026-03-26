---
name: yaxunit-testing
description: Run, scope, and interpret YAxUnit tests for 1C projects. Use when selecting or executing tests located in `./tests/src/CommonModules/`, especially modules prefixed with `ОМ_`, or when verifying changes against YAxUnit test suites.
---

# YAxUnit Testing

## Overview
Use this skill to locate relevant YAxUnit test modules, understand test coverage, and run or scope tests using the `v8_runner` tools first.

## Workflow
1. Identify relevant test modules.
- Test modules live in `./tests/src/CommonModules/`.
- Test module names start with `ОМ_` and usually mirror the tested module name, e.g. `ОМ_ЮТКоллекции` for `ЮТКоллекции`.
- Use `rg --files -g 'Module.bsl' ./tests/src/CommonModules` and filter by `ОМ_`.

2. Inspect the module’s `ИсполняемыеСценарии()`.
- This procedure enumerates tests via `ЮТТесты.ДобавитьТест("ИмяМетода")`.
- The listed methods are the test entry points to focus on.

3. Run tests.
- Primary path: use `mcp__v8_runner__run_module_tests` for a specific module or `mcp__v8_runner__run_all_tests` for the full suite.
- If the infobase may be stale after source changes, use `mcp__v8_runner__build_project` before rerunning tests.
- Use manual CLI launch with `/C RunUnitTests=<path to config>` only if the `v8_runner` tools are unavailable.
- Ensure the YAxUnit extension has **safe mode** and **dangerous action protection** disabled as required by YAxUnit docs.

4. Report results.
- If tests are not run, state why and list the relevant modules and methods identified.
- If `v8_runner` fails before producing a JUnit report, inspect the log paths returned by the tool and report the infrastructure cause separately from test failures.

## Resources
- `references/yaxunit-tests.md` for paths, naming conventions, and run documentation pointers.
