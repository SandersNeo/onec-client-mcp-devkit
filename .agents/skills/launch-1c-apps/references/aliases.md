# 1C App Launch Aliases

## User-facing aliases

Map common user phrasing to one normalized app kind before calling tools.

- `thin-client`
  - `тонкий клиент`
  - `тонкий`
  - `thin client`
  - `thin`
  - `tc`
- `thick-client`
  - `толстый клиент`
  - `толстый`
  - `thick client`
  - `thick`
- `designer`
  - `конфигуратор`
  - `designer`
  - `configurator`

## Supported `utilityType` aliases

These aliases are explicitly supported by `mcp__v8_runner__launch_app`.

- `thin-client`
  - `thin-client`
  - `тонкий клиент`
  - `тонкий`
  - `thin client`
  - `thin`
  - `tc`
- `thick-client`
  - `thick-client`
  - `толстый клиент`
  - `толстый`
  - `thick client`
  - `thick`
- `designer`
  - `designer`
  - `конфигуратор`
  - `configurator`

## Notes

- Prefer `mcp__v8_runner__launch_app` over ad hoc shell commands.
- If all supported aliases fail, return the exact error and do not claim a launch succeeded.
