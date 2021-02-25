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

# Note : the content of this section had been copied in the "~/Bash-utilsrc" file for a better
# integration in the environment-dependent parts in files (like the filepaths in the".desktop" files).

# For more convenience, this configuration file has to be sourced via the ".bashrc" file in the /home directory.

# Bash-Utils root directory path.
__BASH_UTILS_ROOT="/usr/local/lib/Bash-utils"

# Bash-Utils sub-folders paths.
__BASH_UTILS="$__BASH_UTILS_ROOT/lib"
__BASH_UTILS_BIN="$__BASH_UTILS_ROOT/bin"
__BASH_UTILS_CONF="$__BASH_UTILS_ROOT/config"
__BASH_UTILS_TMP="$__BASH_UTILS_ROOT/tmp"

# "config" folder's content.
__BASH_UTILS_CONF_PROJECT_STATUS="$__BASH_UTILS_CONF/ProjectStatus.conf"

# Bash-utils dev-tools paths.
# shellcheck disable=SC2034
__BASH_UTILS_DEVTOOLS_ROOT="$__BASH_UTILS_ROOT/projects/dev-tools"

# shellcheck disable=SC2034
__BASH_UTILS_DEVTOOLS_BIN="$__BASH_UTILS_DEVTOOLS_ROOT/dev-bin"

# shellcheck disable=SC2034
__BASH_UTILS_DEVTOOLS_IMG="$__BASH_UTILS_DEVTOOLS_ROOT/dev-img"

# shellcheck disable=SC2034
__BASH_UTILS_DEVTOOLS_SRC="$__BASH_UTILS_DEVTOOLS_ROOT/dev-src"

# shellcheck disable=SC2034
__BASH_UTILS_DEVTOOLS_TRANSL="$__BASH_UTILS_DEVTOOLS_ROOT/dev-translations"

# "lib" folder's content.
__BASH_UTILS_FUNCTS="$__BASH_UTILS/functions"
__BASH_UTILS_FUNCTS_BASIS="$__BASH_UTILS_FUNCTS/basis"
__BASH_UTILS_LANG="$__BASH_UTILS/lang"
__BASH_UTILS_VARS="$__BASH_UTILS/variables"

# -----------------------------------------------

## PROJECT'S PATHS

# Script file's informations
__PROJECT_FILE=$(basename "$0")                           # Project file's name.
__PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')         # Name of the project (project file's name without its file extension).

# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.

# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
    __PROJECT_TMP_DIR="$__BASH_UTILS_TMP/$__PROJECT_NAME - ROOT"
    __PROJECT_LOG_NAME="$__PROJECT_NAME - ROOT.log"
else
    __PROJECT_TMP_DIR="$__BASH_UTILS_TMP/$__PROJECT_NAME"
    __PROJECT_LOG_NAME="$__PROJECT_NAME.log"
fi

# Defining project's log file's path.
__PROJECT_LOG_PARENT_NAME="logs"
__PROJECT_LOG_PARENT_PATH="$__PROJECT_TMP_DIR/$__PROJECT_LOG_PARENT_NAME"
__PROJECT_LOG_PATH="$__PROJECT_LOG_PARENT_PATH/$__PROJECT_LOG_NAME"

# -----------------------------------------------

## OTHER PATHS VARIABLES

# Bash-utils paths list variables (to check if every directories and files were successfully sourced). 
__INIT_FILE_LIST_NAME="Sourced.list"
__INIT_LIST_FILE_PATH="$__PROJECT_TMP_DIR/$__INIT_FILE_LIST_NAME"

# -----------------------------------------------

## OTHER VARIABLES


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : DEFINING INITIALIZATION FUNCTIONS

# Controlling all the redirections in a single place for a better debugging process.
function EchoDBG
{
    if [ -z "$__INIT_LIST_FILE_PATH" ] || [ ! -f "$__INIT_LIST_FILE_PATH" ]; then
        echo >&2; echo "Error : the initializer log file's path is invalid." >&2; echo >&2; exit 1
    else
        echo "$1" >> "$__INIT_LIST_FILE_PATH"
    fi
}

# Defining the error message's beginning and end.
function InitErrMsg
{
    #***** Parameters *****
    local p_msg=$1
    local p_lineno=$2
    
    #***** Code *****
    echo >&2; echo "$(tput setaf 196)In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput setaf 196), line $(tput setaf 6)$p_lineno$(tput setaf 196) --> ERROR : $p_msg$(tput sgr0)" >&2; echo >&2
    kill "$$"
}

# Finding Bash-utils directories.
function CheckBURequirements
{
    #***** Parameters *****
    local p_path=$1
    local p_lineno=$2
    
    #***** Code *****
    # If the path points towards a directory.
    if [ -d "$p_path" ]; then
        EchoDBG "Found directory : $(tput setaf 6)$p_path$(tput sgr0)"
        
    # Else, if the path points towards a file.
    elif [ -f "$p_path" ]; then
        EchoDBG "Found file : $(tput setaf 6)$p_path$(tput sgr0)"
    else
        InitErrMsg "The following path is incorrect : $(tput setaf 6)$p_path$(tput sgr0)" "$p_lineno"
        exit 1
    fi
}

# Making the code cleaner in the 4th part (sourcing dependecies).
function EchoSourcedDependency
{
    #***** Parameters *****
    local p_dep=$1
    
    #***** Code *****
    EchoDBG "Sourced file : $(tput setaf 6)$p_dep$(tput sgr0)" 2>&1 | tee -a "$__INIT_LIST_FILE_PATH"
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : CHECKING FOR ESSENTIAL DIRECTORIES

# Clearing the sourced directories list file if already exists, or create the project's temporary directory if not exists.
if [ -f "$__INIT_LIST_FILE_PATH" ]; then
    true > "$__INIT_LIST_FILE_PATH"
else
    if [ ! -d "$__PROJECT_TMP_DIR" ]; then
        mkdir "$__PROJECT_TMP_DIR" || {
            echo 2>&1 | tee -a "$__INIT_LIST_FILE_PATH"
            echo "In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput sgr0), line $(( LINENO-2 )) --> Error : unable to create the project's temporary directory." 2>&1 | tee -a "$__INIT_LIST_FILE_PATH"
        }
    fi
    
    touch "$__INIT_LIST_FILE_PATH"
fi

EchoDBG "CHECKING REQUIRED DIRECTORIES"
CheckBURequirements "$__BASH_UTILS_BIN"           "$LINENO"
CheckBURequirements "$__BASH_UTILS_CONF"          "$LINENO"
CheckBURequirements "$__BASH_UTILS_TMP"           "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS"        "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS_BASIS"  "$LINENO"
CheckBURequirements "$__BASH_UTILS_VARS"          "$LINENO"
EchoDBG

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FOURTH STEP : PROCESSING DEPENDENCIES

## SOURCING DEPENDENCIES

# Tip : It's important to source the functions files before the variables ones to avoid error
# messages while including them at first, as some functions are called into these variables.

EchoDBG "CHECKING DEPENDENCIES"

# Sourcing project's status variables file.
EchoDBG "Sourcing the variables status file :"

# shellcheck disable=SC1090
source "$__BASH_UTILS_CONF_PROJECT_STATUS" \
    || InitErrMsg "Unable to source this file : $(tput setaf 6)$__BASH_UTILS_CONF_PROJECT_STATUS" "$LINENO"
EchoSourcedDependency "$__BASH_UTILS_CONF_PROJECT_STATUS"; EchoDBG

# Sourcing the very basic fuctions files.
EchoDBG "Sourcing the very basic functions files :"; for f in "$__BASH_UTILS_FUNCTS_BASIS/"*.lib; do
    [[ -e "$f" ]] || InitErrMsg "This basic functions file doesn't exists : $(tput setaf 6)$f" "$LINENO"
    
    # shellcheck disable=SC1090
    source "$f" || InitErrMsg "Unable to source this basic functions file : $(tput setaf 6)$f" "$LINENO"
    EchoSourcedDependency "$f"
done; EchoDBG

# Sourcing the main functions files.
EchoDBG "Sourcing the main functions files :"; for f in "$__BASH_UTILS_FUNCTS/main/"*.lib; do
    [[ -e "$f" ]] || InitErrMsg "This main functions file doesn't exists : $(tput setaf 6)$f" "$LINENO"

    # shellcheck disable=SC1090
    source "$f" || InitErrMsg "Unable to source this main functions file : $(tput setaf 6)$f" "$LINENO"
    EchoSourcedDependency "$f"
done; EchoDBG

# Sourcing the variables files.
EchoDBG "Sourcing the variables files :"; for f in "$__BASH_UTILS_VARS/"*.var; do
    [[ -e "$f" ]] || InitErrMsg "This variables file doesn't exists : $(tput setaf 6)$f" "$LINENO"

    # shellcheck disable=SC1090
    source "$f" || InitErrMsg "Unable to source this variables file : $(tput setaf 6)$f" "$LINENO"
    EchoSourcedDependency "$f"
done; EchoDBG

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PROCESSING PROJECT'S LOG FILE

## CREATING NEW VARIABLES

# shellcheck disable=SC2034
__PROJECT_PATH="$(GetParentDirectoryPath "$0")/$__PROJECT_FILE"

# -----------------------------------------------

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

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
    if [ -f "$__PROJECT_LOG_PATH" ]; then
        if [ -s "$__PROJECT_LOG_PATH" ]; then
            true > "$__PROJECT_LOG_PATH"
        fi
    else
        if [ ! -d "$__PROJECT_LOG_PARENT_PATH" ]; then
            Makedir "$__PROJECT_TMP_DIR" "$__PROJECT_LOG_PARENT_NAME"
        fi

        Makefile "$__PROJECT_LOG_PARENT_PATH" "$__PROJECT_LOG_NAME"
        echo "$__PROJECT_LOG_PARENT_PATH/$__PROJECT_LOG_NAME"
        echo "$__PROJECT_LOG_PATH"
    fi
    
    # Redirecting files list into the log file.
    HeaderBlue "SOURCED FILES LOG OUTPUT"

    EchoMsg "$(cat "$__INIT_LIST_FILE_PATH")"

    # Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Linux distribution.
    HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM"

    # Getting operating system family.
    EchoNewstep "Operating system family :$__COL_RESET $OSTYPE"
    Newline

    # Gathering OS informations from the "/etc/os-release" file.
    EchoNewstep "Operating system general informations :"
    EchoMsg "$(cat "/etc/os-release")"
    Newline

    EchoNewstep "Bash version :$__COL_RESET $BASH_VERSION"
    Newline

    EchoSuccess "Successfully got the user's system's informations."
    Newline
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "${__PROJECT_NAME^^}") !"
