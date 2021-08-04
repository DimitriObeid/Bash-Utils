#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Text.lib
# Description : Script initializer file, initializing all you need for your scripts.
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

#### FIRST STEP : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Add value in the "$__INIT_STR_ARRAY" array that stores the initialization log output, according to the "$__BU_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__INIT_STR_ARRAY" array AND display text to the terminal.
#   "false" --> store the text into the "$__INIT_STR_ARRAY" array WITHOUT displaying any text. 
function InitializerAddInitStrArrayVal()
{
    #***** Parameters *****
    p_string=$1             # String to store in the "$__INIT_STR_ARRAY" array.
    p_option=$2             # "echo" command's options. 

    #***** Code *****
    if [ "$__BU_STAT_PRINT_INIT_LOG" = "true" ]; then
        __INIT_STR_ARRAY+=("$p_string"); printf "${p_string##*] }"    # Cutting the log entry's date from a string, before displaying it on the terminal.
    else
        __INIT_STR_ARRAY+=("$p_string")
    fi
}

# Checking the currently used Bash language's version.
function InitializerCheckBashMinimalVersion()
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

InitializerCheckBashMinimalVersion

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Sourcing each file listed into the "$__BASH_UTILS_FUNCTIONS_FILES_PATH" CheckTxtFmt.

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

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS AND CREATING THE PROJECT'S TEMPORARY FOLDER

# shellcheck disable=SC2034
ChangeSTAT_DEBUG        "true"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
ChangeSTAT_ERROR        "fatal" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
ChangeSTAT_TIME_TXT     "0"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
ChangeSTAT_TXT_FMT      "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

if CheckIsInitializing; then
    # shellcheck disable=SC2034
    __INIT_IS_INITALIZING="false"
fi

# The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_STAT_LOG" CheckTxtFmt's value is equal to "true".
# shellcheck disable=SC2034
ChangeSTAT_LOG       "true"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO";

# shellcheck disable=SC2034
ChangeSTAT_LOG_REDIRECT "tee"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

MkTmpDir

# -----------------------------------------------

## MODIFYING OTHER STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

# shellcheck disable=SC2034
ChangeSTAT_TXT_FMT   "true"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

if ! CheckProjectRelatedFile "$__BU_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_PROJECT_COLOR_CODE_FILE_NAME" "f"; then return 1; fi
if ! CheckProjectRelatedFile "$__BU_PROJECT_LOG_FILE_PARENT" "$__BU_PROJECT_LOG_FILE_NAME" "f"; then return 1; fi

exit 0

# Setting this status variable's value to "false" once the initialization part is over.

# shellcheck disable=SC2034
ChangeSTAT_CPLS         "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "$__BU_PROJECT_NAME") !"
