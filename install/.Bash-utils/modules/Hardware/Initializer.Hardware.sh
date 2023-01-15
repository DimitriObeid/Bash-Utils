#!/usr/bin/env bash

# ---------------------
# SCRIPT'S INFORMATIONS

# Name          : Initializer.sh
# Module        : Hardware
# Description   : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s)     : Dimitri OBEID
# Version       : 1.0

# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC2154

# ---------------------
# NOTE ABOUT SHELLCHECK

# To display the content of a variable in a translated string, the use of the printf command is mandatory in order to interpret each "%s" pattern as the value of a variable.

# This means that the Shellcheck warning code SC2059 will be triggered anyway, since we have no choice but to store the entire translated string in a variable.

# If you add new messages to translate, you must call the directive "shellcheck disable=SC2059" before the line where you call the
# command "printf" to display the translated message, otherwise Shellcheck will display many warnings during the debugging procedure.

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in the "Bash-utils-init.sh" file's function "BashUtils_InitModules()"

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then if [[ "${LANG}" == de_* ]]; then
    echo -e "ACHTUNG !" >&2; echo >&2;
    echo -e "Dieses Shell-Skript (${BASH_SOURCE[0]}) ist nicht dazu gedacht, direkt ausgeführt zu werden !" >&2;
    echo -e "Verwenden Sie nur dieses Skript, indem Sie es in Ihr Projekt aufnehmen." >&2; echo >&2;

elif [[ "${LANG}" == es_* ]]; then
    echo -e "ATENCIÓN !" >&2; echo >&2;
    echo -e "Este script de shell (${BASH_SOURCE[0]}) no debe ejecutarse directamente !" >&2;
    echo -e "Utilice sólo este script incluyéndolo en el script de su proyecto." >&2; echo >&2;

elif [[ "${LANG}" == fr_* ]]; then
    echo -e "ATTENTION !" >&2; echo >&2;
    echo -e "Ce script shell (${BASH_SOURCE[0]}) n'est pas conçu pour être directement exécuté !" >&2;
    echo -e "Utilisez seulement ce script en l'incluant dans votre projet." >&2; echo >&2;

elif [[ "${LANG}" == pt_* ]]; then
    echo -e "ATENÇÃO !" >&2; echo >&2;
    echo -e "Este script de shell (${BASH_SOURCE[0]}) não é para ser executado directamente !" >&2;
    echo -e "Utilize este guião apenas incluindo-o no seu projecto." >&2; echo >&2;

else
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use only this script by including it in your project script." >&2; echo >&2;

fi; exit 1; fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################# INITIALIZING THE HARDWARE MODULE ################################

#### STEP ONE : DEFINING THE NEEDED RESOURCES

## FUNCTIONS

# Sourcing each library file stored into the "function/Hardware" directory, from the "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY}" array defined in the "/.Bash-utils/config/modules/Hardware/module.conf" file.
function BU.Hardware.Initializer.SourceLibrary()
{
    #**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

    #**** Code ****

	# Leaving a newline for a better text display in the log file and the terminal.
	BU.ModuleInit.Msg;

	# shellcheck disable=SC1090
	for f in "${__BU_HARDWARE_MODULE_FUNCTIONS_FILES_PATH_ARRAY[@]}"; do

        BU.ModuleInit.CheckIsDebugging && BU.ModuleInit.Msg "Debug mode activated";

		source "${f}" || { BU.ModuleInit.SourcingFailure "${f}" "$(BU.ModuleInit.GetModuleName "${BASH_SOURCE[0]}")" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("${f}"); v_loop_error='error'; break; }

		# shellcheck disable=SC2059
		BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_LIBRARY}" "${f}")";
	done

	if [ "${v_loop_error,,}" == 'error' ]; then return 1; fi

	# Leaving a newline for a better text display in the log file and the terminal.
	BU.ModuleInit.Msg;

	return 0;
}

# Sourcing each file listed into the "${__BU_HARDWARE_MODULE_LIST_CONFIG_FILES_PATH_ARRAY}" array defined in the "/.Bash-utils/config/modules/Hardware/module.conf" file.
function BU.Hardware.Initializer.SourceConfig()
{
    #**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

    #**** Code ****
	# shellcheck disable=SC1090
	for f in "${__BU_HARDWARE_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
		source "${f}" || { BU.ModuleInit.SourcingFailure "${f}" "$(BU.ModuleInit.GetModuleName "${BASH_SOURCE[0]}")" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}"; __BU_HARDWARE_MODULE_LIB_FILES_PATH_ARRAY+=("${f}"); v_loop_error='error'; break; };

		# shellcheck disable=SC2059
		BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_CONFIG}" "${f}")";
	done;

	if [ "${v_loop_error,,}" == 'error' ]; then return 1; fi

	# Leaving a newline for a better text display in the log file and the terminal.
	BU.ModuleInit.Msg;

	return 0;
}

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP TWO : PROCESSING THE HARDWARE MODULE'S PARAMETERS

# Usage function.
function BU.Hardware.Initializer.Usage()
{
    echo >&2; echo "${__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE__SUPPORTED_ARGS}" >&2;
    sleep 2;

    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo >&2;

    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo >&2;

    echo "${__BU_MODULE_INIT_MSG__INIT_HARDWARE_MODULE__STEP_TWO__USAGE_____}" >&2;
    echo >&2;

    echo >&2;
    echo "If you plan to debug the framework, the « __BU_MODULE_INIT_STAT_DEBUG_BASHX » status global variable can print the name of any function by file, category, sub-category or function" >&2;
    echo "With this global variable, you can print the name of the function before each instructions execution reported with the output of the « bash -x » command" >&2;
    echo >&2;

    return 0;
}

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP THREE : INCLUSION OF THE REST OF THE LIBRARY AND CONFIGURATION FILES FROM THE "HARDWARE" MODULE

# Sourcing each library file stored into the "function/Hardware" directory, from the "${__BU_HARDWARE_MODULE_FUNCTIONS_FILES_PATH_ARRAY}" array.
BU.Hardware.Initializer.SourceLibrary || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# Sourcing each file listed into the "${__BU_HARDWARE_MODULE_LIST_CONFIG_FILES_PATH_ARRAY}" array.
BU.Hardware.Initializer.SourceConfig || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

# -----------------------------------------------

## END OF THE INITIALIZATION PROCESS OF THE "HARDWARE" MODULE.
