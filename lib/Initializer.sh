#!/usr/bin/env bash

# Script initializer file, initializing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# Version : 3.0

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This script is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIRST STEP : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Checking the currently used Bash language's version.
function CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2
		echo -e "This Bash library requires at least the Bash version 4.0.0" >&2
		echo >&2

		echo -e "Your Bash version is : $BASH_VERSION" >&2
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library"
		echo >&2

		exit 1
	fi
}

# Use this function to have a better view about a bug location during a "bash -x" debug.
function DbgMsg()
{
    #***** Parameters *****
    p_code=$1               # Exit code.
    p_sleep=$2              # Pause time in seconds.

    #***** Code *****
    printf "

    -------------------------------------------------
    DEBUG
    -------------------------------------------------

    "

    if [ "$p_code" -eq 0 ]; then
        sleep "$p_sleep"

        return
    else
        exit 1
    fi
}

# Printing an error message if a file cannot be sourced.
function InitializerSourcingFailure()
{
    #***** Parameters *****
    p_path=$1               # Path of the file that cannot be sourced.

    #***** Code *****
    echo >&2; echo -e "BASH-UTILS ERROR : UNABLE TO SOURCE THIS FILE --> $p_path" >&2; echo >&2; exit 1
}

# -----------------------------------------------

## USING FUNCTIONS

CheckBashMinimalVersion

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Sourcing each file listed into the "$__BASH_UTILS_FUNCTIONS_FILES_PATH" variable.

# shellcheck disable=SC1090
for f in "${__BASH_UTILS_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || InitializerSourcingFailure "$f"; __INIT_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__INIT_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || InitializerSourcingFailure "$f"; __INIT_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : PROCESSING PROJECT'S RESOURCES

## CREATING THE PROJECT'S TEMPORARY FOLDER

# MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

__STAT_TXT_FMT="false"; CheckProjectRelatedFile "$__BU_PROJECT_COLOR_CODE_FILE_PATH"

# -----------------------------------------------

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

# shellcheck disable=SC2034
__STAT_DEBUG="true";          CheckSTAT_DEBUG         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# The function "CheckSTAT_LOG()" creates the log file and its path if the "$__STAT_LOG" variable's value is equal to "true".
# shellcheck disable=SC2034
__STAT_LOG="false";           CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO";

if CheckInitialization; then
    __INIT_IS_INITALIZING="false"
fi

# shellcheck disable=SC2034
__STAT_LOG_REDIRECT="tee";      CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_ERROR="fatal";           CheckSTAT_ERROR         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_TIME_TXT="0";            CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_TXT_FMT="true";          CheckSTAT_TXT_FMT       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## PROCESSING THE PROJECT'S TEMPORARY DIRECTORY

# shellcheck disable=SC2034
__STAT_TXT_FMT="false"

# shellcheck disable=SC2034
__STAT_TXT_FMT="true"

# -----------------------------------------------

## PROCESSING REMAINING DIRECTORIES AND FILES

CheckProjectRelatedFile "$__BU_PROJECT_LOG_FILE_PATH"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "$__BU_PROJECT_NAME") !"
