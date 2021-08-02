#!/usr/bin/env bash

# Get the total number of characters in the whole library files plus the project file.
function GetWCMaxLineLenght
{
    #***** Variables *****
    max_line=0
    max_line_basis=0
    max_line_functs=0
    max_line_vars=0

    #***** Code *****
    max_line_proj=$(wc -c "$PROJECT_PATH")
    echo -e "Number of max_line of $(Decho "$PROJECT_PATH") : $max_line_proj"; echo ll
    max_line=$(( max_line+max_line_proj ))

    for f in "$BASH_UTILS_FUNCTS_BASIS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Basic function's loop failed"; break; }

        max_line_basis_tmp="$(wc -c "$f")"

		echo -e "Number of max_line of $(Decho "$f") : $max_line_basis_tmp"
		max_line_basis=$(( max_line_basis+max_line_basis_tmp )); echo
	done

	echo -e "Total max_line number from the basis functions files : $max_line_basis"; echo
	max_line=$(( max_line+max_line_basis ))

    for f in "$BASH_UTILS_FUNCTS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Main function's loop failed"; break; }

        max_line_functs_tmp="$(wc -c "$f")"

        echo -e "Number of max_line of $(Decho "$f") : $max_line_basis_tmp"
        max_line_functs=$(( max_line_functs+max_line_functs_tmp )); echo
    done

	echo -e "Total max_line number from the main functions files : $max_line_functs"; echo
    max_line=$(( max_line+max_line_functs ))

    for f in "$BASH_UTILS_VARS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Variable's loop failed"; break; }

        max_line_vars_tmp="$(wc -c "$f")"

        echo -e "Number of max_line of $(Decho "$f") $max_line_vars_tmp"        
        max_line_vars=$(( max_line_vars+max_line_vars_tmp )); echo
    done
    
    echo -e "Total max_line number from the CheckTxtFmts files : $max_line_vars"; echo
    max_line=$(( max_line+max_line_vars )); echo
    
    echo -e "Total max_line number from the project and the library : $max_line"; echo
}
