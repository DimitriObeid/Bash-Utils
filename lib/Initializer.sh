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

## BASH-UTILS PATHS

# Bash-Utils root directory path.
BASH_UTILS_ROOT="/usr/local/lib/Bash-utils"

# Bash-Utils sub-folders paths.
BASH_UTILS="$BASH_UTILS_ROOT/lib"
BASH_UTILS_BIN="$BASH_UTILS_ROOT/bin"
BASH_UTILS_CONF="$BASH_UTILS_ROOT/config"
BASH_UTILS_TMP="$BASH_UTILS_ROOT/tmp"

# "config" folder's content.
BASH_UTILS_CONF_PROJECT_STATUS="$BASH_UTILS_CONF/ProjectStatus.conf"

# "lib" folder's content.
BASH_UTILS_FUNCTS="$BASH_UTILS/functions"
BASH_UTILS_FUNCTS_BASIS="$BASH_UTILS_FUNCTS/basis"
BASH_UTILS_LANG="$BASH_UTILS/lang"
BASH_UTILS_VARS="$BASH_UTILS/variables"


# -----------------------------------------------

## PROJECT'S PATHS

# Script file's informations
PROJECT_FILE=$(basename "$0")                           # Project file's name.
PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')         # Name of the project (project file's name without its file extension).

# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.

# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
    PROJECT_TMP_DIR="$BASH_UTILS_TMP/$PROJECT_NAME - ROOT"
    PROJECT_LOG_NAME="$PROJECT_NAME - ROOT.log"
else
    PROJECT_TMP_DIR="$BASH_UTILS_TMP/$PROJECT_NAME"
    PROJECT_LOG_NAME="$PROJECT_NAME.log"
fi

# Defining project's log file's path.
PROJECT_LOG_PARENT_NAME="logs"
PROJECT_LOG_PARENT_PATH="$PROJECT_TMP_DIR/$PROJECT_LOG_PARENT_NAME"
PROJECT_LOG_PATH="$PROJECT_LOG_PARENT_PATH/$PROJECT_LOG_NAME"

# -----------------------------------------------

## OTHER PATHS VARIABLES

# Bash-utils paths list variables (to check if every directories and files were successfully sourced). 
INIT_FILE_LIST_NAME="Sourced.list"
INIT_LIST_FILE_PATH="$PROJECT_TMP_DIR/$INIT_FILE_LIST_NAME"

# -----------------------------------------------

## OTHER VARIABLES


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : DEFINING INITIALIZATION FUNCTIONS

# Controlling all the redirections in a single place for a better debugging process.
function EchoDBG
{
    if [ -z "$INIT_LIST_FILE_PATH" ] || [ ! -f "$INIT_LIST_FILE_PATH" ]; then
        echo; echo "Error : the initializer log file's path is invalid."; echo; exit 1
    else
        echo "$1" >> "$INIT_LIST_FILE_PATH"
    fi
}

# Defining the error message's beginning and end.
function InitErrMsg
{
    #***** Parameters *****
    msg=$1
    
    #***** Code *****
    EchoDBG "$(tput setaf 196)In ${BASH_SOURCE[0]} --> ERROR : $msg$(tput sgr0)"; EchoDBG
    exit 1
}

# Finding Bash-utils directories.
function CheckBURequirements
{
    #***** Parameters *****
    path=$1
    
    #***** Code *****
    # If the path points towards a directory.
    if [ -d "$path" ]; then
        EchoDBG "Found directory : $(tput setaf 6)$path$(tput sgr0)"
        
    # Else, if the path points towards a file.
    elif [ -f "$path" ]; then
        EchoDBG "Found file : $(tput setaf 6)$path$(tput sgr0)"
    else
        InitErrMsg "The following path is incorrect : $path" 2>&1 | tee -a "$INIT_LIST_FILE_PATH"
        exit 1
    fi
}

# Making the code cleaner in the 4th part (sourcing dependecies).
function EchoSourcedDependency
{
    #***** Parameters *****
    dep=$1
    
    #***** Code *****
    EchoDBG "Sourced file : $(tput setaf 6)$dep$(tput sgr0)" 2>&1 | tee -a "$INIT_LIST_FILE_PATH"
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : CHECKING FOR ESSENTIAL DIRECTORIES

# Clearing the sourced directories list file if already exists, or create the project's temporary directory if not exists.
if [ -f "$INIT_LIST_FILE_PATH" ]; then
    true > "$INIT_LIST_FILE_PATH"
else
    if [ ! -d "$PROJECT_TMP_DIR" ]; then
        mkdir "$PROJECT_TMP_DIR" || echo "In ${BASH_SOURCE[0]}, line $(( LINENO-1 )) --> Error : unable to create the project's temporary directory." 2>&1 | tee -a "$INIT_LIST_FILE_PATH"
    fi
    
    touch "$INIT_LIST_FILE_PATH"
fi

EchoDBG "CHECKING REQUIRED DIRECTORIES"
CheckBURequirements "$BASH_UTILS_BIN" "$LINENO"
CheckBURequirements "$BASH_UTILS_CONF" "$LINENO"
CheckBURequirements "$BASH_UTILS_TMP" "$LINENO"
CheckBURequirements "$BASH_UTILS_FUNCTS" "$LINENO"
CheckBURequirements "$BASH_UTILS_FUNCTS_BASIS" "$LINENO"
CheckBURequirements "$BASH_UTILS_VARS" "$LINENO"
EchoDBG

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FOURTH STEP : PROCESSING DEPENDENCIES

## SOURCING DEPENDENCIES

# Tip : It's important to source the functions files before the variables ones to avoid error
# messages while including them at first, as some functions are called into these variables.

EchoDBG "CHECKING DEPENDENCIES"

# Sourcing project's status variables file.
EchoDBG "Sourcing the variables status file :"; source "$BASH_UTILS_CONF_PROJECT_STATUS" \
    || InitErrMsg "Unable to source this file : $(tput setaf 6)$BASH_UTILS_CONF_PROJECT_STATUS"
EchoSourcedDependency "$BASH_UTILS_CONF_PROJECT_STATUS"; EchoDBG

# Sourcing the very basic fuctions files.
EchoDBG "Sourcing the very basic functions files :"; for f in $(ls -R "$BASH_UTILS_FUNCTS_BASIS/"*.lib); do source "$f" \
    || InitErrMsg "Unable to source this basic functions file : $(tput setaf 6)$f"
    EchoSourcedDependency "$f"
done; EchoDBG

# Sourcing the main functions files.
EchoDBG "Sourcing the main functions files :"; for f in $(ls -R "$BASH_UTILS_FUNCTS/"*.lib); do source "$f" \
    || InitErrMsg "Unable to source this main functions file : $(tput setaf 6)$f"
    EchoSourcedDependency "$f"
done; EchoDBG

# Sourcing the variables files.
EchoDBG "Sourcing the variables files :"; for f in "$BASH_UTILS_VARS/"*.var; do source "$f" \
    || InitErrMsg "Unable to source this variables file : $(tput setaf 6)$f"
    EchoSourcedDependency "$f"
done; EchoDBG

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PROCESSING PROJECT'S LOG FILE

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS.

STAT_LOG="true";            CheckSTAT_LOG
STAT_LOG_REDIRECT="log";    CheckSTAT_LOG_REDIRECT
STAT_ERROR="fatal";         CheckSTAT_ERROR
STAT_TIME_HEADER="0";       CheckSTAT_TIME_HEADER
STAT_TIME_TXT="0";          CheckSTAT_TIME_TXT

# -----------------------------------------------

## PROCESSING THE LOG FILE

# Creating or overwritting the paths list file.
if [ "$STAT_LOG" = "true" ]; then
    if [ -f "$PROJECT_LOG_PATH" ]; then
        if [ -s "$PROJECT_LOG_PATH" ]; then
            true > "$PROJECT_LOG_PATH"
        fi
    else
        if [ ! -d "$PROJECT_LOG_PARENT_PATH" ]; then
            Makedir "$PROJECT_TMP_DIR" "$PROJECT_LOG_PARENT_NAME"
        fi

        Makefile "$PROJECT_LOG_PARENT_NAME" "$PROJECT_LOG_NAME"
        echo "$PROJECT_LOG_PARENT_PATH/$PROJECT_LOG_NAME"
        echo "$PROJECT_LOG_PATH"
    fi
    
    # Redirecting files list into the log file.
    {
        HeaderBlue "SOURCED FILES LOG OUTPUT"
        Newline
        
        cat "$INIT_LIST_FILE_PATH"

        # Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Linux distribution.
        HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM"

        # Getting operating system family.
        EchoNewstep "Operating system family :$(tput sgr0) $OSTYPE"
        Newline

        # Gathering OS informations from the "/etc/os-release" file.
        EchoNewstep "Operating system general informations :"
        EchoMsg "$(cat "/etc/os-release")"
        Newline

        EchoNewstep "Bash version :$(tput sgr0) $BASH_VERSION"
        Newline

        EchoSuccess "Successfully got the user's system's informations."
        Newline
    } >> "$PROJECT_LOG_PATH"
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

HeaderGreen "END OF LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING PROJECT'S SCRIPT $(DechoGreen "${PROJECT_NAME^^}") !" >> "$PROJECT_LOG_PATH"
