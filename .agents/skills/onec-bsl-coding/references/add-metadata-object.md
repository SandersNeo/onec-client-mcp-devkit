# Добавление объекта метаданных в расширение EDT

## Требования
При добавлении нового объекта метаданных (общий модуль, форма, справочник и т.д.) в расширение EDT необходимо:
1. Найти пример аналогичного объекта в том же расширении.
2. Создать `.mdo` файл объекта по образцу.
3. Сгенерировать уникальный UUID для нового объекта.
4. Зарегистрировать объект в `Configuration.mdo` расширения.

## Шаги

### 1. Найти пример
Найти `.mdo` аналогичного объекта в том же расширении:
```
exts/<имя>/src/CommonModules/<ИмяМодуля>/<ИмяМодуля>.mdo
```

### 2. Создать `.mdo` файл
Скопировать структуру из примера, заменив `name`, `synonym`, `uuid`.

Пример для общего модуля:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<mdclass:CommonModule xmlns:mdclass="http://g5.1c.ru/v8/dt/metadata/mdclass" uuid="<новый-uuid>">
  <name>ИмяМодуля</name>
  <synonym>
    <key>ru</key>
    <value>Синоним модуля</value>
  </synonym>
  <clientManagedApplication>true</clientManagedApplication>
</mdclass:CommonModule>
```

### 3. Сгенерировать UUID
```bash
python3 -c "import uuid; print(uuid.uuid4())"
```

### 4. Зарегистрировать в Configuration.mdo
Найти блок `<commonModules>` в `Configuration.mdo` расширения и добавить строку:
```xml
<commonModules>CommonModule.ИмяМодуля</commonModules>
```

Расположение файла:
```
exts/<имя>/src/Configuration/Configuration.mdo
tests/src/Configuration/Configuration.mdo
```

## Важно
- Без регистрации в `Configuration.mdo` объект не попадёт в ИБ при сборке.
- UUID должен быть уникальным — генерировать каждый раз заново.
- Имя объекта в `.mdo` и в `Configuration.mdo` должны совпадать точно.
