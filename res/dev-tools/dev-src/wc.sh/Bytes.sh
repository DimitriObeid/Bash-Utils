#!/usr/bin/env bash

# Get the total size in byte of the whole library files plus the project file.
function GetWCBytes
{
    #***** Variables *****
    bytes=0
    bytes_basis=0
    bytes_functs=0
    bytes_vars=0

    #***** Code *****
    bytes_proj=$(wc -c "$PROJECT_PATH")
    echo -e "Size in bytes of $(Decho -e "$PROJECT_PATH") : $bytes_proj"; echo ll
    bytes=$(( bytes+bytes_proj ))

    for f in "$BASH_UTILS_FUNCTS_BASIS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Basic function's loop failed"; break; }

        bytes_basis_tmp="$(wc -c "$f")"

		echo -e "Size in bytes of $(Decho -e "$f") : $bytes_basis_tmp"
		bytes_basis=$(( bytes_basis+bytes_basis_tmp )); echo
	done

	echo -e "Total size in bytes of the basis functions files : $bytes_basis"; echo
	bytes=$(( bytes+bytes_basis ))

    for f in "$BASH_UTILS_FUNCTS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "${FUNCNAME[0]} : Main function's loop failed"; break; }

        bytes_functs_tmp="$(wc -c "$f")"

        echo -e "Size in bytes of $(Decho -e "$f") : $bytes_basis_tmp"
        bytes_functs=$(( bytes_functs+bytes_functs_tmp )); echo
    done

	echo -e "Total size in bytes of the main functions files : $bytes_functs"; echo
    bytes=$(( bytes+bytes_functs ))

    for f in "$BASH_UTILS_VARS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Variable's loop failed"; break; }

        bytes_vars_tmp="$(wc -c "$f")"

        echo -e "Size in bytes of $(Decho -e "$f") $bytes_vars_tmp"        
        bytes_vars=$(( bytes_vars+bytes_vars_tmp )); echo
    done
    
    echo -e "Total size in bytes of the variables files : $bytes_vars"; echo
    bytes=$(( bytes+bytes_vars )); echo
    
    echo -e "Total size in bytes of the project and the library : $bytes"; echo
}
