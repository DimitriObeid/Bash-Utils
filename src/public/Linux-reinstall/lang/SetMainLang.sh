#!/usr/bin/env bash

# Optimizing the code with a function
function SetMainLang()
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
    
    if [ -d "$parent_dir_path/$sub_dir" ]; then
        if source "$f"; then
            WriteInitLog "$success_msg : $f"
        else
            echo "$f : $error_msg" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"; echo
            exit 1
        fi
    else
        echo "In ${BASH_SOURCE[0]}, line $lineno --> Error : cannot find the '$parent_dir_path' folder" \
            2>&1 | tee -a "$INITIALIZER_LOG_PATH"; echo; exit 1
    fi
    
    done; WriteInitLog
}

# Detecting user's language with the "$LANG" environment variable.
case "$LANG" in
    en_*)
        # English
        SetMainLang "$LINUX_REINSTALL_LANG" "en/*.en" "Unable to source this translation file" "Included translation file" "$LINENO"
        ;;
    fr_*)
        # French
        SetMainLang "$LINUX_REINSTALL_LANG" "fr/*.fr" "Impossible de sourcer ce fichier de traduction" "Fichier de traduction sourcé" "$LINENO"
        ;;
    *)
        # Else, if the detected language is not yet supported, the default language will be English.
        # As it's an important information, the "echo" command's output has to be redirected to the terminal too, no matter if
        echo "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" 2>&1 | tee -a "$INITIALIZER_LOG_PATH"
        echo "The $(basename "$0" | cut -f 1 -d '.') library language will be set in English" 2>&1 | tee -a ""
        
        SetLibLang "$BASH_UTILS_LIB_LANG" "en/*.en" "Unable to source this translation file" "Sourced translation file" "$LINENO"
        ;;
esac
