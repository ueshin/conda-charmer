#!/bin/bash

export CONDA_ENV_ID=${1:-3.6}
source activate "${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}"
