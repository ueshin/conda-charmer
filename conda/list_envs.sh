#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

source "${CONDA_HOME}/etc/profile.d/conda.sh"

conda info --envs | grep "${CONDA_ENVS}" | rev | cut -f 1 -d ' ' | rev
