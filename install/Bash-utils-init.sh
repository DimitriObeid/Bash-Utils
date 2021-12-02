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

# Create a file directly in the computer's memory to redirect .
function ModuleInitializer_CreateFileInMemory()
{
    #***** Parameters *****
    p_filename=$1

    #***** Code *****
}

# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.
function ModuleInitializer_FindPath()
{
	# $1 = Parent directory.
    # $2 = Targeted directory or file.
    local path
        path="$(find "$1" -maxdepth 1 -iname "$2")" && printf "%s" "$path"; return 0
}

function ModuleInitializer_GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" || { echo -e "Unable to get the module's name from the parent directory name"; exit 1; }; pwd -P)"

    echo "${v_module##*/}"; return 0
}

# Check if the given path exists
function __ModuleInitializer_CheckPath()
{
    #***** Parameters *****
    local p_path=$1         # Path of the target file or directory.
    local p_target=$2       # Specify if the target is a directory or a file.

    #***** Code *****
    if [ -z "$p_path" ]; then
        printf "<No file path>"

    else
        if [ -z "$p_target" ]; then
            echo ">>>>> BASH-UTILS ERROR >>>>> IN << ${FUNCNAME[0]} >>, LINE << $LINENO >> >>>>> NO SPECIFICATION ABOUT THE TARGET !!!"; echo

            echo "Please specify if the target is a file or a folder by passing 'f' or 'd' as second argument when you call the << ${FUNCNAME[0]} >> function."; echo; exit 1
        elif [ -n "$p_path" ] && [ "$p_target" = "[D-d]" ] && [ ! -d "$p_path" ]; then
            printf "%s (bad directory : not found)" "$p_path"

        elif [ -n "$p_path" ] && [ "$p_target" = "[F-f]" ] && [ ! -f "$p_path" ]; then
            printf "%s (bad file path : not found)" "$p_path"
        fi
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

# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.
function ModuleInitializer_ListInstalledModules()
{
    #***** Variables *****
    local v_module_conf="$__BU_MODULE_UTILS_ROOT_HOME/BU_modules_config_dir.out"
    local v_module_init="$__BU_MODULE_UTILS_ROOT_HOME/BU_modules_init_dir.out"

    #***** Code *****
    if [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES" ] && [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then

                                                                        # In case the "ls" command points towards a bad path because of a bad variable's value.
        ls -l "$__BU_MODULE_UTILS_CONFIG_MODULES" > "$v_module_conf"    || echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path"; exit 1
        ls -l "$__BU_MODULE_UTILS_MODULES_DIR" > "$v_module_init"       || echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path"; exit 1

        if diff "$v_module_conf" "$v_module_init"; then
            echo; echo "INSTALLED MODULES LIST :"; echo

            cat "$v_module_conf"; echo
        else
            echo; echo "WARNING ! A MODULE OR MORE ARE MISSING IN THE << $__BU_MODULE_UTILS_CONFIG_MODULES >> OR IN THE << $__BU_MODULE_UTILS_MODULES_DIR >> FOLDERS"; echo
            
            echo "MODULES CONFIGURATION FOLDER LIST :"; echo

            cat "$v_module_conf"; echo

            echo "MODULES INITIALIZATION FOLDER LIST :"; echo

            cat "$v_module_init"; echo
        fi
    else
        if [ ! -d "$__BU_MODULE_UTILS_CONFIG_MODULES" ] && [ ! -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "WARNING ! THE MODULES CONFIGURATION FOLDER AND THE MODULES INITIALIZATION FOLDER ARE MISSING !"
        elif [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES" ]; then
            echo "WARNING ! THE MODULES CONFIGURATION FOLDER IS MISSING !"
        elif [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "WARNING ! THE MODULES INITIALIZATION FOLDER IS MISSING !"
        fi
    fi

    exit 1
}

# -----------------------------------------------

## DEFINING GLOBAL VARIABLES

__BU_MODULE_UTILS_ROOT_HOME="$HOME"

if [ -d "$__BU_MODULE_UTILS_ROOT_HOME/.Bash-utils" ]; then    
	__BU_MODULE_UTILS_ROOT="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT_HOME" ".Bash-utils")"
	__BU_MODULE_UTILS_CONFIG="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT" "config")"
	__BU_MODULE_UTILS_CONFIG_MODULES="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG" "modules")"
	__BU_MODULE_UTILS_MODULES_DIR="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT" "modules")"
else
	echo "ERROR !"; echo

	echo "The Bash Utils configurations root folder << .Bash-utils >> doesn't exists in your home directory."; echo
	echo "Please copy this folder in your home directory. You can install it by executing the installation file, or you can find it in the Bash-utils/install directory."; echo

	echo "Aborting the library's initialization."; echo

	exit 1
fi

# -----------------------------------------------

## INITIALIZATION CODE

# Checking the currently used Bash language's version.
# THIS FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!!
ModuleInitializer_CheckBashMinimalVersion

# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
for module in "${p_module_list[@]}"; do
    if ! ls --directory "$__BU_MODULE_UTILS_CONFIG_MODULES/$module/"; then
		printf '\n'; printf "WARNING ! THE ''%s'' module is not installed, doesn't exists, or the << ls >> command had pointed elsewhere, towards an unexistent directory !!!\n\nCheck if the module's configuration files exist in this folder --> $__BU_MODULE_UTILS_CONFIG\n" "$module"

        ModuleInitializer_SpellCheck "${p_module_list[@]}"

		exit 1
    else
        # shellcheck disable=SC1090
        source "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES/$module" "module.conf")" > /dev/null || ModuleInitializer_SourcingFailure "$__BU_MODULE_UTILS_CONFIG_MODULES/$module/module.conf" "$module"
    fi

    if ! ls --directory "$__BU_MODULE_UTILS_MODULES_DIR/$module"; then
        printf "WARNING ! THE ''%s'' module is not installed, doesn't exists, or the << ls >> command had pointed elsewhere, towards an unexistent directory !!!\n\nInstall this module, or check its name in this folder --> $__BU_MODULE_UTILS_MODULES_DIR" "$module"

        exit 1
    else
        # shellcheck disable=SC1090
        source "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_MODULES_DIR/$module" "Initializer.sh")" || ModuleInitializer_SourcingFailure "$__BU_MODULE_UTILS_MODULES_DIR/$module/Initializer.sh" "$module"
    
		HeaderGreen "END OF THE $(DechoHighlight "$module") MODULE INITIALIZATION !"
	fi
done

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE WHOLE INITIALIZATION PROCESS

ChangeSTAT_TXT_FMT      "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TIME_TXT     '0'         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

HeaderGreen "END OF THE LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") PROJECT'S SCRIPT $(DechoGreen "$__BU_MAIN_PROJECT_PATH") !"

if CheckStatIsInitializing; then
    ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
fi
