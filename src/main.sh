#!/usr/bin/env bash

# Main file, initalizing all you need for your scripts.


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################## DEFINING MAIN SCRIPT VARIABLES #################################

#### DEFINING BASH-UTILS DIRECTORY PATH, SUB-FOLDERS AND FILES

## BASH-UTILS ROOT PATH

# Bash-Utils root directory path
BASH_UTILS_ROOT="/usr/local/bin/Bash-Utils"

# In case the Bash-Utils folder doesn't exists or is not located in the correct path
if test ! -d "$BASH_UTILS_ROOT"; then
    echo 'Error : the "Bash-Utils" folder was not found in the "/usr/local/bin" folder'; exit 1
fi

# -----------------------------------------------

## BASH-UTILS SUB-FOLDERS

BASH_UTILS_LIB_FUNCTS="$BASH_UTILS_ROOT/lib/functions"
BASH_UTILS_LIB_LANG="$BASH_UTILS_ROOT/lang"
BASH_UTILS_LIB_VARS="$BASH_UTILS_ROOT/lib/variables"

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING MAIN SCRIPT DIRECTORY PATH, SUB-FOLDERS AND FILES

## SCRIPT ROOT PATH

# Defining script's root path
MAIN_SCRIPT_SRC_ROOT="$BASH_UTILS_ROOT/src/public/$(basename "$0" | cut -f 1 -d '.')"  # Cutting the eventual file extension to match with the project directory's name in the "src/public" folder.

# Checking if the script's sources folder exists
if test ! -d "$MAIN_SCRIPT_SRC_ROOT"; then
    echo "Error : The main script's resources source folder '/usr/local/bin/Bash-Utils/src/public/$(basename "$0" | cut -f 1 -d '.')' doesn't exists"; exit 1 
fi

# Checking if the main script is located if the "/usr/local/bin/Bash-Utils/src/public/<script name>" to make sure it will be executed by its ".desktop" file
if test ! -f "$MAIN_SCRIPT_SRC_ROOT/$(basename "$0")"; then
    echo "Error : the '$(basename "$0")' file doesn't exists in the '$MAIN_SCRIPT_SRC_ROOT' folder"; exit 1
fi

# 
MAIN_SCRIPT_SRC_INST="$MAIN_SCRIPT_SRC_ROOT/install/categories"   # TODO : Retirer ce dossier du template de fichier principal une fois le script de réinstallation fini
MAIN_SCRIPT_SRC_LANG="$MAIN_SCRIPT_SRC_ROOT/lang"
MAIN_SCRIPT_SRC_VARS="$MAIN_SCRIPT_SRC_ROOT/lib/variables"

# Script initialization log file
MAIN_SCRIPT_LOG_PATH="$MAIN_SCRIPT_SRC_ROOT/initscript.log"

if test -f "$MAIN_SCRIPT_LOG_PATH"; then

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
    if test -d "$path"; then
        echo "Existing sub-folder : $path" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
    else
        echo "FATAL : Cannot include $path, abort"; exit 1
    fi
}

# Calling the above function and passing targeted directories paths as argument
echo "$LINENO : CHECKING FOR $(basename "$0" | cut -f 1 -d '.')'s SUB-FOLDERS" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
CheckSubFolder "$MAIN_SCRIPT_SRC_INST"
CheckSubFolder "$MAIN_SCRIPT_SRC_LANG"
CheckSubFolder "$MAIN_SCRIPT_SRC_VARS"; echo 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"

echo "$LINENO : CHECKING FOR BASH-UTILS SUB-FOLDERS" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
CheckSubFolder "$BASH_UTILS_LIB_LANG"
CheckSubFolder "$BASH_UTILS_LIB_FUNCTS"
CheckSubFolder "$BASH_UTILS_LIB_VARS"; echo 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"

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
    
    #***** Code *****
    
    if test -z "$info"; then
        source "$path"
        
        if test "$?" -ne 0 && test -z "$info"; then
            echo "$path : Unable to source this file" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"; echo
            exit 1
        fi
    else
        source "$path"

        if test "$?" -ne 0; then
            echo "$path : Unable to source the $info" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"; echo
            exit 1
        fi
    fi
    
    echo "Included file : $path" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"; echo
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

# shellcheck source="$MAIN_PROJECT_ROOT/$MAIN_S_LANG/SetMainLang.sh"
echo "$LINENO : DEFINING $(basename "$0" | cut -f 1 -d '.')'s LIBRARY FOLDER" \
    && SourceFile "$MAIN_SCRIPT_SRC_LANG/SetMainLang.sh" ""

# -----------------------------------------------
