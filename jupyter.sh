#!/bin/bash

_ROOT="$(cd "$(dirname "$0")"; pwd)"

source "${_ROOT}"/_env.sh
source "${_ROOT}"/_activate.sh

export PYTHONPATH="${_ROOT}"/python

jupyter notebook "${_ROOT}"/notebooks
