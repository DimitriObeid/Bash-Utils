#!/usr/bin/env bash

# shellcheck disable=SC1090
if ! source "$HOME/Bash-utils-init.sh"; then
    echo >&2; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the modules initializer file." >&2; echo >&2; exit 1
fi

# Calling the "BashUtils_InitModules()" function.
if ! BashUtils_InitModules "module --print-init"\
	"main --stat-debug=true stat-error=fatal --stat-log=true --stat-log-r=tee --stat-time-txt=1 --stat-txt-fmt=true"; then
	echo >&2; echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : something went wrong while calling the « BashUtils_InitModules() » function" >&2; echo >&2; exit 1
fi

# This command pauses the script, in order to see how much memory it uses.
# sleep 30

# /////////////////////////////////////////////// TESTING BASH-UTILS FUNCTIONS //////////////////////////////////////////////// #

# Testing a BU::Decho_FMT function
# BU::Decho_FMT_BlinkBoldDISU "Hello world" "$__BU_MAIN_COLOR_ORANGE"
