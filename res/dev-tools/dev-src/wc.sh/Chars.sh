#!/usr/bin/env bash

# Get the total number of characters in the whole library files plus the project file.
function GetWCCharsNumber
{
    #***** Variables *****
    chars=0
    chars_basis=0
    chars_functs=0
    chars_vars=0

    #***** Code *****
    chars_proj=$(wc -c "$PROJECT_PATH")
    echo "Number of characters in $(Decho "$PROJECT_PATH") : $chars_proj"; echo ll
    chars=$(( chars+chars_proj ))

    for f in "$BASH_UTILS_FUNCTS_BASIS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Basic function's loop failed"; break; }

        chars_basis_tmp="$(wc -c "$f")"

		echo "Number of characters in $(Decho "$f") : $chars_basis_tmp"
		chars_basis=$(( chars_basis+chars_basis_tmp )); echo
	done

	echo "Total number of characters in the basis functions files : $chars_basis"; echo
	chars=$(( chars+chars_basis ))

    for f in "$BASH_UTILS_FUNCTS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "${FUNCNAME[0]} : Main function's loop failed"; break; }

        chars_functs_tmp="$(wc -c "$f")"

        echo "Number of characters in $(Decho "$f") : $chars_basis_tmp"
        chars_functs=$(( chars_functs+chars_functs_tmp )); echo
    done

	echo "Total number of characters in the main functions files : $chars_functs"; echo
    chars=$(( chars+chars_functs ))

    for f in "$BASH_UTILS_VARS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Variable's loop failed"; break; }

        chars_vars_tmp="$(wc -c "$f")"

        echo "Number of characters in $(Decho "$f") $chars_vars_tmp"        
        chars_vars=$(( chars_vars+chars_vars_tmp )); echo
    done
    
    echo "Total number of characters in of the variables files : $chars_vars"; echo
    chars=$(( chars+chars_vars )); echo
    
    echo "Total number of characters in the project and the library : $chars"; echo
}
