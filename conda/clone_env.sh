#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_env.sh

if [ -z "${CONDA_ENV_PREFIX}" ]; then
    export CONDA_ENV_PREFIX="${_BASE_NAME}"
fi

conda create --name "${CONDA_ENV_PREFIX}_$2" --clone "${CONDA_ENV_PREFIX}_$1"