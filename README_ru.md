# CSP Store

CSP Store это сервис написанний поверх [TarantoolDB](https://tarantool.io/) который принимает запросы от [CSP Aggregator](https://github.com/mikhailbadin/csp-aggregator).

# Начало

Для запуска сервиса необходимо иметь:

- [Docker](https://www.docker.com/) в случае если сборка будет осуществлять через Dockerfile.
- [TarantoolDB](https://tarantool.io/) в случае если сборка будет осуществляться напрямую в Tarantool.

## Модель данных

Пространство `script_src`:

```lua
{name = "id", type = "unsigned"},
{name = "report_time", type = "unsigned"},
{name = "report_only", type = "boolean"},
{name = "blocked_uri", type = "string"},
{name = "document_uri", type = "string"},
{name = "source_file", type = "string"},
{name = "line_number", type = "number"},
{name = "column_number", type = "number"},
{name = "referer", type = "string"}
```

Индекс: по полю `id`

# Установка

## C использованием Docker

### Требования

- [Docker](https://www.docker.com/)

### Сборка

Для сборки перейдите в корень проекта из выполните сборку из Dockerfile.

Пример:

```shell
docker build -t csp-store:latest .
```

## C использованием Tarantool

### Требования

- [TarantoolDB](https://tarantool.io/)

### Запуск

Для установки просто передайте аболютный путь до файла `./src/init.lua` в качестве параметра запуска Tarantool.

Пример:

```shell
tarantool /roo/csp-store/src/init.lua
```

# Конфигурация

Приложение при запуске берет параметры из переменных окружения. Поддерживаются следующие параметры:

- `TARANTOOL_PORT` - для указания порта, на котором TarantoolDB будет работать.
- `TARANTOOL_USER` - имя пользователя
- `TARANTOOL_PASS` - пароль

Пример конфигурации:

```shell
TARANTOOL_PORT=3301
TARANTOOL_USER="guest"
TARANTOOL_PASS=""
```
