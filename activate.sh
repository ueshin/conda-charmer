#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"
_BASE_NAME=$(basename "${_ROOT}")

while getopts w: OPT
do
    case $OPT in
        w)  _WORKTREE=$OPTARG
            ;;
    esac
done

shift $(($OPTIND - 1))

source "${_ROOT}"/_env.sh

if [ -z "${CONDA_ENV_PREFIX}" ]; then
    export CONDA_ENV_PREFIX="${_BASE_NAME}"
fi

source "${_ROOT}"/_activate.sh

if [ "${CONDA_ENV_PREFIX}" = "${_BASE_NAME}" ]; then
    export PS1="[${_BASE_NAME}:${CONDA_ENV_ID}] \\h:\\W \\u\\\$ "
else
    export PS1="[${_BASE_NAME}:${CONDA_ENV_PREFIX}_${CONDA_ENV_ID}] \\h:\\W \\u\\\$ "
fi

if [ -z "${_WORKTREE}" ]; then
    export PYTHONPATH="${_ROOT}"/"${SOURCE_PATH}"
else
    export PYTHONPATH="$(cd "${_WORKTREE}"; pwd)"
fi

cd "$PYTHONPATH" && bash
