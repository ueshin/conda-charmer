#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_env.sh

if [ -z "${CONDA_ENV_PREFIX}" ]; then
    export CONDA_ENV_PREFIX="${_BASE_NAME}"
fi

export CONDA_ENV_ID=${1:-3.7}

source "${CONDA_HOME}/etc/profile.d/conda.sh"

conda remove --prefix "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}" --all
