#!/usr/bin/env bash

# shellcheck disable=SC1091
if ! source "$HOME/.bash_profile"; then
    echo >&2; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the ~/.bash_profile file." >&2; echo >&2; exit 1
fi

# shellcheck disable=SC1091
if ! source "$__BASH_UTILS_LIB_FILE_INITIALIZER"; then
    echo >&2; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the initialization file." >&2; echo >&2; exit 1
fi


# /////////////////////////////////////////////// TESTING BASH-UTILS FUNCTIONS //////////////////////////////////////////////// #

