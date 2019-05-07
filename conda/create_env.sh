#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_env.sh

if [ -z "${CONDA_ENV_PREFIX}" ]; then
    export CONDA_ENV_PREFIX="${_BASE_NAME}"
fi

PYTHON_VERSION=${1:-3.6}

source "${CONDA_HOME}/etc/profile.d/conda.sh"

conda create -y --prefix "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${PYTHON_VERSION}" python=${PYTHON_VERSION} && \
conda activate "${CONDA_ENV_PREFIX}_${PYTHON_VERSION}" && \
conda install -y -c conda-forge \
  jupyter \
  "${ADDITIONAL_PACKAGES[@]}"
