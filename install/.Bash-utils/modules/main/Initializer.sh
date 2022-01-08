#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Initializer.sh
# Description : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s) : Dimitri Obeid
# Version : 1.0

# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This script is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

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

# Sourcing each file listed into the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH" variable.
function BUMain_SourceLib()
{
	# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
	InitializerAddInitStrArrayVal ""

	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH[@]}"; do
		source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")

		InitializerAddInitStrArrayVal "Successfully sourced this library file : $f"
	done

	# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
	InitializerAddInitStrArrayVal ""
}

BUMain_SourceLib

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")

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
	for value in "$__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY"; do

		# --stat option argument, with all the global status variables that can be modified : main --stat='debug=true decho=restrict'
		# Extracting the "--stat" option's values.
		if [ "$__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY[i]" = "--stat=*" ]; then


			# TODO : get the --stat option's values between its single quotes, with a command called in this variable declaration.
			__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY_STAT="$__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY[i]"
			echo "$__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY[i]"

			# Creating a new array of words for the supported "--stat" option's values.
			# The __BU_MAIN_STAT_INITIALIZING value change is NOT supported, this status global variable's value MUST stay untouched.
			for stat_value in "${__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY_STAT[@]}"; do

				stat_value_warning="$(echo "${__BU_MAIN_COLOR_WARNING}Warning : the « ${stat_value#*=} » value is incorrect.${__BU_MAIN_COLOR_RESET}" >&2; echo >&2; echo "Try these accepted values for this global status variable : ")"

				# -------- __BU_MAIN_STAT_DEBUG global status variable

				if [ "$stat_value" = 'debug=false' ] || [ "$stat_value" = 'debug=true' ]; then
					__BU_MAIN_STAT_DEBUG="${stat_value#*=}"
				else
					echo "$stat_value_warning false, true"
				fi


				# -------- __BU_MAIN_STAT_DECHO global status variable

				if   [ "$stat_value" = 'decho=authorize' ] || [ "$stat_value" = 'decho=restrict' ]; then
					 # Warning : don't set the « __BU_MAIN_STAT_DECHO » global status variable's value to "authorize" or "restrict" during the script's initialization, in order to avoid bugs.
					 # Instead, a variable is set, and the "__BU_MAIN_STAT_DECHO" value will be set to this value after the initialization.
					 __BU_MAIN_STAT_DECHO_TMP="${stat_value#*=}"

				elif [ "$stat_value" = 'decho=forbid' ]; then
					__BU_MAIN_STAT_DECHO='forbid'
				else
					echo "$stat_value_warning authorize, restrict, forbid"
				fi


				# -------- __BU_MAIN_STAT_ECHO global status variable

				if   [ "$stat_value" = 'echo=false' ]; then
					 # Warning : don't set the « __BU_MAIN_STAT_ECHO » global status variable's value to "false" during the script's initialization, in order to avoid bugs and infinite loops.
					 # Instead, a variable is set, and the "__BU_MAIN_STAT_ECHO" value will be set to this value after the initialization.
					__BU_MAIN_STAT_ECHO_TMP="false"

				elif [ "$stat_value" = 'echo=true' ]; then
					__BU_MAIN_STAT_ECHO='true'
				else
					echo "$stat_value_warning true, false"
				fi
				
				
				# -------- __BU_MAIN_STAT_ERROR global status variable

				if   [ "$stat_value" = 'error=fatal' ]; then
					__BU_MAIN_STAT_ERROR='fatal'

				elif [ "$stat_value" = 'error=void' ]; then
					__BU_MAIN_STAT_ERROR=''
				else
					echo "$stat_value_warning fatal, \e[3man empty string\e[0m"
				fi


				# -------- __BU_MAIN_STAT_LOG global status variable

				if [ "$stat_value" = 'log=true' ] || [ "$stat_value" = 'log=false' ]; then
					__BU_MAIN_STAT_LOG="${stat_value#*=}"
				else
					echo "$stat_value_warning true, false"
				fi


				# -------- __BU_MAIN_STAT_LOG_REDIRECT global status variable

				if [ "$stat_value" = 'log-redirect=void' ]; then
					__BU_MAIN_STAT_LOG_REDIRECT=''

				elif [ "$stat_value" = 'log-redirect=log' ] || [ "$stat_value" = 'log-redirect=tee' ]; then
					__BU_MAIN_STAT_LOG_REDIRECT="${stat_value#*=}"
				else
					echo "$stat_value_warning log, tee, \e[3man empty string\e[0m"
				fi


				# -------- __BU_MAIN_STAT_OPERATE_ROOT global status variable

				if [ "$stat_value" = 'op-root=authorized' ] || [ "$stat_value" = 'op-root=forbidden' ] || [ "$stat_value" = 'op-root=restricted' ]; then
					__BU_MAIN_STAT_OPERATE_ROOT="${stat_value#*=}"
				else
					echo "$stat_value_warning authorized, forbidden, restricted"
				fi


				# -------- __BU_MAIN_STAT_PRINT_INIT_LOG global status variable

				if [ "$stat_value" = 'print-init-log=true' ] || [ "$stat_value" = 'print-init-log=false' ]; then
					__BU_MAIN_STAT_PRINT_INIT_LOG="${stat_value#*=}"
				else
					echo "$stat_value_warning true, false"
				fi


				# -------- __BU_MAIN_STAT_TIME_TXT global status variable

				if [ "$stat_value" = "stat-time-txt=$(IsFloat "$stat_value#*=")" ]; then
					__BU_MAIN_STAT_TIME_TXT="$stat_value"
				else
					echo "$stat_value_warning \e[3ma floating number\e[0m"
				fi


				# -------- __BU_MAIN_STAT_TXT_FMT global status variable

				if [ "$stat_value" = 'stat-txt-fmt=true' ] || [ "$stat_value" = 'stat-txt-fmt=false' ]; then
					__BU_MAIN_STAT_TXT_FMT="${stat_value#*=}"
				else
					echo "$stat_value_warning true, false"
				fi
			done

		# Else, if no "--stat" argument is passed, then the default values are set to each status global variables.
		else
			## CHANGING THE GLOBAL STATUS VARIABLE'S VALUES AFTER THE MAIN MODULE'S SUCCESSFUL INITIALIZATION.

			# TODO : After adding the status configuration arguments, 
			if [ -f "$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR/$v_module_name/" "ChangeStat.conf")" ]; then
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

		# Else, if an unsupported argument is passed.
	#	else
	#		echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-1 )) --> WARNING : THE « $value » ARGUMENT IS NOT SUPPORTED" >&2
		fi
	done
fi



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP FOUR : PROCESSING PROJECT'S RESOURCES

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS AND CREATING THE PROJECT'S TEMPORARY FOLDER

# ChangeSTAT_ERROR        "fatal"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# ChangeSTAT_TIME_TXT     "0"         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# ChangeSTAT_TXT_FMT      "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# Since the "CheckProjectLogFile()" function manages the text displaying if the log file doesn't exists, it's okay to call this function now.
MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then
	HandleErrors '1' "UNABLE TO CREATE THE $(DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") COLOR CODE FILE" "" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"; return 1
else
	EchoSuccess ""
fi

# Creating the project's log file if the "$__BU_MAIN_STAT_LOG" global status variable's value is set to "true".
if CheckStatIsLogging; then
	if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then
		HandleErrors '1' "UNABLE TO CREATE THE $(DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") LOG FILE FOR THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME")" "" "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"

		return 1
	fi
fi

# -----------------------------------------------

# -----------------------------------------------

## END OF THE "MAIN" MODULE INITIALIZATION PROCESS


# ---------

## JUNK

# Future functionnality : translating the library.
# SourceFile "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/SetLibLang.sh"
# GetLibLang