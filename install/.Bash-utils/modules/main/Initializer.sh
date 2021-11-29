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

#### FIRST STEP : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Add value in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array that stores the initialization log output, according to the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array AND display text to the terminal.
#   "false" --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array WITHOUT displaying any text.
function InitializerAddInitStrArrayVal()
{
    #***** Parameters *****
    p_string=$1             # String to store in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array.
    p_option=$2             # "echo" command's options.

    #***** Code *****
    # Checking if the program is allowed to print the initialization logs on the terminal.
    if CheckStatIsPrintingInit; then
        # 
        if [[ "$p_string" = "[ $__BU_MAIN_TIME_DATE_DISPLAY ] *" ]]; then
            # Creating a variable to store temporarly the log date's string to remove.
            local v_tmp="${p_string%}"
            local v_log_date="[ $__BU_MAIN_TIME_DATE_DISPLAY ] "

            case "$p_option" in
                '-n' | 'n')
                    __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -ne "${p_string##* ] }"    # Cutting the log entry's date from a string, before displaying it on the terminal.
                    ;;
                '' | *)
                    __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -e "${p_string##* ] }"     # Cutting the log entry's date from a string, before displaying it on the terminal.
                    ;;
            esac
        fi
    else
        __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string")
    fi
}

# -----------------------------------------------

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Sourcing each file listed into the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH" variable.

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : PROCESSING PROJECT'S RESOURCES

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS AND CREATING THE PROJECT'S TEMPORARY FOLDER

ChangeSTAT_ERROR        "fatal"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TIME_TXT     "0"         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TXT_FMT      "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then return 1; fi
if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then return 1; fi

# Future functionnality : translating the library.
SourceFile "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/SetLibLang.sh"
GetLibLang

# -----------------------------------------------

## END OF THE MODULE INITIALIZATION PROCESS
