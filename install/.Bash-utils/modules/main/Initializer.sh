#!/usr/bin/env bash

# ---------------------
# SCRIPT'S INFORMATIONS

# Name          : Initializer.sh
# Module        : Main
# Description   : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s)     : Dimitri Obeid
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
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then if [[ "${LANG}" == en_* ]]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

elif [[ "${LANG}" == fr_* ]]; then
    echo -e "ATTENTION !" >&2; echo >&2;
    echo -e "Ce script shell (${BASH_SOURCE[0]}) n'est pas conçu pour être directement exécuté !" >&2;
    echo -e "Utilisez seulement ce script en l'incluant dans votre projet." >&2; echo >&2;

else
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

fi; exit 1; fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################### INITIALIZING THE MAIN MODULE ##################################

#### STEP ONE : DEFINING THE NEEDED RESOURCES

## FUNCTIONS

# Sourcing each library file stored into the "function/main" directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array defined in the "~/.Bash-utils/config/modules/main/module.conf" file.
function BU.Main.Initializer.SourceLibrary()
{
    #**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

    #**** Code ****
    # Note : there is no need to call the "BU.ModuleInit.PrintLogError" function here, the "BU.ModuleInit.SourcingFailure()" function already does.

	# Leaving a newline for a better text display in the log file and the terminal.
	BU.ModuleInit.Msg;

	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY[@]}"; do

        BU.ModuleInit.CheckIsDebugging && BU.ModuleInit.Msg "Debug mode activated";

		BU.ModuleInit.IsFrameworkWrapped || source "$f" || { BU.ModuleInit.SourcingFailure "$f" "$(BU.ModuleInit.GetModuleName "${BASH_SOURCE[0]}")" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f"); v_loop_error='error'; break; }

		# shellcheck disable=SC2059
		BU.ModuleInit.Msg "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_LIBRARY" "$f")";
	done

	if [ "${v_loop_error,,}" == 'error' ]; then if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi; fi

	# Leaving a newline for a better text display in the log file and the terminal.
	BU.ModuleInit.Msg;

	return 0;
}

# Sourcing each file listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array defined in the "~/.Bash-utils/config/modules/main/module.conf" file.
function BU.Main.Initializer.SourceConfig()
{
    #**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

    #**** Code ****
    # Note : there is no need to call the "BU.ModuleInit.PrintLogError" function here, the "BU.ModuleInit.SourcingFailure()" function already does.

    if [ "${__BU_MAIN_INITIALIZER__STATUS_MODIFIED_BY_MAIN_MODULE_ARGS,,}" == 'true' ]; then
        # Deleting the index 1 of the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]" array,
        # which contains the path to the "Status.conf" configuration file, which was included just
        # before the processing of the status global variables vaues given as main module's arguments.
        unset '__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[1]';

        # Shifting each array's indexes which followed the deleted index.
        __BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY=( "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}" );
    fi

	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
		BU.ModuleInit.IsFrameworkWrapped || source "$f" || { BU.ModuleInit.SourcingFailure "$f" "$(BU.ModuleInit.GetModuleName "${BASH_SOURCE[0]}")" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$LINENO"; __BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY+=("$f"); v_loop_error='error'; break; };

		# shellcheck disable=SC2059
		BU.ModuleInit.Msg "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_CONFIG" "$f")";
	done;

	if [ "${v_loop_error,,}" == 'error' ]; then if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi; fi

	# Leaving a newline for a better text display in the log file and the terminal.
	BU.ModuleInit.Msg;

	return 0;
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP TWO : MINIMAL INCLUSION OF FILES IN ORDER TO USE THEIR RESOURCES DURING THE TRANSLATION PART

## SOURCING LIBRARY FILES FIRST

# Note : Several functions from the main module are used in the "BU.ModuleInit.()" function.

# Sourcing each needed library files stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.

# shellcheck disable=SC2059,SC2016
__BU_MAIN_INITIALIZER__TEXT_LIB_PATH="$(BU.ModuleInit.FindPath "$__BU_MAIN_MODULE_LIB_MOD_DIR_PATH" "Text.lib")" || { printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" '$__BU_MAIN_INITIALIZER__TEXT_LIB_PATH'; BU.ModuleInit.MsgAbort; BU.ModuleInit.AskPrintLog; BU.ModuleInit.IsInScript && exit 1; return 1; };

# shellcheck disable=SC1090
BU.ModuleInit.IsFrameworkWrapped || source "$__BU_MAIN_INITIALIZER__TEXT_LIB_PATH" || { BU.ModuleInit.SourcingFailure "$__BU_MAIN_INITIALIZER__TEXT_LIB_PATH" "$__BU_MODULE_INIT_MODULE_NAME" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$LINENO"; BU.ModuleInit.IsInScript && exit 1; return 1; };

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# Sourcing each needed configuration files listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.

# Remember that "Project.conf", the file whose path is stored in the "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" global variable,
# does not call any library functions from the main module, so it is totally safe to include this file.

# shellcheck disable=SC1090
BU.ModuleInit.IsFrameworkWrapped || source "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" || { BU.ModuleInit.SourcingFailure "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" "$__BU_MODULE_INIT_MODULE_NAME" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$LINENO"; BU.ModuleInit.IsInScript && exit 1; return 1; }

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP THREE : PROCESSING THE MAIN MODULE'S PARAMETERS

# Usage function.
function BU.Main.Initializer.Usage()
{
    echo >&2; echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE__SUPPORTED_ARGS" >&2;
    sleep 2;

    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______DECHO" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE________ECHO" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______ERROR" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_________LOG" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______LOG_R" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____OP_ROOT" >&2;
    echo >&2;

    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_H" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_N" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_T" >&2;
    echo >&2;

    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____TXT_FMT" >&2;
    echo >&2;

    echo >&2;
    echo "If you plan to debug the framework, the « __BU_MODULE_INIT_STAT_DEBUG_BASHX » status global variable can print the name of any function by file, category, sub-category or function" >&2;
    echo "With this global variable, you can print the name of the function before each instructions execution reported with the output of the « bash -x » command" >&2;
    echo >&2;

    return 0;
}

# Creating a function to print the correct values for the current option in different languages structures.
function BU.Main.Initializer.ProcessBadStatusOptionValues()
{
    BU.ModuleInit.Msg "$(printf "Warning : the supported values for the « %s » option are : %s" "$1" "$2")" >&2;
    BU.ModuleInit.Msg >&2;
}

# If arguments were given in the same double quotes as the "main" module's value.
if [ "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING" == "main --*" ]; then

	# Defining an array ($main_module_array) to store the module's arguments string as an array of words.
	read -ra main_module_array <<< "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING";

	# Unsetting the "main" value from the newly created array, in order to avoid an "unsupported argument" error.
	unset "main_module_array[0]";

	# Process each supported arguments in this "for" loop.
	for module_arg in "${main_module_array[@]}"; do

        # stat_value_warning="Warning : the supported values for this option are :" >&2;

        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN" "$value" >&2;

        echo -ne "${__BU_MAIN_COLOR_TXT_RESET}" >&2; echo >&2;

        echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN__ADVICE" >&2;

        # As the "Status.conf" file is sourced, the default global status variables values will be overwritten with the new values.
        if [[ "${module_arg,,}" == "--stat-"* ]]; then

            # shellcheck disable=SC2219
            let value;

            # --stat option argument, with all the global status variables that can be modified : main --stat='debug=true decho=restrict'
            # Extracting the "--stat" option's values.
            case "${module_arg,,}" in

                # "$__BU_MAIN_STAT_DECHO" global status variable.
                '--stat-decho='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'authorize' ]              || [ "${value,,}" == 'forbid' ]              || [ "${value,,}" == 'restrict' ]; then
                            __BU_MAIN_STAT_DECHO="$value";              BU.ModuleInit.DisplayInitGlobalVarsInfos  '__BU_MAIN_STAT_DECHO' "$__BU_MAIN_STAT_DECHO" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DECHO" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-decho" "« --stat-decho=authorize », « --stat-decho=forbid », « --stat-decho=restrict »";
                    fi;;

                # "$__BU_MAIN_STAT_ECHO" global status variable.
                '--stat-echo'*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'false' ]                  || [ "${value,,}" == 'true' ]; then
                            __BU_MAIN_STAT_ECHO="$value";               BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_ECHO' "$__BU_MAIN_STAT_ECHO" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ECHO" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-echo" "« --stat-echo=false », « stat-echo=true »";
                    fi;;

                # "$__BU_MAIN_STAT_ERROR" global status variable.
                '--stat-error='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'fatal' ]; then
                            __BU_MAIN_STAT_ERROR="$value";              BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_ERROR' "$__BU_MAIN_STAT_ERROR" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ERROR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");

                    elif    [ "${value,,}" == 'void' ]; then
                            __BU_MAIN_STAT_ERROR='';                    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_ERROR' "$__BU_MAIN_STAT_ERROR" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ERROR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-error" "« --stat-error=fatal », « stat-error=void »";
                    fi;;

                # "$__BU_MAIN_STAT_LOG" global status variable.
                '--stat-log='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'false' ]                  || [ "${value,,}" == 'true' ]; then
                            __BU_MAIN_STAT_LOG="$value";                BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_LOG' "$__BU_MAIN_STAT_LOG" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-log" "« --stat-log=false », « stat-log=true »";
                    fi;;

                # "$__BU_MAIN_STAT_LOG_REDIRECT" global status variable.
                'stat-log-r='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'log' ]                    || [ "${value,,}" == 'tee' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT="$value";       BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_LOG_REDIRECT' "$__BU_MAIN_STAT_LOG_REDIRECT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG_R" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");

                    elif    [ "${value,,}" == 'void' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT='';             BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_LOG_REDIRECT' "$__BU_MAIN_STAT_LOG_REDIRECT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG_R" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-log-r" "« --stat-log-r=log », « stat-log-r=tee », « --stat-log-r=void »";
                    fi;;

                # "$__BU_MAIN_STAT_OPERATE_ROOT" global status variable.
                '--stat-op-root='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'authorized' ]             || [ "${value,,}" == 'forbidden' ]           || [ "${value,,}" == 'restricted' ]; then
                            __BU_MAIN_STAT_OPERATE_ROOT="$value";       BU.ModuleInit.DisplayInitGlobalVarsInfos  '__BU_MAIN_STAT_OPERATE_ROOT' "$__BU_MAIN_STAT_OPERATE_ROOT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_OP_ROOT" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-op-root" "« --stat-op-root=authorized », « stat-op-root=forbidden », « --stat-op-root=restricted »";
                    fi;;

                # "$__BU_MAIN_STAT_TIME_HEADER" global status variable.
                '--stat-time-header='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      BU.Main.Checkings.IsPositiveFloat "$value"; then
                            __BU_MAIN_STAT_TIME_HEADER="$value";        BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TIME_HEADER' "$__BU_MAIN_STAT_TIME_HEADER" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_H" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-time-header" "« $(BU.Main.Decho.Decho.FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;

                # "$__BU_MAIN_STAT_TIME_NEWLINE" global status variable.
                '--stat-time-newline='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      BU.Main.Checkings.IsPositiveFloat "$value"; then
                            __BU_MAIN_STAT_TIME_NEWLINE="$value";       BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TIME_NEWLINE' "$__BU_MAIN_STAT_TIME_NEWLINE" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_N" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-time-newline" "« $(BU.Main.Decho.Decho.FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;

                # "$__BU_MAIN_STAT_TIME_TXT" global status variable.
                '--stat-time-txt='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      BU.Main.Checkings.IsPositiveFloat "$value"; then
                            __BU_MAIN_STAT_TIME_TXT="$value";           BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TIME_TXT' "$__BU_MAIN_STAT_TIME_TXT" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_T" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-time-txt" "« $(BU.Main.Decho.Decho.FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;

                # "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                '--stat-txt-fmt='*)
                    value="${module_arg#*=}";
                    value="${value% *}";

                    if      [ "${value,,}" == 'false' ]                  || [ "${value,,}" == 'true' ]; then
                            __BU_MAIN_STAT_TXT_FMT="$value";            BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TXT_FMT' "$__BU_MAIN_STAT_TXT_FMT" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TXT_FMT" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+=("$value");

                            # Debug : testing if the checking of the arguments works.
                            echo "--stat-txt-time value : $value";
                    else
                            BU.Main.Initializer.ProcessBadStatusOptionValues "--stat-txt-fmt" "« --stat-txt-fmt=false », « --stat-txt-fmt=true »";
                    fi;;

                # Any unsupported global status variable.
                *)
                            echo "IN « ${BASH_SOURCE[0]} », LINE « $(( LINENO-1 )) » --> WARNING : THE « $value » IS NOT A SUPPORTED STATUS ARGUMENT FOR THE $(BU.ModuleInit.GetModuleName "${BASH_SOURCE[0]}")" >&2;
                            echo >&2;

                            BU.Main.Initializer.Usage; ____bu_main_initializer__parse_args_list__loop_error='error'; break;
            esac

            if [ -z "$__BU_MAIN_INITIALIZER__STATUS_MODIFIED_BY_MAIN_MODULE_ARGS" ]; then __BU_MAIN_INITIALIZER__STATUS_MODIFIED_BY_MAIN_MODULE_ARGS='true'; fi

        elif [[ "${module_arg,,}" == '--dev-tools'* ]]; then
            if [ -n "$____bu_main_initializer__parse_args_list__dev_tools_arg__state" ] && [ "$____bu_main_initializer__parse_args_list__dev_tools_arg__state" == 'true' ]; then
                BU.Main.ModConfig.Module.BUDevToolsPaths;

                ____bu_main_initializer__parse_args_list__dev_tools_arg__state='true';
            fi

        # Else, if an unsupported value is passed as « main » module's argument.
        else
            # Temporary situation.
            BU.Main.Initializer.Usage; ____bu_main_initializer__parse_args_list__loop_error='error'; break;
        fi

    done; if [ "${____bu_main_initializer__parse_args_list__loop_error,,}" == 'error' ]; then if BU.ModuleInit.IsInScript; then exit 1; else unset ____bu_main_initializer__parse_args_list__loop_error; return 1; fi; fi
fi

# Unsetting the "$____bu_main_initializer__parse_args_list__loop_error" variable, since this code is not written inside a function.
unset ____bu_main_initializer__parse_args_list__loop_error;

unset ____bu_main_initializer__parse_args_list__dev_tools_arg__state;

# Checking if a new default status global variable's value was modified (passed as one of the « main » module's « --stat-* » arguments).
for value in "${__BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY[@]}"; do

    if [ "${value,,}" != '--stat-decho=authorize' ] && [ "${value,,}" != '--stat-decho-forbid' ] && [ "${value,,}" != '--stat-decho-restrict' ]; then
        BU.Main.Status.ChangeSTAT_DECHO        "authorize" 'main' "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi

    if [ "${value,,}" != '--stat-echo=false' ]      && [ "${value,,}" != '--stat-echo=true' ]; then
        BU.Main.Status.ChangeSTAT_ECHO         "false"     'main' "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi

    # Don't forget to set the "$__BU_MAIN_STAT_LOG_REDIRECT" value BEFORE calling a function which checks the value of the "$__BU_MAIN_STAT_LOG" value, since this function calls a function which creates the logs file.
    if [ "${value,,}" != '--stat-log-r=log' ]       && [ "${value,,}" != '--stat-log-r=tee' ]   && [ "${value,,}" != '--stat-log-r=void' ]; then
        BU.Main.Status.ChangeSTAT_LOG_REDIRECT "tee"       'main' "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi

    if [ "${value,,}" != '--stat-log=false' ]       && [ "${value,,}" != '--stat-true' ]; then

        # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
        BU.Main.Status.ChangeSTAT_LOG          "true"      'main' "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP FOUR : INCLUSION OF THE REST OF THE LIBRARY AND CONFIGURATION FILES

# Sourcing each library file stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.
BU.Main.Initializer.SourceLibrary || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# Sourcing each file listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.
BU.Main.Initializer.SourceConfig || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP FIVE : PROCESSING PROJECT'S RESOURCES

## CALLING NECESSARY FUNCTIONS

# Translating the main module's library messages
# BU.ModuleInit.ParseCSVLang "$__BU_MODULE_INIT__USER_LANG" "$__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM" || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

# Since the "CheckProjectLogFile()" function manages the text displaying if the log file doesn't exists, it's okay to call this function now.
BU.Main.Directories.MkTmpDir || { BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${LINENO}" 'E_BUINIT__BU_MAIN_INIT__CANNOT_MK_TMPDIR'; BU.ModuleInit.MsgAbort; BU.ModuleInit.AskPrintLog >&2 || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi }; if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

# Creating the text and background color code files if the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "true".
if BU.Main.Status.CheckStatAllowFormatting; then
    # If the file which contains the current foreground color code doesn't exists, then it must be created, and the file's creation message must be displayed.
    if [ ! -f "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" ]; then
        # Creating the text color code file
        if ! BU.Main.Checkings.CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME" "f"; then
            # shellcheck disable=SC2059
            BU.Main.Errors.HandleErrors "$?" "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__ERROR" "$(BU.Main.Decho.Path "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" "$(BU.Main.Decho.Decho.Highlight "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT")")" "" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$(( LINENO - 2 ))"; return 1;

        else
            # shellcheck disable=SC2059
            BU.Main.Echo.Success "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__SUCCESS" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" "$(BU.Main.Decho.Decho.Highlight "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT")")"; BU.Main.Echo.Newline;
        fi
    else
        # shellcheck disable=SC2059
        BU.Main.Echo.Success "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__EXISTS" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")")"; BU.Main.Echo.Newline;
    fi

    # If the file which contains the current background color file doesn't exists, then it must be created, and the file's creation message must be displayed.
    if [ ! -f "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH" ]; then
        # Creating the background color code file
        if ! BU.Main.Checkings.CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME")" 'f'; then
            # shellcheck disable=SC2059
            BU.Main.Errors.HandleErrors "$?" "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__ERROR" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH")" "$(BU.Main.Decho.Decho.Highlight "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT")")" '' "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$(( LINENO - 2 ))"; return 1;

        else
            # shellcheck disable=SC2059
            BU.Main.Echo.Success "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__SUCCESS" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH")" "$(BU.Main.Decho.Decho.Highlight "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT")")"; BU.Main.Echo.Newline;
        fi
    else
        # shellcheck disable=SC2059
        BU.Main.Echo.Success "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__EXISTS" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH")")"; BU.Main.Echo.Newline;
    fi
fi

# Creating the project's log file if the "$__BU_MAIN_STAT_LOG" global status variable's value is set to "true".
if BU.Main.Status.CheckStatIsLogging; then

    # If the file which stores every log entry doesn't exists, then it must be created.
    if [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
        if ! BU.Main.Checkings.CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then
            # shellcheck disable=SC2059
            BU.Main.Errors.HandleErrors '1' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_LOG_FILE__ERROR" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_LOG_FILE_PATH")" "$(BU.Main.Decho.Decho.Highlight "$__BU_MAIN_PROJECT_NAME")")" "" "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO";

            return 1;
        else
            # shellcheck disable=SC2059
            BU.Main.Echo.Success "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_LOG_FILE__SUCCESS" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_LOG_FILE_NAME")" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_LOG_FILE_PARENT")")"; BU.Main.Echo.Newline;
        fi
    else
        # shellcheck disable=SC2059
        BU.Main.Echo.Success "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_LOG_FILE__EXISTS" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_LOG_FILE_NAME")" "$(BU.Main.Decho.Decho.Path "$__BU_MAIN_PROJECT_LOG_FILE_PARENT")")"; BU.Main.Echo.Newline;
    fi
fi

# -----------------------------------------------

## END OF THE INITIALIZATION PROCESS OF THE "MAIN" MODULE.

__BU_MAIN_STAT_ECHO='true'
