#!/usr/bin/env bash

# Use privileged mode, to e.g. ignore $CDPATH.
set -p

cd "$( dirname "${BASH_SOURCE[0]}" )" || exit 1

eval "vim -c 'Vader! *'"
