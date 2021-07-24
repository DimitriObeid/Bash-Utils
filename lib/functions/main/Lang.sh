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

#### TRANSLATIONS PROCESSING FUNCTIONS

## PARSING FUNCTIONS

# Parsing a translations CSV file.
function ParseCSVLang()
{
    #***** Parameters *****
    p_path=$1               # Path of the translations CSV file to parse.
    p_lang=$2               # Language to fetch.
    p_success_msg=$3        # Success message to display in the targeted language.
    p_error_msg=$4          # Error message to display in the targeted language.

    #***** Code *****
    CheckArgsMain_ParseCSVLang "$p_path" "$p_lang" "$p_success_msg" "$p_error_msg"

    HeaderCyan "PARSING THE $(DechoHighlight "$p_path") TRANSLATIONS CSV FILE"

    EchoNewstep "Finding the variables list"
    Newline

    for i in 
}
