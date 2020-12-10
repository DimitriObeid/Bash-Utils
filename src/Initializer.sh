#!/usr/bin/env bash

# Script initializer file, initializing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

####################################### INITIALIZING PROJECT ######################################

#### DEFINING INITIALIZATION FUNCTIONS

## FILES AND FOLDERS PROCESSING

# Checking if the project's sub-folders paths passed as argument exist
function CheckSubFolder
{
    #***** Parameters *****
    local path=$1;

    #***** Code *****
    if [ -d "$path" ]; then
        WriteInitLog "Existing sub-folder : $path"
    else
        WriteInitLog "FATAL : Cannot source $path, abort" "1"; exit 1
    fi
}

# Getting project's parent folder's path
function GetProjectParentPath
{
    parent="$( cd "$(dirname "$0")" >/dev/null 2>&1 || { WriteInitLog "Unable to get the project's parent directory, abort." "1"; exit 1; }; pwd -P )"
    dirname="$parent"
    
    shopt -s extglob           # enable +(...) glob syntax
    result=${dirname%%+(/)}    # trim however many trailing slashes exist
    echo "$result"
}

# -----------------------------------------------

## TEXT FUNCTIONS

# This function is used as debug to display the messages that should normally be redirected to the initializer log file.
function WriteInitLog
{
    #***** Parameters *****
    string=$1
    display=$2

    #***** Variables *****
    lineno_stat=$LINENO; initlog_status="tee"
    datelog="[$(date +"%Y-%m-%d %Hh-%Mm-%Ss")]"
    location="In ${BASH_SOURCE[0]}, line $lineno_stat -->"
    incorrect="Error : the initlog_status variable's value is incorrect"
    novalue="Error : the initlog_status variable must contain a value"

    #***** Code *****
    # If a string is passed as first argument AND the "$initlog_status" variable contains a value AND no value are passed as second argument.
    if [ -n "$string" ] && [ -n "$initlog_status" ] && [ -z "$display" ]; then
        # If the "$initlog_status" variable's value is equal to "log", then the string passed as first argument is redirected towards the initializer process's log path.
        if [ "$initlog_status" = "log" ]; then
            echo "$datelog $string" >> "$INITIALIZER_LOG_FILE_PATH"
        # Else, if the "$initlog_status" variable's value is equal to "tee", then the string passed as first argument is redirected towards the terminal AND the initializer process's log path, with the date and the hour written before the message.
        elif [ "$initlog_status" = "tee" ]; then
            echo "$string"
            echo "$datelog $string" >> "$INITIALIZER_LOG_FILE_PATH"
        else
            echo "$location $incorrect"
            echo "$datelog $location $incorrect"; exit 1
        fi
    
    # Else, if a string is passed as first argument AND the "$initlog_status" variable contains one of the two awaited values AND a value of '1' is passed as second argument,
    # then the string passed as first argument is redirected towards the terminal AND the initializer process's log path, with the date and the hour written before the message.
    # This statement forces the displaying of a message if the "$display" argument is passed, especially to display an error message if an error occured during the initialization process.
    elif [ -n "$string" ] && [ -n "$initlog_status" ] && [ "$initlog_status" = "log" ] || [ "$initlog_status" = "tee" ] \
        && [ -n "$display" ] && [ "$display" -eq 1 ]; then
        echo "$string"
        echo "$datelog $string" >> "$INITIALIZER_LOG_FILE_PATH"
    
    # Else, if a string is passed as first argument AND the "$initlog_status" variable contains one of the two awaited values AND a value of '2' is passed as second argument.
    # This statement does the same thing than before, except the fact that it doesn't print the date before the string passed as argument, in the initialization process's log file.
    # This statement is useful to display some text decoration without displaying the display's date.
    elif [ -n "$string" ] && [ -n "$initlog_status" ] && [ "$initlog_status" = "log" ] || [ "$initlog_status" = "tee" ] \
        && [ -n "$display" ] && [ "$display" -eq 2 ]; then
        echo "$string" 2>&1 | tee -a "$INITIALIZER_LOG_FILE_PATH"
    
    # Else, if no value is passed as first argument (which means that no other arguments are passed) AND a value is contained in the "$initlog_status" variable,
    # then a line break is performed.
    elif [ -z "$string" ] && [ -n "$initlog_status" ] && [ "$initlog_status" = "log" ] || [ "$initlog_status" = "tee" ]; then
        echo 2>&1 | tee -a "$INITIALIZER_LOG_FILE_PATH"
    else
        echo "$location $novalue"
        echo "$datelog $location $novalue" >> "$INITIALIZER_LOG_FILE_PATH"; exit 1
    fi
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING BASH-UTILS LIBRARY'S DIRECTORY PATHS, SUB-FOLDERS AND FILES

## BASH-UTILS PATHS

# Bash-Utils root directory path
BASH_UTILS_ROOT="/usr/local/lib/Bash-Utils"

# In case the Bash-Utils folder doesn't exists or is not located in the correct path
if [ ! -d "$BASH_UTILS_ROOT" ]; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : the 'Bash-Utils' folder was not found in the '/usr/local/lib' folder"; exit 1
fi

# Bash-Utils sub-folders
BASH_UTILS="$BASH_UTILS_ROOT/src"

BASH_UTILS_FUNCTS="$BASH_UTILS/functions"
BASH_UTILS_LANG="$BASH_UTILS/lang"
BASH_UTILS_VARS="$BASH_UTILS/variables"

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING THE PROJECT SCRIPT'S INFORMATIONS, SUCH AS ITS NAME, ITS PARENT DIRECTORY PATH AND ITS SUB-FOLDERS AND FILES

## PROJECT'S INITIALIZATION LOG PATH

# Creating the initialization log file.
INITIALIZER_LOG_FILE_DIR="$BASH_UTILS_ROOT/tmp/$(basename "$0" | cut -f 1 -d '.')/logs/"
INITIALIZER_LOG_FILE_PATH="$INITIALIZER_LOG_FILE_DIR/$(basename "$0" | cut -f 1 -d '.') - $(date +"%Y-%m-%d %Hh-%Mm-%Ss") - init.log"

if [ ! -d "$INITIALIZER_LOG_FILE_DIR" ]; then
    WriteInitLog "$(mkdir -pv "$INITIALIZER_LOG_FILE_DIR")"
    WriteInitLog
fi

# Checking if the initialization log file exists AND is not empty, to overwrite its content.
if [ -f "$INITIALIZER_LOG_FILE_PATH" ] && [ -s "$INITIALIZER_LOG_FILE_PATH" ]; then
    true > "$INITIALIZER_LOG_FILE_PATH"
fi

# -----------------------------------------------

## DEFINING PROJECT'S PATH

# Script file's informations
PROJECT_FILE=$(basename "$0")                           # Name of the file
PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')         # Name of the project (filename without the file extension)
PROJECT_PATH="$(GetProjectParentPath)/$PROJECT_FILE"    # File path

# Checking the existence of the main script file's path by checking "$PROJECT_PATH" variable value.
lineno=$LINENO; if [ -z "$PROJECT_PATH" ]; then
    WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno : No path provided in the PROJECT_PATH variable in $PROJECT_PATH" "1"; exit 1
lineno=$LINENO; elif [ ! -f "$PROJECT_PATH" ]; then
    WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno : Incorrect path provided as value for the PROJECT_PATH variable in $PROJECT_PATH" "1"
    WriteInitLog "Current content : $PROJECT_PATH" "1"; exit 1
fi

# -----------------------------------------------

## PROJECT FILES

# Project's main log file informations
PROJECT_LOG_NAME="$PROJECT_NAME $TIME_DATE.log"
PROJECT_LOG_PATH="$INITIALIZER_LOG_FILE_DIR/$PROJECT_FILE_NAME"
PROJECT_LOG_STATUS=""

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### CHECKING REQUIRMENTS AND FAILSAFE

## CHECKING SUB-FOLDERS PRESENCE

WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : CHECKING FOR BASH-UTILS SUB-FOLDERS"
CheckSubFolder "$BASH_UTILS_LANG"
CheckSubFolder "$BASH_UTILS_FUNCTS"
CheckSubFolder "$BASH_UTILS_VARS"
WriteInitLog

# -----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

###################################### INCLUDING DEPENDENCIES #####################################

#### SOURCING FILES

## SOURCING FILES FUNCTIONS

function SourceFile
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
            WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno --> $path : Unable to source this file" "1"; WriteInitLog "" "1"
            exit 1
        fi
    else
        if source "$path"; then
            WriteInitLog "Sourced file : $path"
        else
            WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno --> $path : Unable to source the $info" "1"; WriteInitLog "" "1"
            exit 1
        fi
    fi
}

# -----------------------------------------------

## SOURCING VARIABLES AND FUNCTIONS FILES


# Sourcing functions files first to avoid error messages while including the variables first, as some functions are called into these variables.
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : LINKING BASH-UTILS FUNCTIONS FILES TO $PROJECT_NAME"; for f in "$BASH_UTILS_FUNCTS/"*.lib; do
    SourceFile "$f" "functions file" "$LINENO"
done; WriteInitLog


# Source the functions and variables linker file first ,
# as some messages contain function call (from the library files) to color some parts of this message in another color.
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : LINKING BASH-UTILS VARIABLES FILES TO $PROJECT_NAME"; for f in "$BASH_UTILS_VARS/"*.var; do
    SourceFile "$f" "variables file" "$LINENO"
done; WriteInitLog; WriteInitLog

# -----------------------------------------------

## SOURCING TRANSLATION FILES

# shellcheck source="$MAIN_PROJECT_ROOT/$MAIN_LANG/SetLibLang.sh"
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : DEFINING BASH-UTILS LIBRARY LANGUAGE" \
    && SourceFile "$BASH_UTILS_LANG/SetLibLang.sh" "library language defining file" "$LINENO"
WriteInitLog; WriteInitLog

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### END OF THE INITIALIZER FILE

WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"
WriteInitLog "END OF THE LIBRARY INITIALIZATION PROCESS, PROCESSING $(Decho "${PROJECT_NAME^^}")'S PROJECT RESOURCES NOW";
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"; WriteInitLog
