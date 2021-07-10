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

# Check project related file presence, or create this file.
function CheckProjectRelatedFile
{
	#***** Parameters *****
	p_path=$1

	#***** Code *****
	if [ -f "$p_path" ]; then
        if [ -s "$p_path" ]; then
            true > "$p_path"
        fi
    else
		EchoInit "$(touch "$p_path")"
    fi
}

# Use this function to have a better view about a bug location during a "bash -x" debug.
function DbgMsg
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
function SourcingFailure
{
    #***** Parameters *****
    p_path=$1               # Path of the file that cannot be sourced.

    #***** Code *****
    echo >&2; echo "BASH-UTILS ERROR : UNABLE TO SOURCE THIS FILE --> $p_path" >&2; echo >&2; exit 1
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
f_init="$__BASH_UTILS_CONF/init.conf"

# Text color.
# shellcheck disable=SC1090
f_colors="$__BASH_UTILS_CONF/colors.conf"

# Project's status variables.
# shellcheck disable=SC1090
f_status="$__BASH_UTILS_CONF/projectStatus.conf"

# Text decoration, formatting and printing variables.
# shellcheck disable=SC1090
f_text="$__BASH_UTILS_CONF/text.conf"

# Time variables.
# shellcheck disable=SC1090
f_time="$__BASH_UTILS_CONF/time.conf"


# Storing those variables values into an array to source, print and add easier into the "a_config_files_path" associative array.
a_list_config_files_path=("$f_init" "$f_colors" "$f_status" "$f_text" "$f_time")

# shellcheck disable=SC1090
for f in "${a_list_config_files_path[@]}"; do
    source "$f" || SourcingFailure "$f"; a_config_files_path+=("$f\n")
done


# -----------------------------------------------

## SOURCING LIBRARY FILES

# Defining an associative array to store each sourced library file's path.
a_lib_files_path=()

# Sourcing each file listed into the "$__BASH_UTILS_FUNCTIONS_FILES_PATH" variable.
# shellcheck disable=SC1090
for f in "${__BASH_UTILS_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || SourcingFailure "$f"; a_lib_files_path+=("$f")
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : PROCESSING PROJECT'S RESOURCES

## CREATING NEW VARIABLES

# shellcheck disable=SC2034
__PROJECT_PATH="$(GetParentDirectoryPath "$0")/$__PROJECT_FILE"

# -----------------------------------------------

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

# shellcheck disable=SC2034
__STAT_DEBUG="true";          CheckSTAT_DEBUG         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# The function "CheckSTAT_LOG()" creates the log file and its path if the "$__STAT_LOG" variable's value is equal to "true".
# shellcheck disable=SC2034
__STAT_LOG="true";            CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_LOG_REDIRECT="tee";    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_ERROR="fatal";         CheckSTAT_ERROR         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_TIME_TXT="0";          CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## PROCESSING THE PROJECT'S TEMPORARY DIRECTORY

# The function "CheckSTAT_LOG()" creates the log file and its path when the __STAT_LOG variable's value is "true",
# but in case the value is "false", it's necessary to check if the project's temporary folder exists anyway.
if [ ! -d "$__PROJECT_TMP_PATH" ]; then
	EchoMsg "$(mkdir -p "$__PROJECT_TMP_PATH")"
fi

CheckProjectRelatedFile "$__PROJECT_LOG_FILE_PATH"
CheckProjectRelatedFile "$__PROJECT_COLOR_CODE_FILE_PATH"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

# Ending the initialization process by setting its status variable's value to "false".
__BASH_UTILS_IS_INITIALIZING="false"

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "$__PROJECT_NAME") !"
