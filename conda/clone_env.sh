#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

conda create --name "${CONDA_ENV_PREFIX}_$2" --clone "${CONDA_ENV_PREFIX}_$1"
