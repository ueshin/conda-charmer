#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

ls -l "${CONDA_ENV_ETC}"/profile* 2>/dev/null | sed 's/[^/]*//'
