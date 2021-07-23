#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

# LIBLANG_TRANSLATION_FILE="$BASH_UTILS_LANG/lang.csv"

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly."
    echo "Use this script only by sourcing it the initializer script."; echo

    exit 1
fi


## TODO : DÉPLACER CETTE FONCTION DANS LE FICHIER "Initializer.sh", parmi les fonctions, une fois la fonction... fonctionnelle (si vous me cherchez, je suis déjà dehors).
# Optimizing the "GetLang" function's code with another function.
function ParseCSVLang
{
    #***** Parameters *****
    lang=$1
    success_msg=$2
    error_msg=$3

    #***** Code *****
    
}
