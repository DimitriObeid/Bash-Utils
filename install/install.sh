#!/usr/bin/env bash

# shellcheck disable=SC1091
if ! source "install_functions.sh"; then
    echo >&2; echo "Unable to source the  \"install_functions.sh\"  file." >&2; echo >&2; exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARGUMENTS CHECKING

## USERNAME ARGUMENTS

# Username.
__ARG_USERNAME=$1

if [ -z "$__ARG_USERNAME" ]; then
    EchoError "The username argument is missing !"
    exit 1

elif ! id -u "$__ARG_USERNAME"; then
    EchoError "The username doesn't exists !"
    exit 1
fi

echo "INSTALLING THE  \"Bash-utils\"  LIBRARY !" "I" ""
echo

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### CHECKING MISSING DEPENDENCIES

## BASH-UTILS PARENT FOLDER PROCESSING

# If the Bash-utils parent folder doesn't exists.
if [ ! -d "$__BASH_UTILS_FOLD" ]; then
	EchoStep "CREATING THE  \"$__BASH_UTILS_FOLD\"  FOLDER" "" "J"

	mkdir -pv "$__BASH_UTILS_FOLD" || { EchoError "Unable to create the  \"$__BASH_UTILS_FOLD\"  folder !"; }
	EchoSuccess "The  \"$__BASH_UTILS_FOLD\"  folder was successfully created"
	Newline
fi

# -----------------------------------------------

## WRITING PATH

EchoStep "Please type the directory where you want to install the library."
EchoStep "The default path is \"/usr/local/lib\"."
Newline

read -r "Enter the path :" $path

if [ -z "$path" ]; then
    echo '__BASH_UTILS_ROOT="/usr/local/lib/"' >> "$HOME/.bash_profile"
    source "$HOME/.bash_profile"
elif [ -d "$path" ]; then
    echo "__BASH_UTILS_ROOT=\"$path\""
    source "$HOME/.bash_profile"
else
    
fi

# -----------------------------------------------

## CHECKING FOR LIBRARY INSTALLATION AND RUNNING PROGRAMS

EchoStep "DOWNLOADING THE LIBRARY DEPENDENCIES" "" "J"

# Checking the operating system support for the dependecies installation.
CheckSupportAndInstallDeps
