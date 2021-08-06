#!/usr/bin/env bash

# shellcheck disable=SC1090
if ! source "$HOME/Bash-utils-include.sh"; then
    echo >&2; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to execute the modules initializer file." >&2; echo >&2; exit 1
fi

# /////////////////////////////////////////////// TESTING BASH-UTILS FUNCTIONS //////////////////////////////////////////////// #

