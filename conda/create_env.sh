#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_env.sh

PYTHON_VERSION="${1:-3.10}"
CONDA_ENV_ID="${2:-${PYTHON_VERSION}}"

source "${CONDA_PROFILE}"

conda create -y --prefix "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}" python=${PYTHON_VERSION} && \
conda activate "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}" && \
conda config --add pinned_packages python="${PYTHON_VERSION}" --env && \
conda install -y -c conda-forge \
  jupyter \
  "${ADDITIONAL_PACKAGES[@]}" && \
if [ -n "${REQUIREMENTS_FILE}" ]; then
  conda install -y -c conda-forge --file "${_ROOT}/${SOURCE_PATH}/${REQUIREMENTS_FILE}"
fi
