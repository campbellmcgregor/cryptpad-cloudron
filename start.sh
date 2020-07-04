#! /bin/bash

set -eu

exec /usr/local/bin/gosu cloudron:cloudron /app/code/server node