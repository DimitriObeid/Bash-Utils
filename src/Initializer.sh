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

######################################## DEFINING VARIABLES #######################################

#### DEFINING BASH-UTILS GLOBAL VARIABLES

## BASH-UTILS PATHS

# Bash-Utils root directory path.
BASH_UTILS_ROOT="/usr/local/lib/Bash-utils"

# In case the Bash-Utils folder doesn't exists or is not located in the correct path.
if [ ! -d "$BASH_UTILS_ROOT" ]; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : the 'Bash-Utils' folder was not found in the '/usr/local/lib' folder"; exit 1
fi

# Bash-Utils sub-folders paths.
BASH_UTILS="$BASH_UTILS_ROOT/src"
BASH_UTILS_CONF="$BASH_UTILS_ROOT/config"

# "config" folder's content
BASH_UTILS_INIT_CONF_STATUS="$BASH_UTILS_CONF/InitStatus.conf"
BASH_UTILS_PROJECT_CONF_STATUS="$BASH_UTILS_CONF/ProjectStatus.conf"

# "src" folder's content.
BASH_UTILS_FUNCTS="$BASH_UTILS/functions"
BASH_UTILS_LANG="$BASH_UTILS/lang"
BASH_UTILS_VARS="$BASH_UTILS/variables"

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING PROJECT'S GLOBAL VARIABLES

## DEFINING PROJECT'S PATH

# Script file's informations
PROJECT_FILE=$(basename "$0")                           # Project file's name.
PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')         # Name of the project (project file's name without its file extension).

# -----------------------------------------------

## PROJECT'S INITIALIZATION LOG PATH

# Processing the initialization log file.

# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.

# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
	INITIALIZER_FILE_LOG_DIR="$BASH_UTILS_ROOT/tmp/$PROJECT_NAME - ROOT/logs"
	INITIALIZER_FILE_LOG_PATH="$INITIALIZER_FILE_LOG_DIR/$PROJECT_NAME - ROOT - init.log"
else
	INITIALIZER_FILE_LOG_DIR="$BASH_UTILS_ROOT/tmp/$PROJECT_NAME/logs"
	INITIALIZER_FILE_LOG_PATH="$INITIALIZER_FILE_LOG_DIR/$PROJECT_NAME - init.log"
fi

# Processing the project's log file
# shellcheck disable=SC2034
PROJECT_LOG_NAME="$PROJECT_NAME.log"

# shellcheck disable=SC2034
PROJECT_LOG_PARENT="$INITIALIZER_FILE_LOG_DIR"

# shellcheck disable=SC2034
PROJECT_LOG_PATH="$PROJECT_LOG_PARENT/$PROJECT_LOG_NAME"

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING FUNCTIONS #######################################

# Note : these functions have to be defined after defining all script's variables,
# as the variables cannot be called before their initialization, or else, they won't store any value.

#### DEFINING INITIALIZATION FUNCTIONS

## TEXT FUNCTIONS

# This function is used as debug to display the messages that should normally be redirected to the initializer log file.
function WriteInitLog
{
    #***** Parameters *****
    string=$1
    display=$2

    #***** Variables *****
    datelog="[$(date +"%Y-%m-%d %Hh-%Mm-%Ss")]"
    location="In ${BASH_SOURCE[0]}, line $lineno_stat -->"
    unable="$location Warning : Unable to write in the initializer's log file."
    incorrect="$location Error : the INITIALIZER_STATUS_LOG variable's value is incorrect."

    #***** Code *****
    if [ -n "$INITIALIZER_STATUS_LOG_CREATE" ]; then
        # If the "$INITIALIZER_STATUS_LOG" variable contains a value AND no value are passed as second argument.
        if [ -z "$display" ]; then
            if [ -z "$INITIALIZER_STATUS_LOG_REDIRECT" ]; then
                echo "$string"

            # If the "$INITIALIZER_STATUS_LOG" variable's value is equal to "log", then the string passed as first argument is redirected towards the initializer process's log path.
            elif [ "$INITIALIZER_STATUS_LOG_REDIRECT" = "log" ]; then
                if [ -n "$string" ]; then
                    # I had a case of impossbility to redirect the outputs to the initialization file's log file because of a write permission issue,
                    # so I added this failsafe in case of impossbility to write into this file, so there won't be any "permission error" messages written at each initialization step.
                    echo "$datelog $string" >> "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                else
                    echo "$string" >> "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                fi
                
            # Else, if the "$INITIALIZER_STATUS_LOG" variable's value is equal to "tee", then the string passed as first argument is redirected towards the terminal AND the initializer process's log path, with the date and the hour written before the message.
            elif [ "$INITIALIZER_STATUS_LOG_REDIRECT" = "tee" ]; then
                if [ -n "$string" ]; then
                    echo "$datelog $string" >> "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                else
                    echo "$string" >> "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                fi; echo "$string"

            else
                lineno_stat=$LINENO; echo "$incorrect"; exit 1
            fi; return
            
        # Else, if the "$INITIALIZER_STATUS_LOG" variable contains a value AND a value of '1' is passed as second argument.
        # This statement forces the displaying of a message if the "$display" argument is passed,
        # especially to display an error message if an error occured during the initialization process.
        elif [ "$display" -eq 1 ]; then
            if [ -z "$INITIALIZER_STATUS_LOG_REDIRECT" ]; then
                echo "$string"
            elif [ "$INITIALIZER_STATUS_LOG_REDIRECT" = "log" ] || [ "$INITIALIZER_STATUS_LOG_REDIRECT" = "tee" ]; then
                if [ -n "$string" ]; then
                    echo "$datelog $string" >> "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                else
                    echo "$string" >> "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                fi; echo "$string"
            else
                lineno_stat=$LINENO; echo "$incorrect"
                echo "$datelog $incorrect" >> "$INITIALIZER_FILE_LOG_PATH"; exit 1
            fi; return

        # This statement doesn't print the date in the initialization process's log file, before the string passed as argument.
        # This statement is useful to display some text decoration without displaying the display's date.
        elif [ "$display" -eq 2 ]; then
            if [ -z "$INITIALIZER_STATUS_LOG_REDIRECT" ]; then
                echo "$string"
            elif [ "$INITIALIZER_STATUS_LOG_REDIRECT" = "log" ] || [ "$INITIALIZER_STATUS_LOG_REDIRECT" = "tee" ]; then
                if [ -n "$string" ] || [ -z "$string" ]; then
                    echo "$string" 2>&1 | tee -a "$INITIALIZER_FILE_LOG_PATH" || { lineno_stat=$LINENO; echo "$unable"; exit 1; }
                fi
            else
                lineno_stat=$LINENO; echo "$incorrect"
                echo "$datelog $incorrect" >> "$INITIALIZER_FILE_LOG_PATH"; exit 1
            fi
        fi
    else
        echo "$string"
    fi
}

# -----------------------------------------------

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

# Sourcing dependencies
function SourceFile
{
    #***** Parameters *****
    local path=$1
    local info=$2
    local lineno=$3

    #***** Code *****
    if [ -z "$info" ]; then
        # shellcheck disable=SC1090
        if source "$path"; then
            WriteInitLog "Sourced file : $path"
        else
            WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno --> $path : Unable to source this file" "1"; WriteInitLog "" "1"
            exit 1
        fi
    else
        # shellcheck disable=SC1090
        if source "$path"; then
            WriteInitLog "Sourced file : $path"
        else
            WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno --> $path : Unable to source the $info" "1"; WriteInitLog "" "1"
            exit 1
        fi
    fi
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

####################################### VARIABLES CHECKINGS #######################################

#### CHECKING

## PROJECT STATUS VARIABLES

# Sourcing the confinguration file.
# lineno=$LINENO; WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno : SOURCING $BASH_UTILS_CONF_STATUS"

# shellcheck disable=SC1090
if ! source "$BASH_UTILS_INIT_CONF_STATUS"; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : unable to source the project initialization's file variables status configuration file"
fi

# -----------------------------------------------

## LOG FILE
if [ "$INITIALIZER_STATUS_LOG_CREATE" != "true" ] && [ "$INITIALIZER_STATUS_LOG_CREATE" != "false" ]; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : The INITIALIZER_FILE_LOG_CREATE status variable's value is incorrect"
    exit 1
elif [ "$INITIALIZER_STATUS_LOG_CREATE" = "true" ]; then
    if [ ! -f "$INITIALIZER_FILE_LOG_PATH" ]; then
        if [ ! -d "$INITIALIZER_FILE_LOG_DIR" ]; then
            mkdir -pv "$INITIALIZER_FILE_LOG_DIR"
            echo
        fi

        WriteInitLog "$(touch "$INITIALIZER_FILE_LOG_PATH")"
    fi
fi

# Checking if the initialization log file exists AND is not empty, to overwrite its content.
if [ -f "$INITIALIZER_FILE_LOG_PATH" ] && [ -s "$INITIALIZER_FILE_LOG_PATH" ]; then
    true > "$INITIALIZER_FILE_LOG_PATH"
fi

# Checking the existence of the main script file's path by checking "$PROJECT_PATH" variable value.
PROJECT_PATH="$(GetProjectParentPath)/$PROJECT_FILE"    # File path.

lineno=$LINENO; if [ -z "$PROJECT_PATH" ]; then
    WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno : No path provided in the PROJECT_PATH variable in $PROJECT_PATH" "1"; exit 1
lineno=$LINENO; elif [ ! -f "$PROJECT_PATH" ]; then
    WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno : Incorrect path provided as value for the PROJECT_PATH variable in $PROJECT_PATH" "1"
    WriteInitLog "Current content : $PROJECT_PATH" "1"; exit 1
fi

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### PROCESSING INITIALIZATION ####################################

#### SOURCING DEPENDENCIES STEP BY STEP

## CHECKING SUB-FOLDERS PRESENCE

WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : CHECKING FOR BASH-UTILS SUB-FOLDERS"
CheckSubFolder "$BASH_UTILS_LANG"
CheckSubFolder "$BASH_UTILS_FUNCTS"
CheckSubFolder "$BASH_UTILS_VARS"
WriteInitLog

# -----------------------------------------------

## SOURCING DEPENDENCIES

# Sourcing functions files first to avoid error messages while including the variables first, as some functions are called into these variables.
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : SOURCING BASH-UTILS FUNCTIONS FILES TO $PROJECT_NAME"; for f in "$BASH_UTILS_FUNCTS/"*.lib; do
    SourceFile "$f" "functions file" "$LINENO"
done; WriteInitLog


# Source the functions and variables linker file first,
# as some messages contain function call (from the library files) to color some parts of this message in another color.
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : SOURCING BASH-UTILS VARIABLES FILES TO $PROJECT_NAME"; for f in "$BASH_UTILS_VARS/"*.var; do
    SourceFile "$f" "variables file" "$LINENO"
done; WriteInitLog; WriteInitLog

# -----------------------------------------------

## SOURCING TRANSLATION FILES

# shellcheck source="$MAIN_PROJECT_ROOT/$MAIN_LANG/SetLibLang.sh"
#WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO : DEFINING BASH-UTILS LIBRARY LANGUAGE" \
#   && SourceFile "$BASH_UTILS_LANG/SetLibLang.sh" "library language defining file" "$LINENO"
# WriteInitLog; WriteInitLog

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### END OF THE INITIALIZER FILE

WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"
WriteInitLog "END OF THE LIBRARY INITIALIZATION PROCESS, PROCESSING $(Decho "${PROJECT_NAME^^}")'S PROJECT RESOURCES NOW";
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"; WriteInitLog

# shellcheck disable=SC1090
if ! source "$BASH_UTILS_PROJECT_CONF_STATUS"; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : unable to source the $PROJECT_NAME's file variables status configuration file."
    exit 1
else
    WriteInitLog "Successfully sourced the $PROJECT_NAME's file variables status configuration file."
    WriteInitLog
fi
