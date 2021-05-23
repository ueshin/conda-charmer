#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_opts.sh

source "${_ROOT}"/_env.sh

source "${_ROOT}"/_activate.sh

if [ -z "${_WORKTREE}" ]; then
    export PYTHONPATH="${_ROOT}"/"${SOURCE_PATH}"
else
    export PYTHONPATH="$(cd "${_WORKTREE}"; pwd)"
fi

jupyter notebook "${_ROOT}"/notebooks
