#!/usr/bin/env bash

# This Bourne Again Shell script was made to help you removing every modules you don't want anymore.

# WARNING : it will not erase the scripts that has these modules as dependency, so expect bugs if you try to execute them.

__ARG_LIST="( "$@" )"

# Check if the module's name was passed as argument when this script was executed.

if (( ${#__ARG_LIST[@]} == 0 )); then
    echo "This script takes at least one mandatory argument : the new module's name"; exit 1
fi

# ----------

## FUNCTIONS

