#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

export CONDA_ENV_ID=${1:-3.6}
conda remove --name "${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}" --all
