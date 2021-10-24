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
    export SPARK_HOME="${_ROOT}"/"${SOURCE_PATH}"
else
    export SPARK_HOME="$(cd "${_WORKTREE}" && pwd)"
fi

if [ -z "${_PROFILE}" ]; then
    export CONDA_ENV_PROFILE="${CONDA_ENV_ETC}/profile"
else
    export CONDA_ENV_PROFILE="${CONDA_ENV_ETC}/profile-${_PROFILE}"
fi

if [ -n "${SPARK_HOME}" ]; then
    find "${SPARK_HOME}" -name '*.pyc' | xargs rm

    export SPARK_PREPEND_CLASSES=true
    export PYTHONPATH="$(find "${SPARK_HOME}/python/lib" -name 'py4j-*-src.zip' -type f | uniq)":"${SPARK_HOME}/python"

    cd "${SPARK_HOME}" && ${SHELL}
fi
