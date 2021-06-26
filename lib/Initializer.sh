#!/usr/bin/env bash

# Script initializer file, initializing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# Version : 2.0

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIRST STEP : DEFINING VARIABLES

## BASH-UTILS PATHS VARIABLES

# TODO : Clean this commentary section.
# Note : the content of this section had been moved in the "Bash-utils/config/Init.conf" file for a better
# integration in the environment-dependent parts in files (like the filepaths in the".desktop" files).

# For more convenience, this configuration file has to be sourced via the ".bashrc" file in the /home directory.

# Sourcing the "~/.bash_profile" file to call the "$__BASH_UTILS_ROOT" variable.
# Do not source the "~/.bashrc" file, as it is executed for interactive non-login shells, unlike "~/.bash_profile".

# TODO : Write these instructions into a LaTeX document.
# source "$HOME/.bash_profile" || {
#     echo >&2; echo "BASH-UTILS ERROR : UNABLE TO SOURCE THE \"$HOME/.bash_profile\" FILE !" >&2
# 
#     if [ "$EUID" -eq 0 ]; then
#         echo "Make sure that this file exists in your \"$HOME\" directory (since you executed this script with super-administrator privileges), and that the \"\$__BASH_UTILS_ROOT\" variable is equal to an existing path." >&2
#     else
#         echo "Make sure that this file exists in your \"$HOME\" directory, and that the \"$\__BASH_UTILS_ROOT\" variable is equal to an existing path." >&2
#     fi
#
#     echo >&2; echo "Aborting operation." >&2
#
#     exit 1
# }

# As the "$__BASH_UTILS_ROOT" variable is defined, it's possible to source the initializer's configuration file.
source "$__BASH_UTILS_ROOT/config/Init.conf" || { echo >&2; echo "BASH-UTILS ERROR : UNABLE TO SOURCE THE \"$__BASH_UTILS_ROOT/config/Init.conf\" FILE" >&2; echo >&2; exit 1; }



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
    echo "$1" 2>&1 | tee -a "$__INIT_LIST_FILE_PATH"
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
            __EchoInit "$p_str"
        else
            if [[ "$p_colorCode" =~ [0-9] ]]; then
                __EchoInit "$(tput setaf "$p_colorCode")$p_str$(tput sgr0)"
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
    echo >&2; echo "$(tput setaf 196)BASH-UTILS ERROR : In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput setaf 196), line $(tput setaf 6)$p_lineno$(tput setaf 196) --> $p_msg$(tput sgr0)" >&2; echo >&2

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
	if [ "${BASH_VERSION:-0}" -lt 6 ]; then
		InitErrMsg "This Bash library requires at least the Bash version 4.0.0 " "$(( LINENO-1 ))" "0"
		EchoInit "Your Bash version is : $(EchoInit "$BASH_VERSION" "6")" >&2
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
        EchoInit "Found directory : $(tput setaf 6)$p_path$(tput sgr0)"

    # Else, if the path points towards a file.
    elif [ -f "$p_path" ]; then
        EchoInit "Found file : $(tput setaf 6)$p_path$(tput sgr0)"
    else
        InitErrMsg "The following path is incorrect : $(tput setaf 6)$p_path$(tput sgr0)" "$p_lineno" "1"
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
    [[ -e "$p_dep" ]] || InitErrMsg "This dependency file doesn't exists : $(tput setaf 6)$p_dep" "$LINENO" "1"

    # shellcheck disable=SC1090
    source "$p_dep" || InitErrMsg "Unable to source this dependency file : $(tput setaf 6)$p_dep" "$LINENO" "1"

    EchoInit "Sourced file : $(tput setaf 6)$p_dep$(tput sgr0)"
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : CHECKING FOR ESSENTIAL DIRECTORIES AND FILES

## PROCESSING THE BASH_UTILS INITIALIZATION LOG FILE AND THE PROJECT'S TEMPORARY FOLDER AND FILES

# Checking the currently used Bash language's version.
CheckBashMinimalVersion

# Clearing the sourced dependencies list file if already exists, or create the project's temporary directory if not exists.
if [ -f "$__INIT_LIST_FILE_PATH" ]; then
    true > "$__INIT_LIST_FILE_PATH" || {
        echo >&2;
        echo "In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput sgr0), line $(( LINENO-2 )) --> Error : unable to clear the initializer's log file."
        echo >&2; exit 1
    }
else
    if [ ! -d "$__PROJECT_LOG_DIR_PATH" ]; then
        mkdir -p "$__PROJECT_LOG_DIR_PATH" || {
            echo >&2
            echo "In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput sgr0), line $(( LINENO-2 )) --> Error : unable to create the project's temporary directory and/or the project's logs directory." >&2; echo >&2; exit 1
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
CheckBURequirements "$__BASH_UTILS_VARS"            "$LINENO"
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

# Tip : It's important to source the functions files before the variables ones to avoid error
# messages while including them at first, as some functions are called into these variables.

EchoInit "CHECKING DEPENDENCIES"

# Sourcing project's status variables file.
EchoInit "Sourcing the variables status file :"; SourceDependency "$__BASH_UTILS_CONF_PROJECT_STATUS"; EchoInit

# Sourcing the fuctions files.
EchoInit "Sourcing the functions files :"; for f in "${__BASH_UTILS_FUNCTIONS_FILES_PATH[@]}"; do SourceDependency "$f"; done; EchoInit

# Sourcing the variables files.
EchoInit "Sourcing the variables files :"; for f in "${__BASH_UTILS_VARIABLES_FILES_PATH[@]}"; do SourceDependency "$f"; done; EchoInit

# -----------------------------------------------
#
# ## CREATING THE FIFOs
#
# EchoInit "PROCESSING THE $(Decho "$__PROJECT_NAME") FIFOs"
#
# # Color processing.
# CreateFIFO "$__PROJECT_FIFO_COLORS"

# -----------------------------------------------

## PROCESSING THE REMAINING PROJECT'S FILES AND FOLDERS

EchoInit "PROCESSING THE REMAINING PROJECT'S FILES AND FOLDERS"

# Creating the "tr" command output's file (for example : for printing non-formatted text between formatted text).
if [ ! -f "$__PROJECT_TR_FILE_PATH" ]; then
	touch "$__PROJECT_TR_FILE_PATH" || { InitErrMsg "Unable to create the $__PROJECT_TR_FILE_PATH file" "1"; }
	
	EchoInit "Created file : $(tput setaf 6)$__PROJECT_TR_FILE_PATH$(tput sgr0)"
else
	EchoInit "Found file : $(tput setaf 6)$__PROJECT_TR_FILE_PATH$(tput sgr0)"
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIFTH STEP : PROCESSING PROJECT'S LOG FILE

## CREATING NEW VARIABLES

# shellcheck disable=SC2034
__PROJECT_PATH="$(GetParentDirectoryPath "$0")/$__PROJECT_FILE"

# -----------------------------------------------

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

# shellcheck disable=SC2034
__STAT_DEBUG="true";          CheckSTAT_DEBUG         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_LOG="true";            CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_LOG_REDIRECT="tee";    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_ERROR="fatal";         CheckSTAT_ERROR         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_TIME_TXT="0";          CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## PROCESSING THE LOG FILE

# Creating or overwritting the paths list file.
if [ "$__STAT_LOG" = "true" ]; then
    if [ -f "$__PROJECT_LOG_FILE_PATH" ]; then
        if [ -s "$__PROJECT_LOG_FILE_PATH" ]; then
            true > "$__PROJECT_LOG_FILE_PATH"
        fi
    else
        if [ ! -d "$__PROJECT_LOG_DIR_PATH" ]; then
            EchoInit "$(mkdir -p "$__PROJECT_LOG_DIR_PATH")"
        fi

        EchoInit "$(touch "$__PROJECT_LOG_FILE_PATH")"
        echo "$__PROJECT_LOG_DIR_PATH/$__PROJECT_LOG_FILE_NAME"
        echo "$__PROJECT_LOG_FILE_PATH"
    fi
    
    # Redirecting files list into the log file.
    HeaderBlue "INITIALIZATION PROCESS LOG OUTPUT"

    EchoMsg "$(cat "$__INIT_LIST_FILE_PATH")" "" "nodate"

    # Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Linux distribution.
    HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM"

    # Getting operating system family.
    EchoNewstep "Operating system family : $(DechoN "$OSTYPE")"
    Newline

    # Gathering OS informations from the "/etc/os-release" file.
    EchoNewstep "Operating system general informations :"
    EchoMsg "$(cat "/etc/os-release")" "" "nodate"
    Newline

    EchoNewstep "Bash version : $(DechoN "$BASH_VERSION")"
    Newline

    EchoSuccess "Successfully got the user's system's informations."
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "$__PROJECT_NAME") !"

# 
