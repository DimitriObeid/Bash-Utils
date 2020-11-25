#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.

case "$LANG" in
    # English
    en_*)
        for f in "$BASH_UTILS_LIB_LANG"/en/*.en; do
            source $f
            
            if test "$?" -ne 0; then
                echo "$f : Unable to source this translation file"; echo
                
                exit 1
            else
                echo "Included translation file : $f" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
            fi
        done
        
        echo
        ;;

    # French
    fr_*)
        for f in "$BASH_UTILS_LIB_LANG"/fr/*.fr; do
            source $f
            
            if test "$?" -ne 0; then
                echo "$f : Impossible de sourcer ce fichier de traduction"; echo
                
                exit 1
            else
                echo "Fichier de traduction sourcé : $f" 2>&1 | tee a "$MAIN_SCRIPT_LOG_PATH"
            fi
        done

        echo
        ;;
esac
