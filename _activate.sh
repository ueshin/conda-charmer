export CONDA_ENV_ID=${1:-${CONDA_ENV_DEFAULT_ID:-3.12}}

source "${CONDA_PROFILE}"

conda activate "${CONDA_ENVS}/${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}" || exit

shift
