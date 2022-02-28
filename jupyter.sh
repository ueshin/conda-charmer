#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_opts.sh

source "${_ROOT}"/_env.sh

source "${_ROOT}"/_activate.sh

if [ -z "${_WORKTREE}" ]; then
    export SPARK_HOME="${_ROOT}"/"${SOURCE_PATH}"
else
    export SPARK_HOME="$(cd "${_WORKTREE}"; pwd)"
fi

find "${SPARK_HOME}" -name '*.pyc' | xargs rm

export SPARK_PREPEND_CLASSES=true
export PYTHONPATH="$(find "${SPARK_HOME}/python/lib" -name 'py4j-*-src.zip' -type f | uniq)":"${SPARK_HOME}/python"

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

jupyter notebook "${_ROOT}"/notebooks
