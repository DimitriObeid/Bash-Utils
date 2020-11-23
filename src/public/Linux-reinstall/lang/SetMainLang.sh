#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.
case "$LANG" in
# English
    en_*)
        for f in "$MAIN_PROJECT_SRC_LANG/en/*.en"; do
            source $f
            
            if test "$?" -ne 0; then
                echo "$f : Unable to source this translation file"; echo
                
                exit 1
            else
                echo "Included translation file : $f"; echo
            fi
        done
        ;;

    # French
    fr_*)
        for f in "$MAIN_PROJECT_SRC_LANG/fr/*.fr"; do
            source $f
            
            if test "$?" -ne 0; then
                echo "$f : Impossible de sourcer ce fichier de traduction"; echo
                
                exit 1
            else
                echo "Fichier de traduction sourcé : $f"; echo
            fi
        done
        ;;

    # Unsupported language
    *)
        echo "Sorry, your language is not (yet) supported."
        
        exit 1
        ;;
esac
