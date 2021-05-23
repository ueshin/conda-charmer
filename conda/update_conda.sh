#!/bin/bash

_ROOT="$(cd "$(dirname "$0")/.."; pwd)"

source "${_ROOT}"/_env.sh

source "${CONDA_PROFILE}"

conda update -n base -c defaults conda
