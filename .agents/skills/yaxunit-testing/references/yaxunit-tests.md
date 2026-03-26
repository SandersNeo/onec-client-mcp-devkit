# YAxUnit Test Sources and Run Pointers

## Test locations
- Test modules: `./tests/src/CommonModules/`
- Test modules are named with prefix `ОМ_` (e.g., `ОМ_ЮТКоллекции`).

## Naming convention
- The test module name usually mirrors the tested module name with `ОМ_` prefix.
- Use this mapping to select tests when a production module changes.

## Run documentation
- Primary path in this workspace: run tests via `mcp__v8_runner__run_module_tests` or `mcp__v8_runner__run_all_tests`.
- Use `mcp__v8_runner__build_project` before rerunning tests if source changes have not been built yet.
- YAxUnit run guide: `https://bia-technologies.github.io/yaxunit/docs/getting-started/run/configuration`
- Manual fallback: launch 1C with `RunUnitTests` and a config file only when `v8_runner` tools are unavailable.
- EDT plugin supports run from module and command palette.
- The YAxUnit extension requires safe mode and dangerous action protection to be disabled for test runs.
