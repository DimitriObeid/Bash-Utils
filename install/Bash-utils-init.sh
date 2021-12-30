#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Bash-utils-init.sh
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

#### INITIALIZER RESOURCES

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

# Rewriting the library's languages messages.
function __bu_print_library_default_language()
{
    echo >&2; echo "The rest of the library will use english as default language" >&2
    echo >&2: echo "Le reste de la librairie utilisera l'anglais en tant que langue par défaut" >&2

    echo >&2
}


function __bu_export_textdomain()
{
    return 0
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

# Check if the given path exists
# TODO : Check where I called this function or tried to do so.
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
            echo  >&2; echo ">>>>> BASH-UTILS ERROR >>>>> IN << ${FUNCNAME[0]} >>, LINE << $LINENO >> >>>>> NO SPECIFICATION ABOUT THE TARGET !!!" >&2; echo >&2

            echo "Please specify if the target is a file or a folder by passing 'f' or 'd' as second argument when you call the << ${FUNCNAME[0]} >> function." >&2; echo >&2; exit 1
        elif [ -n "$p_path" ] && [ "$p_target" = "[D-d]" ] && [ ! -d "$p_path" ]; then
            printf "%s (bad directory : not found)" "$p_path"

        elif [ -n "$p_path" ] && [ "$p_target" = "[F-f]" ] && [ ! -f "$p_path" ]; then
            printf "%s (bad file path : not found)" "$p_path"
        fi
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
        path="$(find "$1" -maxdepth 1 -iname "$2")" || return 1; printf "%s" "$path"; return 0
}

# Getting the module's name from a subdirectory (this function is called in the main module's "module.conf" configuration file).
function ModuleInitializer_GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" || { echo >&2; echo -e "Unable to get the module's name from the parent directory name" >&2; echo >&2; exit 1; }; pwd -P)"

    echo "${v_module##*/}"; return 0
}

# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.
function ModuleInitializer_ListInstalledModules()
{
    #***** Variables *****
    local v_module_tmp_d="$__BU_MODULE_UTILS_ROOT/tmp"

    local v_module_conf_f="$v_module_tmp_d/BU_modules_config_dir.out"
    local v_module_diff_f="$v_module_tmp_d/BU_modules_init_diff.out"
    local v_module_init_f="$v_module_tmp_d/BU_modules_init_dir.out"

    #***** Code *****
    if [ ! -d "$v_module_tmp_d" ]; then
        mkdir -p "$v_module_tmp_d" ||
		{
			echo "Unable to create the logs temporary directory ''tmp'' in the ''$__BU_MODULE_UTILS_ROOT/'' directory" >&2; echo >&2

			echo "If the problem persists, please create this folder manually" >&2; echo >&2

			exit 1
		}
    fi

    if [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES" ] && [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then

                                                                            # In case the "ls" command points towards a bad path because of a bad variable's value.
        ls -l "$__BU_MODULE_UTILS_CONFIG_MODULES"   > "$v_module_conf_f"    || { echo >&2; echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path" >&2; echo >&2; exit 1; }
        ls -l "$__BU_MODULE_UTILS_MODULES_DIR"      > "$v_module_init_f"    || { echo >&2; echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path" >&2; echo >&2; exit 1; }

        if diff "$v_module_conf_f" "$v_module_init_f" > "$v_module_diff_f"; then
            echo; echo "INSTALLED MODULES LIST :"; echo; sleep ".5"

            cat "$v_module_conf_f"; echo; sleep 1
        else
            echo; echo "WARNING ! A MODULE OR MORE ARE MISSING IN THE << $__BU_MODULE_UTILS_CONFIG_MODULES >> OR IN THE << $__BU_MODULE_UTILS_MODULES_DIR >> FOLDERS"; echo >&2

            echo "MODULES CONFIGURATION FOLDER LIST :"; echo

            cat "$v_module_conf_f"; echo

            echo "MODULES INITIALIZATION FOLDER LIST :"; echo

            cat "$v_module_init_f"; echo
        fi
    else
        if [ ! -d "$__BU_MODULE_UTILS_CONFIG_MODULES" ] && [ ! -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "WARNING ! THE MODULES CONFIGURATION FOLDER AND THE MODULES INITIALIZATION FOLDER ARE MISSING !" >&2
        elif [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES" ]; then
            echo "WARNING ! THE MODULES CONFIGURATION FOLDER IS MISSING !" >&2
        elif [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "WARNING ! THE MODULES INITIALIZATION FOLDER IS MISSING !" >&2
        fi
    fi

    exit 1
}

# Checking and processing the global status variables value's arguments given after the module's name.
function ModuleInitializer_ProcessStat()
{
    #***** Parameters *****
    local p_module=$1       # The module's name from the "for module in "${p_module_list[@]}"; do" loop.
    local p_module_name=$2  # The "$v_module_name" variable defined at each loop's iteration.

    #***** Code *****
    # If extra arguments are passed in order to modify status variables, then a script provided with the module is called to modify their values automatically in a copy of the "Status.conf" file, before sourcing it instead of the original configuration file.
    if [ "$module" = "$v_module_name --stat=\"*" ] || [ "$module" = "$v_module_name --stat='*" ]; then
        if ! "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES/$v_module_name/" "ChangeStat.conf")"; then
            echo >&2; echo "IN ${BASH_SOURCE[0]}, LINE $LINENO --> ERROR !" >&2; echo >&2

            echo "No ''ChangeStat.conf'' status configuration script found in the ''$__BU_MODULE_UTILS_CONFIG_MODULES/$v_module_name'' folder !" >&2; echo >&2
            echo "Please create this file, and write the necessary conditions that changes the status global variables values" >&2; echo >&2

            echo "Aborting the module's initialization" >&2; echo >&2

            exit 1
        else
            echo; echo "Processing the $v_module_name module's global status variables' configuration script"; echo
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

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BEGIN INITIALIZATION

## CHECKING THE ARGUMENTS ARRAY LENGTH

# List of all the modules to include passed as arguments.
p_module_list=("$@")

if [ -z "${p_module_list[*]}" ]; then
    printf "WARNING !!! YOU MUST PASS A MODULE NAME WHEN YOU CALL THE %s MODULE INITIALIZATION SCRIPT" "$(basename "${BASH_SOURCE[0]}")"
fi

# TODO : Ajouter un séparateur d'arguments, et prendre en charge des arguments supplémentaires, comme la modification de la valeur d'une variable globale de statut
# sans avoir à la modifier manuellement avant chaque exécution d'un script.

# -----------------------------------------------

## DEFINING GLOBAL VARIABLES

__BU_MODULE_UTILS_ROOT_HOME="$HOME"

if [ -d "$__BU_MODULE_UTILS_ROOT_HOME/.Bash-utils" ]; then
	__BU_MODULE_UTILS_ROOT="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT_HOME" ".Bash-utils")"
	__BU_MODULE_UTILS_CONFIG="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT" "config")"
	__BU_MODULE_UTILS_CONFIG_MODULES="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG" "modules")"
	__BU_MODULE_UTILS_MODULES_DIR="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_ROOT" "modules")"
else
	echo >&2; echo "IN ${BASH_SOURCE[0]}, LINE $LINENO --> ERROR !" >&2; echo >&2

	echo "The Bash Utils configurations root folder << .Bash-utils >> doesn't exists in your home directory." >&2; echo >&2
	echo "Please copy this folder in your home directory. You can install it by executing the installation file, or you can find it in the Bash-utils/install directory." >&2; echo >&2

	echo "Aborting the library's initialization." >&2; echo >&2

	exit 1
fi

# -----------------------------------------------

## SOURCING THE "gettext.sh" FILE FOR TRANSLATING THE MODULE'S INITIALIZER, THEN THE MODULES

# Getting the "gettext.sh" file from a path registered in the "$PATH" global variable.
__bu_module_gettext_sh_file_path="$(command -v "gettext.sh")"

# Checking if the "gettext.sh" file exists in the "$PATH" global variable listed paths.
if [ -f "$__bu_module_gettext_sh_file_path" ]; then
    source "$__bu_module_gettext_sh_file_path" ||
    {
        echo >&2; echo "WARNING >>>>> UNABLE TO GET THE << gettext.sh >> FILE FOR THE << .po >> files translation" >&2
        __bu_print_library_default_language
    }

    __BU_MODULE_

# Else, if the file is not found, the spare "gettext.sh" file which came with the library "install" folder is called
else
    if [ -f ".Bash-utils/config/initializer/gettext.sh" ]; then
        source ".Bash-utils/config/initializer/gettext.sh" ||
        {
            echo >&2; echo "WARNING >>>>> UNABLE TO GET THE << .Bash-utils/config/initializer/gettext.sh >> FILE FOR THE << .po >> files translation" >&2
            __print_bu_library_default_language
        }

    # Else, if the "gettext.sh" file is missing
    else
        echo >&2; echo "WARNING >>>>> UNABLE TO GET THE << .Bash-utils/config/initializer/gettext.sh >> FILE" >&2
        __bu_print_library_default_language
    fi
fi

# -----------------------------------------------

## INITIALIZATION CODE

# Checking the currently used Bash language's version.
# THIS FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!!
ModuleInitializer_CheckBashMinimalVersion

# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
for module in "${p_module_list[@]}"; do

    # Defining variables for each iteration.
    v_module_name="$(echo "$module" | cut -d' ' -f1)"

    # Checking if the "main" module is passed as first argument.
    if [[ "${p_module_list[0]}" = 'main' ]] || [[ "${p_module_list[0]}" = "main --*" ]]; then
		echo 'MAIN'
	fi

    # Checking if the module's configuration directory exists (by removing its optionnaly passed configurations arguments).
    if ! ls --directory "$__BU_MODULE_UTILS_CONFIG_MODULES/$v_module_name"; then
		printf '\n'; printf "WARNING ! THE ''%s'' module is not installed, doesn't exists, or the << ls >> command had pointed elsewhere, towards an unexistent directory !!!\n\nCheck if the module's configuration files exist in this folder --> $__BU_MODULE_UTILS_CONFIG\n" "$v_module_name" >&2

        # Listing all the installed modules in the user's hard drive.
		ModuleInitializer_ListInstalledModules

		exit 1
    else
        ModuleInitializer_ProcessStat "$module" "$v_module_name"

        # shellcheck disable=SC1090
        source "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES/$v_module_name" "module.conf")" || ModuleInitializer_SourcingFailure "$__BU_MODULE_UTILS_CONFIG_MODULES/$v_module_name/module.conf" "$v_module_name"
    fi

    # Checking if the module's initialization directory exists (by removing its optionnaly passed configurations arguments).
    if ! ls --directory "$__BU_MODULE_UTILS_MODULES_DIR/$v_module_name"; then
        printf "WARNING ! THE ''%s'' module is not installed, doesn't exists, or the << ls >> command had pointed elsewhere, towards an unexistent directory !!!\n\nInstall this module, or check its name in this folder --> $__BU_MODULE_UTILS_MODULES_DIR" "$v_module_name" >&2

        exit 1
    else
        # shellcheck disable=SC1090
        source "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_MODULES_DIR/$v_module_name" "Initializer.sh")" || ModuleInitializer_SourcingFailure "$__BU_MODULE_UTILS_MODULES_DIR/$module/Initializer.sh" "$v_module_name"

        # Changing the global status variable's values after the main module's successful initialization.
        if [ "$v_module_name" = 'main' ]; then
            # TODO : After adding the status configuration arguments, 
            if [ -f "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES/$v_module_name/" "ChangeStat.conf")" ]; then
                echo "STAT"
            else
                ChangeSTAT_TXT_FMT      "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

                # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
                ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                ChangeSTAT_TIME_TXT     '0'         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            fi
        fi

		HeaderGreen "END OF THE $(DechoHighlight "$v_module_name") MODULE INITIALIZATION !"
	fi
done

# Testing a Decho_FMT function
# Decho_FMT_BlinkBoldDISU "Hello world" "$__BU_MAIN_COLOR_ORANGE"

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE WHOLE INITIALIZATION PROCESS

HeaderGreen "END OF THE LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") PROJECT'S SCRIPT $(DechoGreen "$__BU_MAIN_PROJECT_PATH") !"

if CheckStatIsInitializing; then
    ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
fi
