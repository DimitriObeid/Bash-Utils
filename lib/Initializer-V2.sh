#!/usr/bin/env bash

# Script initializer file, initializing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# Version : 2.0

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This script is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIRST STEP : DEFINING VARIABLES

## BASH-UTILS PATHS VARIABLES

# TODO : Clean this commentary section.
# Note : the content of this section had been moved in the "Bash-utils/config/Init.conf" file for a better
# integration in the environment-dependent parts in files (like the filepaths in the".desktop" files).

# For more convenience, this configuration file has to be sourced via the ".bashrc" file in the /home directory.

# Sourcing the "~/.bash_profile" file to call the "$__BASH_UTILS_ROOT" CheckTxtFmt.
# Do not source the "~/.bashrc" file, as it is executed for interactive non-login shells, unlike "~/.bash_profile".

# shellcheck disable=SC1090
source "$__BASH_UTILS_CONF/init.conf" ||
{
    echo >&2; echo -e "BASH-UTILS ERROR : UNABLE TO SOURCE THE '$__BASH_UTILS_CONF/init.conf' FILE : '$__BASH_UTILS_CONF/init'" >&2
    
    if [ -z "${__BASH_UTILS_ROOT:+x}" ]; then
        echo >&2; echo 
    fi
    
    exit 1
}

# Grouping colors by categories, to modify easily each color code outside a FIFO input.
# As the "$__BASH_UTILS_ROOT" CheckTxtFmt is defined, it's possible to source the initializer's configuration file.

# shellcheck disable=SC1090
source "$__BASH_UTILS_CONF/colors.conf" || { echo >&2; echo -e "BASH-UTILS ERROR : UNABLE TO SOURCE THE '$__BASH_UTILS_CONF/colors.conf' FILE : " >&2; echo >&2; exit 1; }


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : DEFINING INITIALIZATION AND BASIC FUNCTIONS

## USEFUL BASIC FUNCTIONS

# Use this function to have a better view about a bug location during a "bash -x" debug.
function DbgMsg
{
    #***** Parameters *****
    p_code=$1
    p_sleep=$2

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

# -----------------------------------------------

## PRINTING TEXT FUNCTIONS THAT BELONG TO THE INITIALIZATION PROCESS.

# This function is called at multiple times in the next function, to avoid changing redirection operators more than once.
function __EchoInit
{
    echo -e "$1" 2>&1 | tee -a "$__INIT_LIST_FILE_PATH"
}

# Controlling all the redirections in a single place for a better debugging process.
function EchoInit
{
    #***** Parameters *****
    local p_str=$1
    local p_colorCode=$2

    #***** Code *****
    if [ -z "$__INIT_LIST_FILE_PATH" ] || [ ! -f "$__INIT_LIST_FILE_PATH" ]; then
        InitErrMsg "The initializer log file's path is invalid." "$(( LINENO-1 ))" "1"
    else
        if [ -z "$p_colorCode" ]; then
            __EchoInit "$p_str${__BU_COLOR_RESET}"
        else
            if [[ "$p_colorCode" =~ [0-9] ]]; then
                __EchoInit "$(tput setaf "$p_colorCode")$p_str${__BU_COLOR_RESET}"
            else
                InitErrMsg "The ${FUNCNAME[0]} color code must be an integer !" "$(( LINENO-1 ))" "1"
            fi
        fi
    fi
}

# Defining the error message's beginning and end.
function InitErrMsg
{
    #***** Parameters *****
    local p_msg=$1
    local p_lineno=$2
    local p_exit=$3

    #***** Code *****
    echo >&2; echo -e "${__BU_COLOR_ERROR}BASH-UTILS ERROR : In ${__BU_COLOR_HIGHLIGHT}$(basename "${BASH_SOURCE[0]}")${__BU_COLOR_ERROR}, line ${__BU_COLOR_HIGHLIGHT}$p_lineno${__BU_COLOR_ERROR} --> $p_msg${__BU_COLOR_RESET}" >&2; echo >&2

    if [ "$p_exit" -eq 0 ]; then
        return
    elif [ "$p_exit" -eq 1 ]; then
        exit 1
	else
		exit 1
    fi
}

# -----------------------------------------------

## CHECKINGS FUNCTIONS THAT BELONG TO THE INITIALIZATION PROCESS.

# Checking the currently used Bash language's version.
function CheckBashMinimalVersion
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		echo -ne "${__BU_COLOR_ERROR}BASH-UTILS ERROR : In ${__BU_COLOR_HIGHLIGHT}$(basename "${BASH_SOURCE[0]}")${__BU_COLOR_ERROR}, line ${__BU_COLOR_HIGHLIGHT}$(( LINENO-1 ))${__BU_COLOR_ERROR} --> ${__BU_COLOR_RESET}" >&2
		echo -e "${__BU_COLOR_ERROR}This Bash library requires at least the Bash version ${__BU_COLOR_HIGHLIGHT}4.0.0${__BU_COLOR_RESET}" >&2
		echo >&2

		echo -e "${__BU_COLOR_ERROR}Your Bash version is : ${__BU_COLOR_HIGHLIGHT}$BASH_VERSION${__BU_COLOR_RESET}" >&2
		echo >&2

		echo -e "${__BU_COLOR_ERROR}Please install at least the ${__BU_COLOR_HIGHLIGHT}4.0.0${__BU_COLOR_ERROR} Bash version to use this library${__BU_COLOR_RESET}"
		echo >&2

		exit 1
	fi
}

# Finding Bash-utils directories.
function CheckBURequirements
{
    #***** Parameters *****
    local p_path=$1
    local p_lineno=$2

    #***** Code *****
    # If the path points towardœs a directory.
    if [ -d "$p_path" ]; then
        EchoInit "Found directory : ${__BU_COLOR_HIGHLIGHT}$p_path${__BU_COLOR_RESET}"

    # Else, if the path points towards a file.
    elif [ -f "$p_path" ]; then
        EchoInit "Found file : ${__BU_COLOR_HIGHLIGHT}$p_path${__BU_COLOR_RESET}"
    else
        InitErrMsg "The following path is incorrect : ${__BU_COLOR_HIGHLIGHT}$p_path" "$p_lineno" "1"
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

# Checking if the initialization process is done or not
function CheckIsLibraryInitializing
{
    #***** Code *****
    if [ "$__BASH_UTILS_IS_INITIALIZING" = "true" ]; then
        return 0
    else
        return 1
    fi
}

# Sourcing library's dependencies
function SourceDependency
{
    #***** Parameters *****
    local p_dep=$1

    #***** Code *****
    [[ -e "$p_dep" ]] || InitErrMsg "This dependency file doesn't exists : ${__BU_COLOR_HIGHLIGHT}$p_dep" "$LINENO" "1"

    # shellcheck disable=SC1090
    source "$p_dep" || InitErrMsg "Unable to source this dependency file : ${__BU_COLOR_HIGHLIGHT}$p_dep" "$LINENO" "1"

    EchoInit "Sourced file : ${__BU_COLOR_HIGHLIGHT}$p_dep${__BU_COLOR_RESET}"
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : CHECKING FOR ESSENTIAL DIRECTORIES AND FILES

## PROCESSING THE BASH_UTILS INITIALIZATION LOG FILE AND THE PROJECT'S TEMPORARY FOLDER AND FILES

# Calling the function that checks the currently used Bash language's version.
CheckBashMinimalVersion

# Clearing the sourced dependencies list file if already exists, or create the project's temporary directory if not exists.
if [ -f "$__INIT_LIST_FILE_PATH" ]; then
    true > "$__INIT_LIST_FILE_PATH" || {
        echo >&2;
        echo -e "${__BU_COLOR_ERROR}In ${__BU_COLOR_HIGHLIGHT}$(basename "${BASH_SOURCE[0]}")${__BU_COLOR_ERROR}, line ${__BU_COLOR_HIGHLIGHT}$(( LINENO-2 ))${__BU_COLOR_ERROR} --> Error : unable to clear the initializer's log file.${__BU_COLOR_RESET}"
        echo >&2; exit 1
    }
else
    if [ ! -d "$__BU_PROJECT_LOG_DIR_PATH" ]; then
        mkdir -p "$__BU_PROJECT_LOG_DIR_PATH" || {
            echo >&2
            echo -e "${__BU_COLOR_ERROR}In ${__BU_COLOR_HIGHLIGHT}$(basename "${BASH_SOURCE[0]}")${__BU_COLOR_ERROR}, line ${__BU_COLOR_HIGHLIGHT}$(( LINENO-2 ))${__BU_COLOR_ERROR} --> Error : unable to create the project's temporary directory and/or the project's logs directory.${__BU_COLOR_RESET}" >&2; echo >&2; exit 1
        }
    fi

    touch "$__INIT_LIST_FILE_PATH"
fi

# -----------------------------------------------

## CHECKING FOR THE REQUIRED FOLDERS

# Checking for the required Bash-utils folders.
EchoInit "CHECKING FOR BASH-UTILS REQUIRED DIRECTORIES"
CheckBURequirements "$__BASH_UTILS_BIN"             "$LINENO"
CheckBURequirements "$__BASH_UTILS_CONF"            "$LINENO"
CheckBURequirements "$__BASH_UTILS_TMP"             "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS"          "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS_BASIS"    "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS_MAIN"     "$LINENO"
EchoInit

# Checking for the development tools required folders.
if [ -n "$__BASH_UTILS_DEVTOOLS_PROJECT" ] && [ "$__BASH_UTILS_DEVTOOLS_PROJECT" = "true" ]; then
    EchoInit "CHECKING FOR DEVTOOLS REQUIRED DIRECTORIES"
    CheckBURequirements "$__BASH_UTILS_DEVTOOLS_BIN"    "$LINENO"
    CheckBURequirements "$__BASH_UTILS_DEVTOOLS_IMG"    "$LINENO"
    CheckBURequirements "$__BASH_UTILS_DEVTOOLS_SRC"    "$LINENO"
    CheckBURequirements "$__BASH_UTILS_DEVTOOLS_TRANSL" "$LINENO"
fi

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FOURTH STEP : PROCESSING DEPENDENCIES

## SOURCING DEPENDENCIES

# Tip : It's important to source the functions files before the CheckTxtFmts ones to avoid error
# messages while including them at first, as some functions are called into these CheckTxtFmts.

EchoInit "CHECKING DEPENDENCIES"

# Sourcing project's status CheckTxtFmts file.
EchoInit "Sourcing the CheckTxtFmts status file :"; SourceDependency "$__BASH_UTILS_CONF_PROJECT_STATUS"; EchoInit

# Sourcing the fuctions files.
EchoInit "Sourcing the functions files :"; for f in "${__BASH_UTILS_FUNCTIONS_FILES_PATH[@]}"; do SourceDependency "$f"; done; EchoInit

# Sourcing the remaining configuration files.
EchoInit "Sourcing the remaining configuration files :"
SourceDependency "$__BASH_UTILS_CONF/text.conf"
SourceDependency "$__BASH_UTILS_CONF/time.conf"
EchoInit

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIFTH STEP : PROCESSING PROJECT'S LOG FILE

## CREATING NEW VARIABLES

# shellcheck disable=SC2034
__BU_PROJECT_PATH="$(GetParentDirectoryPath "$0")/$__BU_PROJECT_FILE_PATH"

# -----------------------------------------------

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

# shellcheck disable=SC2034
__BU_STAT_DEBUG="true";          CheckSTAT_DEBUG         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# The function "CheckSTAT_LOG()" creates the log file and its path.
# shellcheck disable=SC2034
__BU_STAT_LOG="true";            CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__BU_STAT_LOG_REDIRECT="tee";    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__BU_STAT_ERROR="fatal";         CheckSTAT_ERROR         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__BU_STAT_TIME_TXT="0";          CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## PROCESSING THE PROJECT'S TEMPORARY DIRECTORY

# The function "CheckSTAT_LOG()" creates the log file and its path when the __BU_STAT_LOG CheckTxtFmt's value is "true",
# but in case the value is "false", it's necessary to check if the project's temporary folder exists anyway.
if [ ! -d "$__BU_PROJECT_TMP_PATH" ]; then
	EchoInit "$(mkdir -p "$__BU_PROJECT_TMP_PATH")"
fi

CheckProjectRelatedFile "$__BU_PROJECT_LOG_FILE_PATH"
CheckProjectRelatedFile "$__BU_PROJECT_COLOR_CODE_FILE_PATH"

# -----------------------------------------------

## PROCESSING THE REMAINING PROJECT'S FILES AND FOLDERS

EchoInit "PROCESSING THE REMAINING PROJECT'S FILES AND FOLDERS"

# Creating the "tr" command output's file (for example : for printing non-formatted text between formatted text).
if [ ! -f "$__BU_PROJECT_TR_FILE_PATH" ]; then
	touch "$__BU_PROJECT_TR_FILE_PATH" || { InitErrMsg "Unable to create the ${__BU_COLOR_HIGHLIGHT}$__BU_PROJECT_TR_FILE_PATH file" "1"; }
	
	EchoInit "Created file : ${__BU_COLOR_HIGHLIGHT}$__BU_PROJECT_TR_FILE_PATH${__BU_COLOR_RESET}"
else
	EchoInit "Found file : ${__BU_COLOR_HIGHLIGHT}$__BU_PROJECT_TR_FILE_PATH${__BU_COLOR_RESET}"
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

# Ending the initialization process by setting its status CheckTxtFmt's value to "false".
__BASH_UTILS_IS_INITIALIZING="false"

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "$__BU_PROJECT_NAME") !"
