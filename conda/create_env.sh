#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

PYTHON_VERSION=${1:-3.6}

conda create -y -c conda-forge --name "${CONDA_ENV_PREFIX}_${PYTHON_VERSION}" python=${PYTHON_VERSION} \
  jupyter \
  version_information \
  "${ADDITIONAL_PACKAGES[@]}"
