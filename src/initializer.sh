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
if test ! -d "$BASH_UTILS_ROOT"; then
    echo "In ${BASH_SOURCE[0]}, line $LINENO --> Error : the 'Bash-Utils' folder was not found in the '/usr/local/bin' folder"; exit 1
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
INITIALIZER_SRC_ROOT="$BASH_UTILS_ROOT/src/public/$(basename "$0" | cut -f 1 -d '.')"  # Cutting the eventual file extension to match with the project directory's name in the "src/public" folder.

# Checking if the script's sources folder exists
lineno=$LINENO; if test ! -d "$INITIALIZER_SRC_ROOT"; then
    echo "In ${BASH_SOURCE[0]}, $lineno --> Error : The main script's resources source folder
        '/usr/local/bin/Bash-Utils/src/public/$(basename "$0" | cut -f 1 -d '.')' doesn't exists"; exit 1 
fi

# Checking if the main script is located if the "/usr/local/bin/Bash-Utils/src/public/<script name>" to make sure it will be executed by its ".desktop" file
lineno=$LINENO; if test ! -f "$INITIALIZER_SRC_ROOT/$(basename "$0")"; then
    echo "From ${BASH_SOURCE[0]} --> Error : the '$(basename "$0")' file doesn't exists in the '$INITIALIZER_SRC_ROOT' folder"; exit 1
fi

# 
INITIALIZER_SRC_INST="$INITIALIZER_SRC_ROOT/install/categories"   # TODO : Retirer ce dossier du template de fichier principal une fois le script de réinstallation fini
INITIALIZER_SRC_LANG="$INITIALIZER_SRC_ROOT/lang"
INITIALIZER_SRC_VARS="$INITIALIZER_SRC_ROOT/lib/variables"

# Script initialization log file
INITIALIZER_LOG_PATH="$INITIALIZER_SRC_ROOT/initscript.log"

if test -f "$INITIALIZER_LOG_PATH"; then
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
    if test -d "$path"; then
        echo "Existing sub-folder : $path" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
    else
        echo "FATAL : Cannot include $path, abort"; exit 1
    fi
}

# Calling the above function and passing targeted directories paths as argument
echo "${BASH_SOURCE[0]}, $LINENO : CHECKING FOR $(basename "$0" | cut -f 1 -d '.')'s SUB-FOLDERS" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
CheckSubFolder "$INITIALIZER_SRC_INST"
CheckSubFolder "$INITIALIZER_SRC_LANG"
CheckSubFolder "$INITIALIZER_SRC_VARS"; echo 2>&1 | tee -a "$INITIALIZER_LOG_PATH"

echo "${BASH_SOURCE[0]}, $LINENO : CHECKING FOR BASH-UTILS SUB-FOLDERS" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
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
    
    if test -z "$info"; then
        source "$path"
        
        if test "$?" -ne 0 && test -z "$info"; then
            echo "In ${BASH_SOURCE[0]}, $lineno --> $path : Unable to source this file"; echo
            exit 1
        fi
    else
        source "$path"

        if test "$?" -ne 0; then
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

# shellcheck source="$MAIN_PROJECT_ROOT/$MAIN_S_LANG/SetMainLang.sh"
echo "$LINENO : DEFINING $(basename "$0" | cut -f 1 -d '.')'s LIBRARY FOLDER" \
    && SourceFile "$MAIN_SCRIPT_SRC_LANG/SetMainLang.sh" ""

# -----------------------------------------------
