#!/bin/bash

set -eu

exec /usr/local/bin/gosu cloudron:cloudron node /app/code/server.js