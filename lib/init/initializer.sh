#!/usr/bin/env bash

# Script initializer file, initalizing all you need for your scripts.
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################## DEFINING MAIN SCRIPT VARIABLES #################################

#### DEFINING BASH-UTILS DIRECTORY PATH, SUB-FOLDERS AND FILES

## BASH-UTILS ROOT PATH

# Bash-Utils root directory path
BASH_UTILS_ROOT="/usr/local/bin/Bash-Utils"

# In case the Bash-Utils folder doesn't exists or is not located in the correct path
if [ ! -d "$BASH_UTILS_ROOT" ]; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : the 'Bash-Utils' folder was not found in the '/usr/local/bin' folder"; exit 1
fi

# -----------------------------------------------

## BASH-UTILS SUB-FOLDERS

BASH_UTILS_LIB_FUNCTS="$BASH_UTILS_ROOT/lib/functions"
BASH_UTILS_LIB_LANG="$BASH_UTILS_ROOT/lang"
BASH_UTILS_LIB_VARS="$BASH_UTILS_ROOT/lib/variables"

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING PROJECT SCRIPT DIRECTORY PATH, SUB-FOLDERS AND FILES

## PREVENTING THE DIRECT EXECUTION OF THIS INITALIZER FILE

if [ ${0##*/} == ${BASH_SOURCE[0]##*/} ]; then 
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo
    exit 1
fi

# -----------------------------------------------

## SCRIPT ROOT PATH

# Checking for the "$PROJECT_ACCEESIBILITY" variable value.
lineno=$LINENO; if [ -z "$PROJECT_ACCEESIBILITY" ]; then
    echo "In ${BASH_SOURCE[0]}, line $lineno : No accessibility value provided in the PROJECT_ACCEESIBILITY variable in $(basename "$0")"
lineno=$LINENO; elif [ "$PROJECT_ACCEESIBILITY" != "private" ] || [ "$PROJECT_ACCEESIBILITY" != "public" ]; then
    echo "In ${BASH_SOURCE[0]}, line $lineno : Incorrect accessibility value provided in the PROJECT_ACCESSIBILITY variable in $(basename "$0")"
fi

# Defining script's root path
INITIALIZER_SRC_ROOT="$BASH_UTILS_ROOT/src/$PROJECT_ACCEESIBILITY/$(basename "$0" | cut -f 1 -d '.')"  # Cutting the eventual file extension to match with the project directory's name in the "src/<accessibility>" folder.

# Checking if the script's sources folder exists
lineno=$LINENO ;if [ ! -d "$INITIALIZER_SRC_ROOT" ]; then
    echo "In ${BASH_SOURCE[0]}, line $lineno --> Error : The main script's resources source folder
        '/usr/local/bin/Bash-Utils/src/$PROJECT_ACCEESIBILITY/$(basename "$0" | cut -f 1 -d '.')' doesn't exists"; exit 1 
fi

# Checking if the main script is located if the "/usr/local/bin/Bash-Utils/src/<accessibility>/<script name>" to make sure it will be executed by its ".desktop" file
lineno=$LINENO; if [ ! -f "$INITIALIZER_SRC_ROOT/$(basename "$0")" ]; then
    echo "In ${BASH_SOURCE[0]}, line $lineno --> Error : the '$(basename "$0")' file doesn't exists in the '$INITIALIZER_SRC_ROOT' folder"; exit 1
fi

if [ -f "$INITIALIZER_LOG_PATH" ]; then
    true > "$INITIALIZER_LOG_PATH"
fi

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
        echo "Existing sub-folder : $path" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
    else
        echo "FATAL : Cannot include $path, abort"; exit 1
    fi
}

echo "In ${BASH_SOURCE[0]}, line $LINENO : CHECKING FOR BASH-UTILS SUB-FOLDERS" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
CheckSubFolder "$BASH_UTILS_LIB_LANG"
CheckSubFolder "$BASH_UTILS_LIB_FUNCTS"
CheckSubFolder "$BASH_UTILS_LIB_VARS"; echo 2>&1 | tee -a "$INITIALIZER_LOG_PATH"

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
        source "$path"
        
        if [ "$?" -ne 0 ] && [ -z "$info" ]; then
            echo "In ${BASH_SOURCE[0]}, $lineno --> $path : Unable to source this file"; echo
            exit 1
        fi
    else
        source "$path"

        if [ "$?" -ne 0 ]; then
            echo "$path : Unable to source the $info"; echo
            exit 1
        fi
    fi
    
    echo "Included file : $path" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"; echo
}

# -----------------------------------------------

## SOURCING VARIABLES AND FUNCTIONS FILES

# shellcheck source=$MAIN_PROJECT_ROOT/$MAIN_S_RES/main.var
echo "$LINENO : LINKING BASH-UTILS LIBRARY FILES TO $(basename "$0" | cut -f 1 -d '.')" \
    && SourceFile "$BASH_UTILS_ROOT/lib/link_fncts_vars.sh" "library linker file"

# -----------------------------------------------

## SOURCING TRANSLATION FILES

# shellcheck source="$MAIN_PROJECT_ROOT/$MAIN_LANG/SetLibLang.sh"
echo "$LINENO : DEFINING BASH-UTILS LIBRARY LANGUAGE" \
    && SourceFile "$BASH_UTILS_LIB_LANG/SetLibLang.sh" ""

# -----------------------------------------------
