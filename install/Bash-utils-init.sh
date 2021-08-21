#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Bash-utils-include.sh
# Description : Library initializer file, initializing all the modules you need for your scripts.
# Author(s) : Dimitri Obeid
# Version : 3.0

# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MODULES INITIALIZATION

## CHECKING THE ARGUMENTS ARRAY LENGTH

# List of all the modules to include passed as arguments.
p_module_list=("$@")

if [ -z "${p_module_list[*]}" ]; then
    printf "WARNING !!! YOU MUST PASS A MODULE NAME WHEN YOU CALL THE %s MODULE INITIALIZATION SCRIPT" "$(basename "${BASH_SOURCE[0]}")"
fi

# -----------------------------------------------

## DEFINING INITIALIZATION FUNCTIONS

# Use this function to have a better view about a bug location during a "bash -x" debug.
function DbgMsg()
{
    #***** Parameters *****
    p_code=$1               # Exit code.
    p_sleep=$2              # Pause time in seconds.

    #***** Code *****
    printf "

    -------------------------------------------------
    DEBUG
    -------------------------------------------------

    "

    if [ "$p_code" -eq 0 ]; then
        sleep "$p_sleep"

        return
    else
        exit 1
    fi
}

# Checking the currently used Bash language's version.
function ModuleInitializer_CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS MODULES INITIALIZATION ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2
		echo -e "This Bash library requires at least the Bash language's version 4.0.0" >&2
		echo >&2

		echo -e "Your Bash version is : $BASH_VERSION" >&2
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library"
		echo >&2

		exit 1
	fi
}

# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.
function ModuleInitializer_FindPath
{
	# $1 = Parent directory.
    # $2 = Targeted directory or file.
    local path
        path="$(find "$1" -maxdepth 1 -iname "$2")" && printf "%s" "$path"; return 0
}

function ModuleInitializer_GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" ||
    {
        printf "\nUnable to get the module's name from the parent directory name\n\n"

        exit 1
    }; pwd -P)"

    printf "%s" "${v_module##*/}"; return 0
}

function __ModuleInitializer_SourcingFailure_CheckPath()
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    if [ -z "$p_path" ]; then
        printf "<No file path>"
    elif [ ! -f "$p_path" ]; then
        printf "%s (bad file path : not found)" "$p_path"
    fi
}

# Printing an error message if a file cannot be sourced.
function ModuleInitializer_SourcingFailure()
{
    #***** Parameters *****
    local p_path=$1         # Path of the file that cannot be sourced.
    local p_module=$2       # Name of the module.

    #***** Code *****
    echo >&2; echo -e ">>>>> BASH-UTILS ERROR >>>>> UNABLE TO SOURCE THIS ''$p_module'' MODULE'S FILE --> $(__ModuleInitializer_SourcingFailure_CheckPath "$p_path")" >&2; echo >&2; exit 1
}

# -----------------------------------------------

## DEFINING GLOBAL VARIABLES

__BU_MODULE_UTILS_ROOT="$(ModuleInitializer_FindPath "$HOME" ".Bash-utils")"
__BU_MODULE_UTILS_CONFIG="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT" "config")"
__BU_MODULE_UTILS_CONFIG_MODULES="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG" "modules")"
__BU_MODULE_UTILS_MODULES_DIR="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT" "modules")"

# -----------------------------------------------

## INITIALIZATION CODE

# Checking the currently used Bash language's version.
# THIS FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!!
ModuleInitializer_CheckBashMinimalVersion


# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
for module in "${p_module_list[@]}"; do
    if ! ls --directory "$__BU_MODULE_UTILS_CONFIG_MODULES/$module/"; then
		printf "WARNING ! THE ''%s'' module is not installed or doesn't exists !!!\n\nCheck if the module's configuration files exist in this folder --> $__BU_MODULE_UTILS_CONFIG\n" "$module"

		exit 1
    else
        # shellcheck disable=SC1090
        source "$__BU_MODULE_UTILS_CONFIG_MODULES/$module/module.conf" || ModuleInitializer_SourcingFailure "$__BU_MODULE_UTILS_CONFIG_MODULES/$module/module.conf" "$module"
    fi

    if ! ls --directory "$__BU_MODULE_UTILS_MODULES_DIR/$module"; then
        printf "WARNING ! THE ''%s'' module is not installed or doesn't exists !!!\n\nInstall this module, or check its name in this folder --> $__BU_MODULE_UTILS_MODULES_DIR" "$module"

        exit 1
    else
        # shellcheck disable=SC1090
        source "$__BU_MODULE_UTILS_MODULES_DIR/$module/Initializer.sh" || ModuleInitializer_SourcingFailure "$__BU_MODULE_UTILS_MODULES_DIR/$module/Initializer.sh" "$module"
    fi
done

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE WHOLE INITIALIZATION PROCESS

ChangeSTAT_TXT_FMT      "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" CheckTxtFmt's value is equal to "true".
ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

HeaderGreen "END OF THE LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") PROJECT'S SCRIPT $(DechoGreen "$__BU_MAIN_PROJECT_NAME") !"

if CheckIsInitializing; then
    # shellcheck disable=SC2034
    __BU_MAIN_INIT_IS_INITALIZING="false"
fi