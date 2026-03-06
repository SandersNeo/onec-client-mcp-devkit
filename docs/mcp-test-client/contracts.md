# Контракты и процессы

## MCP методы
- `initialize` / `initialized`.
- `tools/list`, `tools/call`.
- `resources/list`, `resources/read`.
- `prompts/list`, `prompts/get`.
- Уведомления `notifications/tools/listChanged`, `notifications/resources/listChanged`, `notifications/prompts/listChanged`.
- Уведомления о смене UI‑состояния (см. ниже).

## Ресурсы (URI)
- `ui://active/window` — активное окно.
- `ui://windows` — список окон.
- `ui://active/form` — активная форма.
- `ui://forms/{formId}` — конкретная форма.
- `ui://elements/{elementId}` — элемент управления.

## Формат ресурса
- `contents` массив.
- Каждый content: `uri`, `text` (JSON‑снимок), `mimeType=application/json`.

## Снимок UI (JSON)
- `type` — `window|form|group|button|field|table|decoration`.
- `name` — внутреннее имя элемента.
- `title` — заголовок.
- `visible|enabled|readOnly` — доступность.
- `children` — массив вложенных элементов (ограничение по `depth`).
- `path` — путь до элемента (опционально).

## Уведомления UI
- `notifications/ui/changed` — структура UI изменилась.
- Поля уведомления: `scope`, `reason`, `timestamp`, `formId` (опционально).

## Процессы

### 1. Запуск тест‑клиента
1. Вызов `tools/call` -> `test_client_start`.
2. Сервер запускает процесс 1С и подключается к тест‑клиенту.
3. Сервер обновляет состояние и отправляет ответ.

### 2. Чтение дерева элементов
1. Вызов `resources/read` -> `ui://active/form`.
2. Сервер строит снимок UI.
3. Сервер возвращает ресурс.

### 3. Пользовательское действие
1. Вызов `tools/call` -> `test_client_click`/`test_client_input`.
2. Сервер проверяет, требуется ли подтверждение.
3. Сервер выполняет действие и возвращает результат.

## Ошибки
- Ошибки MCP: `-32602` для неверных параметров, `-32603` для ошибки выполнения.
- Ошибки домена: `UI_NOT_FOUND`, `UI_NOT_READY`, `ACTION_DENIED`.

## Заглушки
- Точная схема `formId`/`elementId`.
- Правила построения `path`.
- Поведение при множественных совпадениях элементов.

## Ссылки
- MCP spec 2025-06-18 (messages, tools, resources, prompts, notifications).
