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

# Print an error message.
function PrintErrorMsg
{
    #***** Parameters *****
    local p_msg=$1

    #***** Code *****
    echo >&2; echo "${__BU_COLOR_ERROR}IN ${__BU_COLOR_HIGHLIGHT}${BASH_SOURCE[0]}${__BU_COLOR_ERROR} --> BASH UTILS ERROR : $p_msg${__BU_COLOR_RESET}"
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
        if [ ! -d "$(GetParentDirectoryPath "$p_path")" ]; then
            mkdir -pv "$(GetParentDirectoryPath "$p_path")" || { echo >&2; PrintErrorMsg "UNABLE TO CREATE THE ${__BU_COLOR_HIGHLIGHT}$(GetParentDirectoryPath "$p_path")${__BU_COLOR_ERROR} FOLDER !" >&2; echo >&2; exit 1; }
        fi

		EchoMsg "$(touch "$p_path")" || { echo >&2; PrintErrorMsg "UNABLE TO CREATE THE ${__BU_COLOR_HIGHLIGHT}$p_path${__BU_COLOR_ERROR} FILE !"; echo >&2; exit 1 }
		EchoSuccess "Successfully created the $(DechoHighlight "$p_path") file."
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

# Storing the configuration files path variables values into an array to source, print and add easier into the "a_config_files_path" associative array.
# Those files are, respectly, the :
#   - Project's and initialization process global variables
#   - Text color
#   - Project's status variables
#   - Text decoration, formatting and printing variables
#   - Time variables

a_list_config_files_path=("$__BASH_UTILS_CONF_FILE_INIT" \
    "$__BASH_UTILS_CONF_FILE_COLORS" \
    "$__BASH_UTILS_CONF_FILE_PROJECT_STATUS" \
    "$__BASH_UTILS_CONF_FILE_TEXT" \
    "$__BASH_UTILS_CONF_FILE_TIME")

# shellcheck disable=SC1090
for f in "${a_list_config_files_path[@]}"; do
    source "$f" || SourcingFailure "$f"; a_config_files_path+=("$f")
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
__STAT_LOG="false";            CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

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
function MkTmpDir
{
    if [ ! -d "$__PROJECT_TMP_DIR_PATH" ]; then
        EchoMsg "$(mkdir -pv "$__PROJECT_TM_DIR_PATH" || HandleErrors "1" "THE $(DechoHighlight "$__PROJECT_TMP_DIR_PATH") CANNOT BE CREATED !" "Please check at the mentionned line in the mentionned file." "$__PROJECT_TMP_DIR_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO ))")"
    fi
}

MkTmpDir

# -----------------------------------------------

## PROCESSING REMAINING DIRECTORIES AND FILES

CheckProjectRelatedFile "$__PROJECT_LOG_FILE_PATH"
CheckProjectRelatedFile "$__PROJECT_COLOR_CODE_FILE_PATH"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "$__PROJECT_NAME") !"
