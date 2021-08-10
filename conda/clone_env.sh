#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_env.sh

source "${CONDA_PROFILE}"

conda create --prefix "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_$2" --clone "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_$1"
