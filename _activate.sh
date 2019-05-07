#!/bin/bash

export CONDA_ENV_ID=${1:-3.6}

source "${CONDA_HOME}/etc/profile.d/conda.sh"

conda activate "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}"
