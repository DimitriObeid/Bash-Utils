#!/usr/bin/env bash

# Script initializer file, initalizing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################## DEFINING MAIN SCRIPT VARIABLES #################################

#### DEFINING BASH-UTILS DIRECTORY PATH, SUB-FOLDERS AND FILES

## PREVENTING THE DIRECT EXECUTION OF THIS INITALIZER FILE

if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then 
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo
    
    exit 1
fi

# -----------------------------------------------

## BASH-UTILS PATH

# Bash-Utils root directory path
BASH_UTILS_ROOT="/usr/local/lib/Bash-Utils"

# In case the Bash-Utils folder doesn't exists or is not located in the correct path
if [ ! -d "$BASH_UTILS_ROOT" ]; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : the 'Bash-Utils' folder was not found in the '/usr/local/lib' folder"; exit 1
fi

# Bash-Utils sub-folders

BASH_UTILS_SRC="$BASH_UTILS_ROOT/src"

BASH_UTILS_FUNCTS="$BASH_UTILS_SRC/functions"
BASH_UTILS_LANG="$BASH_UTILS_SRC/lang"
BASH_UTILS_VARS="$BASH_UTILS_SRC/variables"

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING PROJECT SCRIPT DIRECTORY PATH, SUB-FOLDERS AND FILES

## PROJECT PATH

# Checking the existence of the main script file's path by checking "$PROJECT_PATH" variable value.
lineno=$LINENO; if [ -z "$PROJECT_PATH" ]; then
    echo "In ${BASH_SOURCE[0]}, line $lineno : No path provided in the PROJECT_PATH variable in $(basename "$0")"; exit 1
lineno=$LINENO; elif [ ! -f "$PROJECT_PATH" ]; then
    echo "In ${BASH_SOURCE[0]}, line $lineno : Incorrect path provided as value for the PROJECT_PATH variable in $(basename "$0")";
    echo "Current content : $PROJECT_PATH"; exit 1
fi

# -----------------------------------------------

## PROJECT FILES

# Creating the initialization log file.
INITIALIZER_LOG_PATH="$BASH_UTILS_ROOT/tmp/init $(basename "$0" | cut -f 1 -d '.').log"

# Checking if the initialization log file exists AND is not empty, to overwrite its content.
if [ -f "$INITIALIZER_LOG_PATH" ] && [ -s "$INITIALIZER_LOG_PATH" ]; then
    true > "$INITIALIZER_LOG_PATH"
fi

# This function is used as debug to display the messages that should normally be redirected to the log file.
function WriteInitLog()
{
    #***** Parameters *****
    local string=$1
    
    #***** Variables *****
    initlog_status="tee"
    
    #***** Code *****
    if [ -n "$initlog_status" ]; then
        if [ "$initlog_status" = "log" ]; then
            echo "$string" >> "$INITIALIZER_LOG_PATH"
        elif [ "$initlog_status" = "tee" ]; then
            echo "$string" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
        else
            echo "In ${BASH_SOURCE[0]}, in WriteInitLog function --> Error : the initlog_status variable's value is not correct"; exit 1
        fi
    else
        echo "In ${BASH_SOURCE[0]}, in WriteInitLog function --> Error : the initlog_status variable must contain a value"; exit 1
    fi
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### CHECKING REQUIRMENTS AND FAILSAFE

## CHECKING SUB-FOLDERS PRESENCE

# Function checking if the project's sub-folders paths passed as argument exist
function CheckSubFolder()   
{
    #***** Parameters *****
    local path=$1;

    #***** Code *****
    if [ -d "$path" ]; then
        WriteInitLog "Existing sub-folder : $path"
    else
        echo "FATAL : Cannot source $path, abort"; exit 1
    fi
}

WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : CHECKING FOR BASH-UTILS SUB-FOLDERS"
CheckSubFolder "$BASH_UTILS_LANG"
CheckSubFolder "$BASH_UTILS_FUNCTS"
CheckSubFolder "$BASH_UTILS_VARS"; WriteInitLog

# -----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

###################################### INCLUDING DEPENDENCIES #####################################

#### SOURCING FILES

## SOURCING FILES FUNCTIONS

function SourceFile()
{
    #***** Parameters *****
    local path=$1
    local info=$2
    local lineno=$3
    
    #***** Code *****
    
    if [ -z "$info" ]; then
        if source "$path"; then
            WriteInitLog "Sourced file : $path"
        else
            echo "In ${BASH_SOURCE[0]}, line $lineno --> $path : Unable to source this file"; echo
            exit 1
        fi
    else
        if source "$path"; then
            WriteInitLog "Sourced file : $path"
        else
            echo "In ${BASH_SOURCE[0]}, line $lineno --> $path : Unable to source the $info"; echo
            exit 1
        fi
    fi
    
}

# -----------------------------------------------

## SOURCING VARIABLES AND FUNCTIONS FILES

# Source the functions and variables linker file first to avoid error messages while including the language files first,
# as some messages contain function call (from the library files) to color some parts of this message in another color.
echo "In ${BASH_SOURCE[0]}, line $LINENO : LINKING BASH-UTILS LIBRARY FILES TO $(basename "$0" | cut -f 1 -d '.')" \
    && SourceFile "$BASH_UTILS_SRC/LinkFnctsVars.sh" "library linker file" "$LINENO"
WriteInitLog; WriteInitLog
    
# -----------------------------------------------

## SOURCING TRANSLATION FILES

# shellcheck source="$MAIN_PROJECT_ROOT/$MAIN_LANG/SetLibLang.sh"
echo "In ${BASH_SOURCE[0]}, line $LINENO : DEFINING BASH-UTILS LIBRARY LANGUAGE" \
    && SourceFile "$BASH_UTILS_SRC/SetLibLang.sh" "library language defining file" "$LINENO"
WriteInitLog; WriteInitLog

# -----------------------------------------------
