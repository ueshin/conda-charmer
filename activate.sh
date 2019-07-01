#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_opts.sh

source "${_ROOT}"/_env.sh

if [ -z "${CONDA_ENV_PREFIX}" ]; then
    export CONDA_ENV_PREFIX="${_BASE_NAME}"
fi

source "${_ROOT}"/_activate.sh

if [ "${CONDA_ENV_PREFIX}" = "${_BASE_NAME}" ]; then
    export PS1="[${_BASE_NAME}:${CONDA_ENV_ID}] \\h:\\W \\u\\\$ "
else
    export PS1="[${_BASE_NAME}:${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}] \\h:\\W \\u\\\$ "
fi

if [ -z "${_WORKTREE}" ]; then
    export SPARK_HOME="${_ROOT}"/"${SOURCE_PATH}"
else
    export SPARK_HOME="$(cd "${_WORKTREE}"; pwd)"
fi

find "${SPARK_HOME}" -name '*.pyc' | xargs rm

export SPARK_PREPEND_CLASSES=true
export PYTHONPATH="$(find "${SPARK_HOME}/python/lib" -name 'py4j-*-src.zip' -type f | uniq)":"${SPARK_HOME}/python"

cd "${SPARK_HOME}" && bash --init-file "${CONDA_HOME}/etc/profile.d/conda.sh"
