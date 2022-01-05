#!/usr/bin/env bash

# shellcheck disable=SC1090
if ! source "$HOME/Bash-utils-init.sh" \
	"module --lang=en" \
	"main --stat='debug=true error=fatal log=true log-redirect=tee stat-time-txt=1 stat-txt-fmt=true'"; then
    echo >&2; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to execute the modules initializer file." >&2; echo >&2; exit 1
fi

# /////////////////////////////////////////////// TESTING BASH-UTILS FUNCTIONS //////////////////////////////////////////////// #
