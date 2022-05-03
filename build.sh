#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_opts.sh

source "${_ROOT}"/_env.sh

if [ -z "${_WORKTREE}" ]; then
    export SPARK_HOME="${_ROOT}"/"${SOURCE_PATH}"
else
    export SPARK_HOME="$(cd "${_WORKTREE}"; pwd)"
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

cd "${SPARK_HOME}" && \
  ./build/sbt clean test:package -Phive-thriftserver && \
  rm python/lib/pyspark.zip

jps -v | grep Nailgun | cut -f 1 -d ' ' | xargs kill
