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

if [ -z "${_PROFILE}" ]; then
    export CONDA_ENV_PROFILE="${CONDA_ENV_ETC}/profile"
else
    if [ -f "${CONDA_ENV_ETC}/profile-${_PROFILE}" ]; then
        export CONDA_ENV_PROFILE="${CONDA_ENV_ETC}/profile-${_PROFILE}"
    else
        echo "The profile not found: ${CONDA_ENV_ETC}/profile-${_PROFILE}"
        exit 1
    fi
fi

if [ -f "${CONDA_ENV_PROFILE}" ]; then
    source "${CONDA_ENV_PROFILE}"
fi

jupyter notebook "${NOTEBOOK_PATH}"
