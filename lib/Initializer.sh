#!/usr/bin/env bash

# Script initializer file, initializing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# Version : 2.0

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# Defining a function to print debug status messages and whitespaces, to be shown only when the shell script is executed with the "bash -x" command.
function PrintDBGVoid
{ echo "$(tput setaf 0)////////////////////////////////////////////////////////////////////////////$(tput sgr0)"; }

function PrintDBGMsg
{
    PrintDBGVoid || return
    echo "$(tput setaf 166)$1$(tput sgr0)";
    PrintDBGVoid || return
}

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIRST STEP : DEFINING VARIABLES

## BASH-UTILS PATHS VARIABLES

# Note : the content of this section had been copied in the "~/Bash-utilsrc" file for a better
# integration in the environment-dependent parts in files (like the filepaths in the".desktop" files).

# For more convenience, this configuration file has to be sourced via the ".bashrc" file in the /home directory.

PrintDBGMsg "Initializing \"BASH_UTILS\" variables"

# Bash-Utils root directory path.
__BASH_UTILS_ROOT="/usr/local/lib/Bash-utils"

# Bash-Utils sub-folders paths.
__BASH_UTILS="$__BASH_UTILS_ROOT/lib/"
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

PrintDBGVoid

# -----------------------------------------------

## PROJECT'S PATH VARIABLES

PrintDBGVoid
PrintDBGMsg "Initializing "

# Script file's informations
__PROJECT_FILE=$(basename "$0")                           # Project file's name.
__PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')         # Name of the project (project file's name without its file extension).

# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.

# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
    __PROJECT_TMP_DIR="$__BASH_UTILS_TMP/$__PROJECT_NAME - ROOT"

else
    __PROJECT_TMP_DIR="$__BASH_UTILS_TMP/$__PROJECT_NAME"
fi

# Defining project's log file's path.
__PROJECT_LOG_DIR_NAME="logs"
__PROJECT_LOG_DIR_PATH="$__PROJECT_TMP_DIR/$__PROJECT_LOG_DIR_NAME"
__PROJECT_LOG_FILE_NAME="$__PROJECT_NAME.log"
__PROJECT_LOG_FILE_PATH="$__PROJECT_LOG_DIR_PATH/$__PROJECT_LOG_FILE_NAME"

PrintDBGVoid
exit 0

# -----------------------------------------------

## INITIALIZATION PATHS VARIABLES

# Bash-utils paths list variables (to check if every directories and files were successfully sourced). 
__INIT_FILE_LIST_NAME="Sourced.list"
__INIT_LIST_FILE_PATH="$__PROJECT_TMP_DIR/$__INIT_FILE_LIST_NAME"

# -----------------------------------------------

## PROJECT'S NAMED PIPES

# Defining project's FIFOs directory.
__PROJECT_FIFO_DIR_NAME="FIFO"
__PROJECT_FIFO_DIR_PATH="$__PROJECT_TMP_DIR/$__PROJECT_FIFO_DIR_NAME"

# Defining project's FIFOs
__PROJECT_FIFO_COLORS="$__PROJECT_FIFO_DIR_PATH/Colors"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : DEFINING INITIALIZATION FUNCTIONS

## TEXT PROCESSING FUNCTIONS

# This function is called at multiple times in the next function.
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
        echo >&2; echo "Error : the initializer log file's path is invalid." >&2; echo >&2; exit 1
    else
        if [ -z "$p_colorCode" ]; then
            __EchoInit "$p_str"
        else
            if [[ "$p_colorCode" =~ [0-9] ]]; then
                __EchoInit "$(tput setaf "$p_colorCode")$p_str$(tput sgr0)"
            else
                echo >&2; echo "The ${FUNCNAME[0]} color code must be an integer !" >&2; echo >&2; exit 1
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
    if [ -z "$p_msg" ] || [ -z "$p_lineno" ] || [ -z "$p_exit" ]; then
        InitErrMsg "No message, no line number or no exit value passed as argument !" "$(( LINENO-1 ))" "1"
    elif [ "$p_exit" -lt 0 ] || [ "$p_exit" -gt 1 ]; then
        InitErrMsg "Bad value passed as exit status !" "$(( LINENO-1 ))" "1"
    else
        echo >&2; echo "$(tput setaf 196)In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput setaf 196), line $(tput setaf 6)$p_lineno$(tput setaf 196) --> ERROR : $p_msg$(tput sgr0)" >&2; echo >&2
    fi
    
    if [ "$p_exit" -eq 0 ]; then
        return
    elif [ "$p_exit" -eq 1 ]; then
        exit 1
    fi
}

# Making the code cleaner in the 4th step (sourcing dependencies).
function EchoSourcedDependency
{
    #***** Parameters *****
    local p_dep=$1
    
    #***** Code *****
    EchoInit "Sourced file : $(tput setaf 6)$p_dep$(tput sgr0)" 2>&1 | tee -a "$__INIT_LIST_FILE_PATH"
}

# -----------------------------------------------

## CHECKINGS FUNCTIONS

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
        exit 1
    fi
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : CHECKING FOR ESSENTIAL DIRECTORIES

## PROCESSING THE BASH_UTILS INITIALIZATION LOG FILE AND THE PROJECT'S TEMPORARY FOLDER

# Clearing the sourced dependencies list file if already exists, or create the project's temporary directory if not exists.
if [ -f "$__INIT_LIST_FILE_PATH" ]; then
    true > "$__INIT_LIST_FILE_PATH" || { 
        echo >&2;
        echo "In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput sgr0), line $(( LINENO-2 )) --> Error : unable to"
        echo >&2; exit 1
    }
else
    if [ ! -d "$__PROJECT_TMP_DIR" ]; then
        EchoInit "CREATING THE PROJECT'S TEMPORARY DIRECTORY"
        EchoInit "$(mkdir -pv "$__PROJECT_TMP_DIR")" || {
            echo >&2
            echo "In $(tput setaf 6)$(basename "${BASH_SOURCE[0]}")$(tput sgr0), line $(( LINENO-2 )) --> Error : unable to create the project's temporary directory." >&2; echo >&2; exit 1
        }; EchoInit
    fi
    
    touch "$__INIT_LIST_FILE_PATH"
fi

# -----------------------------------------------

## CHECKING FOR THE REQUIRED FOLDERS

EchoInit "CHECKING FOR THE  \"$__PROJECT_NAME\"  REQUIRED DIRECTORIES"
CheckBURequirements "$__BASH_UTILS_BIN"           "$LINENO"
CheckBURequirements "$__BASH_UTILS_CONF"          "$LINENO"
CheckBURequirements "$__BASH_UTILS_TMP"           "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS"        "$LINENO"
CheckBURequirements "$__BASH_UTILS_FUNCTS_BASIS"  "$LINENO"
CheckBURequirements "$__BASH_UTILS_VARS"          "$LINENO"
EchoInit; EchoInit

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FOURTH STEP : PROCESSING DEPENDENCIES

## SOURCING DEPENDENCIES

# Tip : It's important to source the functions files before the variables ones to avoid error
# messages while including them at first, as some functions are called into these variables.

EchoInit "CHECKING FOR THE  \"$__PROJECT_NAME\"  DEPENDENCIES"

# Sourcing the project's status variables file.
EchoInit "Sourcing the variables status file :"

# shellcheck disable=SC1090
source "$__BASH_UTILS_CONF_PROJECT_STATUS" \
    || InitErrMsg "Unable to source this file : $(tput setaf 6)$__BASH_UTILS_CONF_PROJECT_STATUS" "$LINENO"
EchoSourcedDependency "$__BASH_UTILS_CONF_PROJECT_STATUS"; EchoInit


# Sourcing the very basic fuctions files.
EchoInit "Sourcing the very basic functions files :"; for f in "$__BASH_UTILS_FUNCTS_BASIS/"*.lib; do
    [[ -e "$f" ]] || InitErrMsg "This basic functions file doesn't exists : $(tput setaf 6)$f" "$LINENO" '1'
    
    # shellcheck disable=SC1090
    source "$f" || InitErrMsg "Unable to source this basic functions file : $(tput setaf 6)$f" "$LINENO" '1'
    EchoSourcedDependency "$f"
done; EchoInit

# Sourcing the main functions files.
EchoInit "Sourcing the main functions files :"; for f in "$__BASH_UTILS_FUNCTS/main/"*.lib; do
    [[ -e "$f" ]] || InitErrMsg "This main functions file doesn't exists : $(tput setaf 6)$f" "$LINENO"

    # shellcheck disable=SC1090
    source "$f" || InitErrMsg "Unable to source this main functions file : $(tput setaf 6)$f" "$LINENO"
    EchoSourcedDependency "$f"
done; EchoInit

# Sourcing the variables files.
EchoInit "Sourcing the variables files :"; for f in "$__BASH_UTILS_VARS/"*.var; do
    [[ -e "$f" ]] || InitErrMsg "This variables file doesn't exists : $(tput setaf 6)$f" "$LINENO"

    # shellcheck disable=SC1090
    source "$f" || InitErrMsg "Unable to source this variables file : $(tput setaf 6)$f" "$LINENO"
    EchoSourcedDependency "$f"
done; EchoInit

EchoInit

# -----------------------------------------------

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

# shellcheck disable=SC2034
__STAT_DEBUG="true";          CheckSTAT_DEBUG         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_ERROR="fatal";         CheckSTAT_ERROR         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_EXIT_CODE="1";         CheckSTAT_EXIT_CODE     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_LOG="true";            CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_LOG_REDIRECT="tee";    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# shellcheck disable=SC2034
__STAT_TIME_TXT="0";          CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"


# -----------------------------------------------

## CREATING THE FIFOs

EchoInit "PROCESSING THE  \"$__PROJECT_NAME\"  FIFOs"

# Color processing.
CreateFIFO "$__PROJECT_FIFO_COLORS"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIFTH STEP : PROCESSING PROJECT'S LOG FILE

## CREATING NEW VARIABLES

# shellcheck disable=SC2034
__PROJECT_PATH="$(GetParentDirectoryPath "$0")/$__PROJECT_FILE"

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
            Makedir "$__PROJECT_TMP_DIR" "$__PROJECT_LOG_DIR_NAME"
        fi

        Makefile "$__PROJECT_LOG_DIR_PATH" "$__PROJECT_LOG_FILE_NAME"
        echo "$__PROJECT_LOG_DIR_PATH/$__PROJECT_LOG_FILE_NAME"
        echo "$__PROJECT_LOG_FILE_PATH"
    fi
    
    # Redirecting files list into the log file.
    HeaderBlue "SOURCED FILES LOG OUTPUT"

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
    Newline
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "${__PROJECT_NAME^^}") !"
