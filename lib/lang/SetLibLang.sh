#!/usr/bin/env bash

# Optimizing the code with a function
function SetLibLang()
{
    #***** Parameters *****
    local path=$1
    
    #***** Code *****
    # Don't double quote what follows the path variable, or else, the loop will only run once.
    echo "In $MAIN_SCRIPT_SRC_LANG/SetLibLang.sh, line $LINENO" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"; \
        for f in "$path"; do
        source "$f"
            
        if [ "$?" -ne 0 ]; then
            echo "$f : $error_msg"; echo
                
            exit 1
        else
            echo "$success_msg : $f" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
        fi
    done; echo
}

# Detecting user's language with the "$LANG" environment variable.
case "$LANG" in
    en_*)
        # English
        SetLibLang "Unable to source this translation file" "Included translation file"
        ;;
    fr_*)
        # French
        SetLibLang "Impossible de sourcer ce fichier de traduction" "Fichier de traduction sourcé"
        ;;
esac
