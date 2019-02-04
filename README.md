# CSP Store

CSP Store is a service written on top of [TarantoolDB](https://tarantool.io/) which accepts requests from [CSP Aggregator](https://github.com/mikhailbadin/csp-aggregator).

# Introduction

To start the service, you must have:

- [Docker](https://www.docker.com/) if the sevice will build from Dockerfile.
- [TarantoolDB](https://tarantool.io/) if the service will run directly via Tarantool.

## Data Model

Space `script_src`:

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

# Installation

## Using Docker

### Dependencies

- [Docker](https://www.docker.com/)

### How to build

To build go to the root of the project from the build from the Dockerfile.

Example:

```shell
docker build -t csp-store:latest .
```

## Using Tarantool

### Dependencies

- [TarantoolDB](https://tarantool.io/)

### How to run

To install, simply pass the absolute path to the `./src/init.lua` file as the launch parameter for Tarantool.

Example:

```shell
tarantool /roo/csp-store/src/init.lua
```

# Configuration

The application takes parameters from environment variables at startup. The following parameters are supported:

- `TARANTOOL_PORT` - to specify the port on which the TarantoolDB will work.
- `TARANTOOL_USER` - username
- `TARANTOOL_PASS` - password

Configuration example:

```shell
TARANTOOL_PORT=3301
TARANTOOL_USER="guest"
TARANTOOL_PASS=""
```
