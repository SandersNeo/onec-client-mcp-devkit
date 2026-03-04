# YAxUnit Test Sources and Run Pointers

## Test locations
- Test modules: `./tests/src/CommonModules/`
- Test modules are named with prefix `ОМ_` (e.g., `ОМ_ЮТКоллекции`).

## Naming convention
- The test module name usually mirrors the tested module name with `ОМ_` prefix.
- Use this mapping to select tests when a production module changes.

## Run documentation
- YAxUnit run guide: `https://bia-technologies.github.io/yaxunit/docs/getting-started/run/configuration`
- Tests are commonly launched via 1C run parameter `RunUnitTests` with a config file.
- EDT plugin supports run from module and command palette.
- The YAxUnit extension requires safe mode and dangerous action protection to be disabled for test runs.
