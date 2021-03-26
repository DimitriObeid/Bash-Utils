#!/usr/bin/env bash

# shellcheck disable=SC1091
if ! source "install_functions.sh"; then
    echo >&2; echo "Unable to source the  \"install_functions\"  file." >&2; echo >&2; exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Username.
__ARG_USERNAME=$1

if [ -z "$__ARG_USERNAME" ]; then

elif [  ]; then

fi

EchoStep "INSTALLING THE  \"Bash-utils\"  LIBRARY !" "I" "J"
echo

if [ ! -d "$__BASH_UTILS_FOLD" ]; then
	EchoStep "Creating the  \"$__BASH_UTILS_FOLD\"  folder" "I" "J"

	mkdir -pv "$__BASH_UTILS_FOLD" || { EchoError "Unable to create the  \"$__BASH_UTILS_FOLD\"  folder !"; }
	EchoSuccess "The  \"$__BASH_UTILS_FOLD\"  folder was successfully created"
	Newline
fi

if [ "$I" -eq 0 ]; then
    EchoStep "Giving writing rights to " "I" "J"
else
    EchoStep "" "" "J"
fi

EchoStep "Downloading the library dependencies"
CheckSupport
