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
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

    exit 1;
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################### INITIALIZING THE MAIN MODULE ##################################

#### STEP ONE : DEFINING THE NEEDED RESOURCES

## FUNCTIONS

# Sourcing each library file stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.
function BU::Main::Initializer::SourceLibrary()
{
	# Leaving a newline for a better text display in the log file and the terminal.
	BU::ModuleInit::Msg;

	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY[@]}"; do
		source "$f" || { BU::ModuleInit::SourcingFailure "$f" "$(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f"); return 1; }

		# shellcheck disable=SC2059
		BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_LIBRARY" "$f")";
	done

	# Leaving a newline for a better text display in the log file and the terminal.
	BU::ModuleInit::Msg;

	return 0;
}

# Sourcing each file listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.
function BU::Main::Initializer::SourceConfig()
{
	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
		source "$f" || { BU::ModuleInit::SourcingFailure "$f" "$(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f"); return 1; }

		# shellcheck disable=SC2059
		BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_CONFIG" "$f")";
	done

	# Leaving a newline for a better text display in the log file and the terminal.
	BU::ModuleInit::Msg;

	return 0;
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP TWO : PROCESSING THE MAIN MODULE'S PARAMETERS

# Usage function.
function BU::Main::Initializer::Usage()
{
    echo >&2; echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE__SUPPORTED_ARGS" >&2;

    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_______DEBUG" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_______DECHO" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE________ECHO" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_______ERROR" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_________LOG" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_______LOG_R" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_____OP_ROOT" >&2;
    echo >&2;

    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE______TIME_H" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE______TIME_N" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE______TIME_T" >&2;
    echo >&2;

    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__USAGE_____TXT_FMT" >&2;
    echo >&2;

    echo >&2;
    echo "Note : The << Debug by file >> variable is an array and can store these variables in order to specify which category of functions by file can be debugged" >&2;
    echo "Here are the accepted values for the Args.lib file :" >&2;
    echo "" >&2;
    echo "" >&2;
    echo "" >&2;
    echo "" >&2;

    return 0;
}

# If arguments were given in the same double quotes as the "main" module's value.
if [ "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING" = "main --*" ]; then

	# Defining an array ($main_module_array) to store the module's arguments string as an array of words.
	read -ra main_module_array <<< "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING";

	# Unsetting the "main" value from the newly created array, in order to avoid an "unsupported argument" error.
	unset "main_module_array[0]";

	# Process each supported arguments in this "for" loop.
	for value in "${main_module_array[@]}"; do

        stat_value_warning="$(echo -ne "${__BU_MAIN_COLOR_TXT_WARNING}" >&2;

        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__BAD_VALUE_GIVEN" "$value" >&2;

        echo -ne "${__BU_MAIN_COLOR_TXT_RESET}" >&2; echo >&2;

        echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__BAD_VALUE_GIVEN__ADVICE" >&2)";

        if [[ "${value[i],,}" = "--stat-"* ]]; then
            # --stat option argument, with all the global status variables that can be modified : main --stat='debug=true decho=restrict'
            # Extracting the "--stat" option's values.
            case "${value[i],,}" in

                # "$__BU_MAIN_STAT_DEBUG" global status variable.
            '--stat-debug='*)
                    if      [ "${value[i],,}" = "--stat-debug=false" ]          || [ "${value[i],,}" = "--stat-debug=true" ]; then
                            __BU_MAIN_STAT_DEBUG="${value#*=}";                 BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_DEBUG" "$__BU_MAIN_STAT_DEBUG" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_DEBUG" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                        BU::ModuleInit::Msg "$stat_value_warning « --stat-debug=false », « --stat-debug=true »";
                    fi;;

                # "$__BU_MAIN_STAT_DECHO" global status variable.
                '--stat-decho='*)
                    if      [ "${value[i],,}" = '--stat-decho=authorize' ]      || [ "${value[i],,}" = '--stat-decho=forbid' ]  || [ "${value[i],,}" = '--stat-decho=restrict' ]; then
                            __BU_MAIN_STAT_DECHO="${value#*=}";                 BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_DECHO" "$__BU_MAIN_STAT_DECHO" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_DECHO" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-decho=authorize », « --stat-decho=forbid », « --stat-decho=restrict »";


                    fi;;

                # "$__BU_MAIN_STAT_ECHO" global status variable.
                '--stat-echo'*)
                    if      [ "${value[i],,}" = '--stat-echo=false' ]           || [ "${value[i],,}" = '--stat-echo=true' ]; then
                            __BU_MAIN_STAT_ECHO="${value#*=}";                  BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_ECHO" "$__BU_MAIN_STAT_ECHO" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_ECHO" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-echo=false », « stat-echo=true »";
                    fi;;

                # "$__BU_MAIN_STAT_ERROR" global status variable.
                'stat-error='*)
                    if      [ "${value[i],,}" = 'stat-error=fatal' ]; then
                            __BU_MAIN_STAT_ERROR="${value#*=}";                 BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_ERROR" "$__BU_MAIN_STAT_ERROR" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_ERROR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";

                    elif    [ "${value[i],,}" = 'stat-error=void' ]; then
                            __BU_MAIN_STAT_ERROR='';                            BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_ERROR" "$__BU_MAIN_STAT_ERROR" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_ERROR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-error=fatal », « stat-error=void »";
                    fi;;

                # "$__BU_MAIN_STAT_LOG" global status variable.
                '--stat-log='*)
                    if      [ "${value[i],,}" = '--stat-log=false' ]            || [ "${value[i],,}" = '--stat-log=true' ]; then
                            __BU_MAIN_STAT_LOG="${value#*=}";                   BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_LOG" "$__BU_MAIN_STAT_LOG" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_LOG" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-log=false », « stat-log=true »";
                    fi;;

                # "$__BU_MAIN_STAT_LOG_REDIRECT" global status variable.
                'stat-log-r='*)
                    if      [ "${value[i],,}" = 'stat-log-r=log' ]              || [ "${value[i],,}" = '--stat-log-r=tee' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT="${value#*=}";          BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_LOG_REDIRECT" "$__BU_MAIN_STAT_LOG_REDIRECT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_LOG_R" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";

                    elif    [ "${value[i],,}" = '--stat-log-r=void' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT='';                     BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_LOG_REDIRECT" "$__BU_MAIN_STAT_LOG_REDIRECT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_LOG_Rs" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-log-r=log », « stat-log-r=tee », « --stat-log-r=void »";
                    fi;;

                # "$__BU_MAIN_STAT_OPERATE_ROOT" global status variable.
                '--stat-op-root='*)
                    if      [ "${value[i],,}" = '--stat-op-root=authorized' ]   || [ "${value[i],,}" = '--stat-op-root=forbidden' ] || [ "${value[i],,}" = '--stat-op-root=restricted' ]; then
                            __BU_MAIN_STAT_OPERATE_ROOT="${value#*=}";          BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_OPERATE_ROOT" "$__BU_MAIN_STAT_OPERATE_ROOT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_OP_ROOT" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-op-root=authorized », « stat-op-root=forbidden », « --stat-op-root=restricted »";
                    fi;;

                # "$__BU_MAIN_STAT_TIME_HEADER" global status variable.
                '--stat-time-header='*)
                    if      [ "${value[i],,}" = "--stat-time-header=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_HEADER="${value[i]#*=}";        BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TIME_HEADER" "$__BU_MAIN_STAT_TIME_HEADER" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_TIME_H" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;

                # "$__BU_MAIN_STAT_TIME_NEWLINE" global status variable.
                '--stat-time-newline='*)
                    if      [ "${value[i],,}" = "--stat-time-newline=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_NEWLINE="${value[i]#*=}";       BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TIME_NEWLINE" "$__BU_MAIN_STAT_TIME_NEWLINE" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_TIME_N" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;

                # "$__BU_MAIN_STAT_TIME_TXT" global status variable.
                '--stat-time-txt='*)
                    if      [ "${value[i],,}" = "--stat-time-txt=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_TXT="${value[i]#*=}";           BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TIME_TXT" "$__BU_MAIN_STAT_TIME_TXT" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_TIME_T" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;

                # "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                '--stat-txt-fmt='*)
                    if      [ "${value[i],,}" = '--stat-txt-fmt=false' ]        || [ "${value[i],,}" = '--stat-txt-fmt=true' ]; then
                            __BU_MAIN_STAT_TXT_FMT="${value#*=}";               BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TXT_FMT" "$__BU_MAIN_STAT_TXT_FMT" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_TWO__STAT_GLOB_VAR_DESC_TXT_FMT" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";

                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::ModuleInit::Msg "$stat_value_warning « --stat-txt-fmt=false », « --stat-txt-fmt=true »";
                    fi;;

                # Any unsupported global status variable.
                *)
                            BU::ModuleInit::Msg "IN « ${BASH_SOURCE[0]} », LINE « $(( LINENO-1 )) » --> WARNING : THE « $value » IS NOT A SUPPORTED STATUS ARGUMENT FOR THE $(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")";

                            BU::Main::Initializer::Usage; exit 1;
            esac

        # Else, if an unsupported value is passed as « main » module's argument.
        else
            # Temporary situation.
            BU::Main::Initializer::Usage; exit 1;
        fi
    done
fi

# Checking if a new default status global variable's value was modified (passed as one of the « main » module's « --stat-* » arguments).
for value in "${__BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY[@]}"; do

    if [ "${value,,}" != '--stat-decho=authorize' ] && [ "${value,,}" != '--stat-decho-forbid' ] && [ "${value,,}" != '--stat-decho-restrict' ]; then
        BU::Main::Status::ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi

    if [ "${value,,}" != '--stat-echo=false' ]      && [ "${value,,}" != '--stat-echo=true' ]; then
        BU::Main::Status::ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi

    # Don't forget to set the "$__BU_MAIN_STAT_LOG_REDIRECT" value BEFORE calling a function which checks the value of the "$__BU_MAIN_STAT_LOG" value, since this function calls a function which creates the logs file.
    if [ "${value,,}" != '--stat-log-r=log' ]       && [ "${value,,}" != '--stat-log-r=tee' ]   && [ "${value,,}" != '--stat-log-r=void' ]; then
        BU::Main::Status::ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi

    if [ "${value,,}" != '--stat-log=false' ]       && [ "${value,,}" != '--stat-true' ]; then

        # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
        BU::Main::Status::ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP THREE : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Sourcing each library file stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.
BU::Main::Initializer::SourceLibrary;

# -----------------------------------------------

## CALLING THE TRANSLATION FUNCTION

# Translating the main module's library messages
BU::ModuleInit::ParseCSVLang "$__BU_MODULE_INIT_USER_LANG" "$__BU_MODULE_INIT_CSV_TRANSLATION_FILE_DELIM";

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# TODO : avoid the overwriting of the status variables defined with the "main" module's arguments.


# Sourcing each file listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.
BU::Main::Initializer::SourceConfig;

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP FOUR : PROCESSING PROJECT'S RESOURCES

## CALLING NECESSARY FUNCTIONS

# Since the "CheckProjectLogFile()" function manages the text displaying if the log file doesn't exists, it's okay to call this function now.
BU::Main::Directories::MkTmpDir;

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

# Creating the text and background color code file if the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "true".
if BU::Main::Status::CheckStatAllowFormatting; then

    # Creating the text color code file
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME" "f"; then
        # shellcheck disable=SC2059
        BU::Main::Errors::HandleErrors '1' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_TXT_COL_FILE__ERROR" "$(BU::DechoPath "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT")")" "" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"; return 1;

    else
        # shellcheck disable=SC2059
        BU::EchoSuccess "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_TXT_COL_FILE__SUCCESS" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT")")"; BU::Newline;
    fi

    # Creating the background color code file
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME" 'f'; then
        # shellcheck disable=SC2059
        BU::Main::Errors::HandleSmallErrors 'E' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_BG_COL_FILE__ERROR" "$(BU::Decho "$__BU_MAIN_PROJECT_COLOR_TEXT_BG_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT")")" 'E' 'CPLS'; return 1;

    else
        # shellcheck disable=SC2059
        BU::EchoSuccess "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_BG_COL_FILE__SUCCESS" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT")")"; BU::Newline;
    fi
fi

# Creating the project's log file if the "$__BU_MAIN_STAT_LOG" global status variable's value is set to "true".
if BU::Main::Status::CheckStatIsLogging; then
	if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then
        # shellcheck disable=SC2059
		BU::Main::Errors::HandleErrors '1' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_LOG_FILE__ERROR" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")")" "" "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO";

		return 1;
	else
        # shellcheck disable=SC2059
		BU::EchoSuccess "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_LOG_FILE__SUCCESS" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_NAME")" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PARENT")")"s; BU::Newline;
	fi
fi

# -----------------------------------------------

# -----------------------------------------------

## END OF THE "MAIN" MODULE INITIALIZATION PROCESS

__BU_MAIN_STAT_ECHO='true'
