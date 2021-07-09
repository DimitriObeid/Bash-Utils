#!/usr/bin/env bash

# Script initializer file, initializing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# Version : 3.0

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !" >&2; echo >&2
    echo "This script is not meant to be executed directly !" >&2
    echo "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIRST STEP : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Checking the currently used Bash language's version.
function CheckBashMinimalVersion
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2
		echo "This Bash library requires at least the Bash version 4.0.0" >&2
		echo >&2

		echo "Your Bash version is : $BASH_VERSION" >&2
		echo >&2

		echo "Please install at least the Bash version 4.0.0 to use this library"
		echo >&2

		exit 1
	fi
}

function SourcingFailure
{
    #***** Parameters *****
    p_msg=$1

    #***** Code *****
    echo >&2; echo "BASH-UTILS ERROR : UNABLE TO SOURCE THIS FILE --> $p_msg" >&2; echo >&2; exit 1
}

# -----------------------------------------------

## USING FUNCTIONS

CheckBashMinimalVersion

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : SOURCING FILES

## SOURCING CONFIGURATION FILES FIRST

# Defining an associative array to store each sourced configuration file's path.
a_config_files_path=()

# Project's and initialization process global variables.
# shellcheck disable=SC1090
f_init="$__BASH_UTILS_CONF/init.conf";              source "$f_init" || SourcingFailure "$f_init"; a_config_files_path+="$f_init"

# Text color.
# shellcheck disable=SC1090
f_colors="$__BASH_UTILS_CONF/colors.conf";          source "$f_colors" || SourcingFailure "$f_colors"; a_config_files_path+="$f_colors"

# Project's status variables.
# shellcheck disable=SC1090
f_status="$__BASH_UTILS_CONF/projectStatus.conf";   source "$f_status" || SourcingFailure "$f_status"; a_config_files_path+="$f_status"

# Text decoration, formatting and printing variables.
# shellcheck disable=SC1090
f_text="$__BASH_UTILS_CONF/text.conf";              source "$f_text" || SourcingFailure "$f_text"; a_config_files_path+="$f_text"

# Time variables.
# shellcheck disable=SC1090
f_time="$__BASH_UTILS_CONF/time.conf";              source "$f_time" || SourcingFailure "$f_time"; a_config_files_path+="$f_time"

# -----------------------------------------------

## SOURCING LIBRARY FILES

# Defining an associative array to store each sourced library file's path.
a_lib_files_path=()

# shellcheck disable=SC1090
for f in "${__BASH_UTILS_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || SourcingFailure "$f"
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : 

##


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FOURTH STEP : 

##


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIFTH STEP : 

##
