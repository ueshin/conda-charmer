#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

source "${_ROOT}"/_env.sh
source "${_ROOT}"/_activate.sh

export PS1="[${_BASE_NAME}:${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}] \\h:\\W \\u\\\$ "

cd "${_ROOT}"/python

bash
