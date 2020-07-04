#! /bin/bash

set -eu

exec /usr/local/bin/gosu cloudron:cloudron /app/code/node server