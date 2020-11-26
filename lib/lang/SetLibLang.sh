#!/usr/bin/env bash

# As this script is not meant to be directly executed, but sourced, 
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then 
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo
    exit 1
fi

# Exporting the variables

# Optimizing the code with a function
function SetLibLang()
{
    #***** Parameters *****
    local parent_dir_path=$1
    local sub_dir=$2
    local error_msg=$3
    local success_msg=$4
    local lineno=$5
    
    #***** Code *****
    # Don't double quote what follows the path variable, or else, the loop will only run once.
    WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno"; for f in $parent_dir_path/$sub_dir; do
        if source "$f"; then
            WriteInitLog "$success_msg : $f"
        else
            echo "$f : $error_msg"; echo

            exit 1
        fi
    done; WriteInitLog
}

# Detecting user's language with the "$LANG" environment variable.
case "$LANG" in
    en_*)
        # English
        SetLibLang "$BASH_UTILS_LIB_LANG" "en/*.en" "Unable to source this translation file" "Sourced translation file" "$LINENO"
        ;;
    fr_*)
        # French
        SetLibLang "$BASH_UTILS_LIB_LANG" "fr/*.fr" "Impossible de sourcer ce fichier de traduction" "Fichier de traduction sourcé" "$LINENO"
        ;;
    *)
        # Else, if the detected language is not yet supported, the default language will be English.
        # As it's an important information, the "echo" command's output has to be redirected to the terminal too, no matter if
        echo "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
        echo "The $(basename "$0" | cut -f 1 -d '.') library language will be set in English" 2>&1 | tee -a ""
        
        SetLibLang "$BASH_UTILS_LIB_LANG" "en/*.en" "Unable to source this translation file" "Sourced translation file" "$LINENO"
        ;;
esac
