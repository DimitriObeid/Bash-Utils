#!/usr/bin/env bash

# shellcheck disable=SC1091
if ! source "/usr/local/lib/Bash-utils/lib/Initializer.sh"; then
	echo; echo "Unable to source the initializer file"; echo; exit 1
fi

# //////////////////////////////////////////////////////////////////////////// #

# Lenght=0    # '-L' argument
# lines=0     # '-l' argument
# chars=0     # '-m' argument
# words=0     # '-w' argument

function GetWCBytes
{
    #***** Variables *****
    bytes=0
    bytes_proj="$(wc -c "$PROJECT_PATH")"
    bytes_basis=0
    bytes_basis_tmp="$(wc -c "$f")"
    bytes_functs=0
    bytes_functs_tmp="$(wc -c "$f")"
    bytes_vars=0
    bytes_vars_tmp="$(wc -c "$f")"

    #***** Code *****
    wc -c "$PROJECT_PATH" && echo "Number of bytes of $(Decho "$PROJECT_PATH") : $(Decho "$bytes_proj")"
    bytes=$(( bytes+bytes_proj ))

    for f in "$BASH_UTILS_FUNCTS_BASIS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Basic function's loop failed"; break; }

		echo "Number of bytes of $(Decho "$f") : $bytes_basis_tmp"
		bytes_basis=$(( bytes_basis+bytes_basis_tmp )); echo
	done
	
	echo "Total bytes number from the basis functions files : $bytes_basis"; echo
	bytes=$(( bytes+bytes_basis ))

    for f in "$BASH_UTILS_FUNCTS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Main function's loop failed"; break; }
        
        echo "Number of bytes of $(Decho "$f") : $bytes_basis_tmp"
        bytes_functs=$(( bytes_functs+bytes_functs_tmp )); echo
    done
	
	echo "Total bytes number from the main functions files : $bytes_functs"; echo
    bytes=$(( bytes+bytes_functs ))
	
    for f in "$BASH_UTILS_VARS/"*.lib; do
        [[ -e "$f" ]] || { EchoError "Variable's loop failed"; break; }

        echo "Number of bytes of $(Decho "$f") $bytes_vars_tmp"
        
        bytes_vars=$(( bytes_vars+bytes_vars_tmp )); echo
    done
    
    echo "Total bytes number from the variables files : $bytes_vars"; echo
    bytes=$(( bytes+bytes_vars )); echo
    
    echo "Total bytes number from the project and the library : $bytes"; echo
}

function GetWCMaxLineLenght
{
    wc -L "$PROJ/Linux-reinstall.sh"

    for f in $(ls -R "$BASH_UTILS_FUNCTS_BASIS/"*.lib); do
        wc -L "$f"
    done

    for f in $(ls -R "$BASH_UTILS_FUNCTS/"*.lib); do
        wc -L "$f"
    done

    for f in $(ls -R "$BASH_UTILS_VARS/"*.lib); do
        wc -L "$f"
    done
}

function GetWCLinesNumber
{
    wc -l "$PROJ/Linux-reinstall.sh"

    for f in $(ls -R "$BASH_UTILS_FUNCTS_BASIS/"*.lib); do
        wc -l "$f"
    done

    for f in $(ls -R "$BASH_UTILS_FUNCTS/"*.lib); do
        wc -l "$f"
    done

    for f in $(ls -R "$BASH_UTILS_VARS/"*.lib); do
        wc -l "$f"
    done
}

function GetWCCharsNumber
{
    wc -m "$PROJ/Linux-reinstall.sh"

    for f in $(ls -R "$BASH_UTILS_FUNCTS_BASIS/"*.lib); do
        wc -m "$f"
    done

    for f in $(ls -R "$BASH_UTILS_FUNCTS/"*.lib); do
        wc -m "$f"
    done

    for f in $(ls -R "$BASH_UTILS_VARS/"*.lib); do
        wc -m "$f"
    done
}

function GetWCWordsNumber
{
	wc -w "$PROJ/Linux-reinstall.sh"

    for f in $(ls -R "$BASH_UTILS_FUNCTS_BASIS/"*.lib); do
        wc -w "$f"
    done

    for f in $(ls -R "$BASH_UTILS_FUNCTS/"*.lib); do
        wc -w "$f"
    done

    for f in $(ls -R "$BASH_UTILS_VARS/"*.lib); do
        wc -w "$f"
    done
}

GetWCBytes

# else
# 	HandleError "1" "INCORRECT ARGUMENT" "The allowed arguments are $(DechoE "c"), $(DechoE "L"), $(DechoE "l"), $(DechoE "m") and $(DechoE "w")." "$(basename "$0")" "" ""
# fi
