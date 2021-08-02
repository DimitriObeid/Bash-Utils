#!/usr/bin/env bash

# Get the total number of lines in the whole library files plus the project file.
function GetWCLinesNumber
{
    #***** Variables *****
    lines_number=0
    lines_number_basis=0
    lines_number_functs=0
    lines_number_vars=0

    #***** Code *****
    lines_number_proj=$(wc -c "$PROJECT_PATH")
    echo -e "Number of lines in $(Decho "$PROJECT_PATH") : $lines_proj"; echo ll
    lines_number=$(( lines_number+lines_number_proj ))

    for f in "$BASH_UTILS_FUNCTS_BASIS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Basic function's loop failed"; break; }

        lines_number_basis_tmp="$(wc -c "$f")"

		echo -e "Number of lines in $(Decho "$f") : $lines_number_basis_tmp"
		lines_number_basis=$(( lines_number_basis+lines_number_basis_tmp )); echo
	done

	echo -e "Total number of lines in the basis functions files : $lines_basis"; echo
	lines_number=$(( lines_number+lines_number_basis ))

    for f in "$BASH_UTILS_FUNCTS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Main function's loop failed"; break; }

        lines_number_functs_tmp="$(wc -c "$f")"

        echo -e "Number of lines in $(Decho "$f") : $lines_number_basis_tmp"
        lines_number_functs=$(( lines_number_functs+lines_number_functs_tmp )); echo
    done

	echo -e "Total number of lines in the main functions files : $lines_functs"; echo
    lines_number=$(( lines_number+lines_number_functs ))

    for f in "$BASH_UTILS_VARS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Variable's loop failed"; break; }

        line_number_vars_tmp="$(wc -c "$f")"

        echo -e "Number of lines in $(Decho "$f") $lines_vars_tmp"        
        lines_vars=$(( lines+line_number_vars_tmp )); echo
    done
    
    echo -e "Total number of lines in the CheckTxtFmts files : $lines_vars"; echo
    lines=$(( lines+lines_vars )); echo
    
    echo -e "Total number of lines in the project and the library : $lines"; echo
}
