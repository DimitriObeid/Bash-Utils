#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Initializer.sh
# Module        : Main
# Description   : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s)     : Dimitri Obeid
# Version       : 1.0

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in the "Bash-utils-init.sh" file's function "BashUtils_InitModules()"

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################### INITIALIZING THE MAIN MODULE ##################################

#### STEP ONE : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Add value in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array that stores the initialization log output, according to the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array AND display text to the terminal.
#   "false" --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array WITHOUT displaying any text.
function InitializerAddInitStrArrayVal()
{
    #**** Parameters ****
    p_string=$1             # String to store in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array.
    p_option=$2             # "echo" command's options.

    #**** Code ****
    if [ "$__BU_MAIN_STAT_PRINT_INIT_LOG" = "true" ]; then
        case "$p_option" in
            '-n' | 'n')
                __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -ne "${p_string#* ] }"    # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
            '' | *)
                __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -e "${p_string#* ] }"     # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
        esac
    else
        __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string")
    fi
}

# -----------------------------------------------

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP TWO : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
InitializerAddInitStrArrayVal ""

# Sourcing each file listed into the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH" variable.

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || ModuleInit_SourcingFailure "$f" "$(ModuleInit_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")

	InitializerAddInitStrArrayVal "Successfully sourced this library file : $f"
done

# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
InitializerAddInitStrArrayVal ""

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || ModuleInit_SourcingFailure "$f" "$(ModuleInit_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")

	InitializerAddInitStrArrayVal "Successfully sourced this configuration file : $f"
done

# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
InitializerAddInitStrArrayVal ""

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP THREE : PROCESSING MODULE'S PARAMETERS

# If arguments were given in the same double quotes as the "main" module's value.
if [ "$__BU_MODULE_UTILS_MODULE_ARGS" = "main --*" ]; then

	# Defining a variable that transforms the module's argument string into an array of words.
	__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY=("${__BU_MODULE_UTILS_MODULE_ARGS}")

	# Process each supported arguments in this "for" loop.
	for value in "${__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY[@]}"; do

        stat_value_warning="$(echo "${__BU_MAIN_COLOR_WARNING}Warning : the « $value » value is incorrect.${__BU_MAIN_COLOR_RESET}" >&2; echo >&2; echo "Try these accepted values for this global status variable : ")"

		# --stat option argument, with all the global status variables that can be modified : main --stat='debug=true decho=restrict'
		# Extracting the "--stat" option's values.
        case "${value[i],,}" in
 
             # "$__BU_MAIN_STAT_DEBUG" global status variable.
           '--stat-debug='*)
                if      [ "${value[i],,}" = "--stat-debug=false" ]          || [ "${value[i],,}" = "--stat-debug=true" ]; then
                        __BU_MAIN_STAT_DEBUG="${value#*=}"
                else
                    ModuleInit_Msg "$stat_value_warning « --stat-debug=false », « --stat-debug=true »"
                fi;;

            # "$__BU_MAIN_STAT_DECHO" global status variable.
            '--stat-decho='*)
                if      [ "${value[i],,}" = '--stat-decho=authorize' ]      || [ "${value[i],,}" = '--stat-decho=forbid' ]  || [ "${value[i],,}" = '--stat-decho=restrict' ]; then
                        __BU_MAIN_STAT_DECHO="${value#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-decho=authorize », « --stat-decho=forbid », « --stat-decho=restrict »"
                fi;;

            # "$__BU_MAIN_STAT_ECHO" global status variable.
            '--stat-echo'*)
                if      [ "${value[i],,}" = '--stat-echo=false' ]           || [ "${value[i],,}" = '--stat-echo=true' ]; then
                        __BU_MAIN_STAT_ECHO="${value#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-echo=false », « stat-echo=true »"
                fi;;

            # "$__BU_MAIN_STAT_ERROR" global status variable.
            'stat-error='*)
                if      [ "${value[i],,}" = 'stat-error=fatal' ]; then
                        __BU_MAIN_STAT_ERROR="${value#*=}"

                elif    [ "${value[i],,}" = 'stat-error=void' ]; then
                        __BU_MAIN_STAT_ERROR=''
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-error=fatal », « stat-error=void »"
                fi;;

            # "$__BU_MAIN_STAT_LOG" global status variable.
            '--stat-log='*)
                if      [ "${value[i],,}" = '--stat-log=false' ]            || [ "${value[i],,}" = '--stat-log=true' ]; then
                        __BU_MAIN_STAT_LOG="${value#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-log=false », « stat-log=true »"
                fi;;

            # "$__BU_MAIN_STAT_LOG_REDIRECT" global status variable.
            'stat-log-r='*)
                if      [ "${value[i],,}" = 'stat-log-r=log' ]              || [ "${value[i],,}" = '--stat-log-r=tee' ]; then
                        __BU_MAIN_STAT_LOG_REDIRECT="${value#*=}"

                elif    [ "${value[i],,}" = '--stat-log-r=void' ]; then
                        __BU_MAIN_STAT_LOG_REDIRECT=''
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-log-r=log », « stat-log-r=tee », « --stat-log-r=void »"
                fi;;

            # "$__BU_MAIN_STAT_OPERATE_ROOT" global status variable.
            '--stat-op-root='*)
                if      [ "${value[i],,}" = '--stat-op-root=authorized' ]   || [ "${value[i],,}" = '--stat-op-root=forbidden' ] || [ "${value[i],,}" = '--stat-op-root=restricted' ]; then
                        __BU_MAIN_STAT_OPERATE_ROOT="${value#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-op-root=authorized », « stat-op-root=forbidden », « --stat-op-root=restricted »"
                fi;;

            # "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable.
            '--stat-print-init-log='*)
                if      [ "${value[i],,}" = '--stat-print-init-log=false' ] || [ "${value[i],,}" = '--stat-print-init-log=true' ]; then
                        __BU_MAIN_STAT_PRINT_INIT_LOG="${value#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning --stat-print-init-log=false », « stat-print-init-log=true »"
                fi;;

            # "$__BU_MAIN_STAT_TIME_HEADER" global status variable.
            '--stat-time-header='*)
                if      [ "${value[i],,}" = "--stat-time-header=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                        __BU_MAIN_STAT_TIME_HEADER="${value[i]#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_HIGHLIGHT") »"
                fi;;

            # "$__BU_MAIN_STAT_TIME_TXT" global status variable.
            '--stat-time-txt='*)
                if      [ "${value[i],,}" = "--stat-time-txt=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                        __BU_MAIN_STAT_TIME_TXT="${value[i]#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_HIGHLIGHT") »"
                fi;;

            # "$__BU_MAIN_STAT_TXT_FMT" global status variable.
            '--stat-txt-fmt'*)
                if      [ "${value[i],,}" = '--stat-txt-fmt=false' ]        || [ "${value[i],,}" = '--stat-txt-fmt=true' ]; then
                        __BU_MAIN_STAT_TXT_FMT="${value#*=}"
                else
                        ModuleInit_Msg "$stat_value_warning « --stat-txt-fmt=false », « --stat-txt-fmt=true »"
                fi;;
            *)
                        ModuleInit_Msg "IN « ${BASH_SOURCE[0]} », LINE « $(( LINENO-1 )) » --> WARNING : THE « $value » IS NOT A SUPPORTED ARGUMENT FOR THE $(ModuleInit_GetModuleName "")"
        esac
    done


# 				# -------- __BU_MAIN_STAT_TXT_FMT global status variable
# 
#                 if [ "$stat_value" = 'stat-txt-fmt=true' ] || [ "$stat_value" = 'stat-txt-fmt=false' ]; then
#                     __BU_MAIN_STAT_TXT_FMT="${stat_value#*=}"
#                 else
# 					echo "$stat_value_warning true, false"
#             	fi
# 			done

		# Else, if no "--stat" argument is passed, then the default values are set to each status global variables.
# 		else
# 			## CHANGING THE GLOBAL STATUS VARIABLE'S VALUES AFTER THE MAIN MODULE'S SUCCESSFUL INITIALIZATION.
# 
#             # Note : only some variables are changed, the other variables values are still set to their default value.
# 
# 			# TODO : After adding the status configuration arguments,
# 			if [ -f "$(ModuleInit_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR/$v_module_name/" "ChangeStat.conf")" ]; then
# 				echo "STAT"
# 			else
# 				BU::Main:Status::ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 
# 				BU::Main:Status::ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 				BU::Main:Status::ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 				BU::Main:Status::ChangeSTAT_TIME_TXT     '0'         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 
#                 # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
# 				BU::Main:Status::ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 			fi
# 
# 		# Else, if an unsupported argument is passed.
# 	#	else
# 	#		echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-1 )) --> WARNING : THE « $value » ARGUMENT IS NOT SUPPORTED" >&2
# 		fi
# 	done
fi



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP FOUR : PROCESSING PROJECT'S RESOURCES

## CALLING NECESSARY FUNCTIONS

# Since the "CheckProjectLogFile()" function manages the text displaying if the log file doesn't exists, it's okay to call this function now.
BU::Main::Directories::MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

# Creating the color code file if the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "true".
if BU::Main::Status::CheckStatAllowFormatting; then
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then
        BU::Main::Errors::HandleErrors '1' "UNABLE TO CREATE THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") COLOR CODE FILE" "" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"; return 1
    else
        BU::EchoSuccess "The $(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") color code file was successfully created in the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT")"; BU::Newline
    fi
fi

# Creating the project's log file if the "$__BU_MAIN_STAT_LOG" global status variable's value is set to "true".
if BU::Main::Status::CheckStatIsLogging; then
	if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then
		BU::Main::Errors::HandleErrors '1' "UNABLE TO CREATE THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") LOG FILE FOR THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")" "" "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"

		return 1
	else
		BU::EchoSuccess "The $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_NAME") log file was successfully created in the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PARENT")"; BU::Newline
	fi
fi

# -----------------------------------------------

# -----------------------------------------------

## END OF THE "MAIN" MODULE INITIALIZATION PROCESS


# ---------

## JUNK

# Future functionnality : translating the library.
# BU::Main::Files::SourceFile "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/SetLibLang.sh"
# GetLibLang
