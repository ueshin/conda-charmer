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

cd "${SPARK_HOME}" && \
  ./build/sbt clean test:package -Phadoop-3.2 -Phive-2.3 -Phive-thriftserver && \
  rm python/lib/pyspark.zip

jps -v | grep Nailgun | cut -f 1 -d ' ' | xargs kill
