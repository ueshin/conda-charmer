#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

source "${CONDA_HOME}/etc/profile.d/conda.sh"

conda update -n base -c defaults conda
