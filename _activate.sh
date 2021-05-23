export CONDA_ENV_ID=${1:-3.8}

source "${CONDA_PROFILE}"

conda activate "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}" || exit
