#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.

# There's no need for extra check with "*)", as this case of failure is already tested in the "src/public/SetMainLang.sh" file, which is the first file sourced, at the beginning of the main file.
case "$LANG" in
    # English
    en_*)
        for f in "$MAIN_PROJECT_ROOT/$MAIN_L_LANG/en/*.en"; do
            source $f
            
            if test "$?" -ne 0; then
                echo "$f : Unable to source this translation file"
                echo
                
                exit 1
            else
                echo "Included translation file : $f"
                echo
            fi
        done
        ;;

    # French
    fr_*)
        for f in "$MAIN_PROJECT_ROOT/$MAIN_L_LANG/fr/*.fr"; do
            source $f
            
            if test "$?" -ne 0; then
                echo "$f : Impossible de sourcer ce fichier de traduction"
                echo
                
                exit 1
            else
                echo "Fichier de traduction sourcé : $f"
                echo
            fi
        done
        ;;
esac
