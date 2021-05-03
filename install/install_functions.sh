#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

## VARIABLES

# Paths
__BASH_UTILS_FOLD="/usr/local/lib"
__BASH_UTILS_ROOT="../"
__LOG_PATH="tmp/install.log"

# Colors
__COL_ORANGE="$(tput setaf 166)"
__COL_GREEN="$(tput setaf 82)"
__COL_PURPLE="$(tput setaf 165)"
__COL_RED="$(tput setaf 196)"
__COL_YELLOW="$(tput setaf 226)"

# Step identfication
I=0
J=0

# -----------------------------------------------

## FUNCTIONS

# Basic printing.
function ExitInstall
{
    echo "Do you want to exit installation ? (yes/no)" >&2
    
    read -r "Enter an answer : " read_exit
    
    case "${read_exit^^}" in
        'yes')
            exit 1
            ;;
        'no')
            return
            ;;
        *)
            echo; echo "Please enter a correct answer : yes OR no"; echo
            ExitInstall
            ;;
    esac
}
function EchoError      { echo "${__COL_RED}ERROR : $1$(tput sgr0)" >&2; ExitError >&2; }
function EchoNewSubStep { echo "${__COL_ORANGE}$1$(tput sgr0)"; }
function EchoSuccess    { echo "${__COL_GREEN}SUCCESS : $1$(tput sgr0)" >&1; }
function EchoWarning    { echo "${__COL_YELLOW}WARNING : $1$(tput sgr0)"; }

# Line breaking
function Newline
{
    #***** Parameters *****
    p_break=$1

    #***** Code *****
    if [ -n "$p_break" ]; then
        if [[ ! "$p_break" =~ [0-9] ]]; then
            EchoError "Bad argument passed as ${FUNCNAME[0]} function, expecting an integer !"
        fi
    fi
}

# Steps number incrementers.
function IncI { I=$(( I+1 )); }
function IncJ {	J=$(( J+1 )); }
function IncIJ { IncI && IncJ; }

function EchoStep
{
	#***** Parameters *****
	local p_str=$1
	local i=$2
	local j=$3

	#***** Code *****
	if [ -n "$i" ] || [ -n "$j" ]; then
		if [ "$i" == "I" ]; then
			IncI
		elif [ "$j" == "J" ]; then
			IncJ
		elif [ "$i" == "I" ] && [ "$j" == "J" ]; then
			IncIJ
		fi
	else
		EchoWarning "No values passed as second and third argument of the ${FUNCNAME[0]} function"
	fi

	echo "$__COL_PURPLE$I.$J : $__COL_ORANGE$p_str$(tput sgr0)"
}

function CheckSupportAndInstallDeps
{
    EchoNewSubStep "Operating system : $OSTYPE"; echo
    
    # If the operating system is Linux-based.
    if [ "$OSTYPE" == "linux-gnu" ]; then
        
        # Install dependencies for Debian-based Linux distributions.
        if command -v "apt"; then
        
        elif command -v "dnf"; then
        
        elif command -v "pacman"; then
        
        else
            EchoWarning "Your package manager is not yet supported by the installer (and thus, by some parts of the library) !";
            EchoWarning "You can continue the installation, but it's not guaranteed that you already have the needed programs"; ExitInstall

        fi
        
    # Else, if the operating system is Mac-based.
    elif [ "$OSTYPE" == "darwin" ]; then
        return
    
    else
        echo >&2

        EchoWarning "Your operating system is not yet supported by the installer (and thus, by some parts of the library) !";
        EchoWarning "You can continue the installation, but it's not guaranteed that you already have the needed programs"; ExitInstall
        
        echo >&2; exit 1
    fi
}
