#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Bash-utils-include.sh
# Description : Library initializer file, initializing all the modules you need for your scripts.
# Author(s) : Dimitri Obeid
# Version : 3.0

# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This script is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MODULES INITIALIZATION

## DEFINING INITIALIZATION FUNCTIONS

# Checking the currently used Bash language's version.
function ModuleInitializer_CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS MODULES INITIALIZATION ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2
		echo -e "This Bash library requires at least the Bash language's version 4.0.0" >&2
		echo >&2

		echo -e "Your Bash version is : $BASH_VERSION" >&2
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library"
		echo >&2

		exit 1
	fi
}

function ModuleInitializer_GetModuleName()
{
    v_module="$(cd $(dirname "$1"); pwd -P)"; echo -ne "${v_module##*/}"
}

# Printing an error message if a file cannot be sourced.
function ModuleInitializer_SourcingFailure()
{
    #***** Parameters *****
    p_path=$1               # Path of the file that cannot be sourced.
    p_module=$2             # Name of the module.

    #***** Code *****
    echo >&2; echo -e ">>>>> BASH-UTILS ERROR >>>>> UNABLE TO SOURCE THIS ''$p_module'' FILE --> $p_path" >&2; echo >&2; exit 1
}

# -----------------------------------------------

## INITIALIZATION CODE

# Checking the currently used Bash language's version.
# THIS FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!!
ModuleInitializer_CheckBashMinimalVersion


# List of all the modules to include passed as arguments.
p_module_list=("$@")

# Checking if any wanted module exists.
for module in "${p_module_list[@]}"; do
	if ! "$(ls -d "$HOME/.Bash-utils/config/$module/")"; then
		printf
	fi

    if  ! "$(ls -d "$HOME/.Bash-utils/module/$module")"; then
        printf "WARNING ! THE ''%s'' module is not installed or doesn't exists !!!" "$module"; exit 1
    fi
done

for module in "${p_module_list[@]}"; do
	source "$HOME/.Bash-utils/config/$module/module.conf"
	source "$HOME/.Bash-utils/module/$module/Initializer.sh"
done
