#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_opts.sh

source "${_ROOT}"/_env.sh

source "${_ROOT}"/_activate.sh

if [ "${CONDA_ENV_PREFIX}" = "${_BASE_NAME}" ]; then
    export CONDA_ENV_PROMPT="${_BASE_NAME}:${CONDA_ENV_ID}"
else
    export CONDA_ENV_PROMPT="${_BASE_NAME}:${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}"
fi

if [ -z "${_WORKTREE}" ]; then
    export PYTHONPATH="${_ROOT}"/"${SOURCE_PATH}"
else
    export PYTHONPATH="$(cd "${_WORKTREE}" && pwd)"
fi

if [ -n "${PYTHONPATH}" ]; then
    cd "${PYTHONPATH}" && ${SHELL}
fi
