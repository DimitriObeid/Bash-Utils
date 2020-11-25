#!/usr/bin/env bash

# Optimizing the code with a function
function SetMainLang()
{
    #**** Parameters ****
    local path=$1
    local error_msg=$2
    local success_msg=$3

    #***** Code *****
    # Don't double quote what follows the path variable, or else, the loop will only run once.
    echo "In $MAIN_SCRIPT_SRC_LANG/SetMainLang.sh, line $LINENO" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"; \
        for f in "$path"; do
        source "$f"
            
        if [ "$?" -ne 0 ]; then
            echo "$f : $error_msg"; echo
                
            exit 1
        else
            echo "$success_msg : $f" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
        fi
    done; echo
}

# Detecting user's language with the "$LANG" environment variable.
case "$LANG" in
    en_*)
        # English
        SetMainLang "$MAIN_SCRIPT_SRC_LANG"/en/*.en "Unable to source this translation file" "Included translation file"
        ;;
    fr_*)
        # French
        "$MAIN_SCRIPT_SRC_LANG"/fr/*.fr "Impossible de sourcer ce fichier de traduction" "Fichier de traduction sourcé"
        ;;

    # Unsupported language
    *)
        echo "Sorry, your language is not (yet) supported."; echo
        
        exit 1
        ;;
esac
