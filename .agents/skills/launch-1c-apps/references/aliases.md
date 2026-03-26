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
- `test-client`
  - `тест-клиент`
  - `тест клиент`
  - `test client`
  - `test-client`

## `utilityType` candidates

The exact alias accepted by `mcp__v8_runner__launch_app` may differ by environment.
Try the candidates in order and stop on the first successful launch.

- `thin-client`
  - `thinClient`
  - `thin-client`
  - `thin`
- `thick-client`
  - `thickClient`
  - `thick-client`
  - `thick`
- `designer`
  - `designer`
  - `configurator`
- `test-client`
  - `testClient`
  - `test-client`
  - `test`

## Notes

- Prefer `mcp__v8_runner__launch_app` over ad hoc shell commands.
- If all candidate aliases fail, return the exact error and do not claim a launch succeeded.
- For test-client scenarios specific to this repository, use `/workspace/docs/mcp-test-client/tasks/01-client-control.md` as the next source of truth.
