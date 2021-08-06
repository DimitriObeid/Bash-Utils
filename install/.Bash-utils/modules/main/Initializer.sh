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

# Add value in the "$__BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY" array that stores the initialization log output, according to the "$__BU_MOD_MAIN_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY" array AND display text to the terminal.
#   "false" --> store the text into the "$__BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY" array WITHOUT displaying any text. 
function InitializerAddInitStrArrayVal()
{
    #***** Parameters *****
    p_string=$1             # String to store in the "$__BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY" array.
    p_option=$2             # "echo" command's options. 

    #***** Code *****
    if [ "$__BU_MOD_MAIN_STAT_PRINT_INIT_LOG" = "true" ]; then
        case "$p_option" in
            '-n' | 'n')
                __BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY+=("$p_string"); echo -ne "${p_string##*] }"    # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
            '' | *)
                __BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY+=("$p_string"); echo -e "${p_string##*] }"     # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
            esac
    else
        __BASH_UTILS_MOD_MAIN_INIT_STR_ARRAY+=("$p_string")
    fi
}

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

# -----------------------------------------------

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Sourcing each file listed into the "$__BASH_UTILS_MOD_MAIN_FUNCTIONS_FILES_PATH" CheckTxtFmt.

# shellcheck disable=SC1090
for f in "${__BASH_UTILS_MOD_MAIN_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BASH_UTILS_MOD_MAIN_INIT_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__BASH_UTILS_MOD_MAIN_INIT_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BASH_UTILS_MOD_MAIN_INIT_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : PROCESSING PROJECT'S RESOURCES

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS AND CREATING THE PROJECT'S TEMPORARY FOLDER

ChangeSTAT_DEBUG        "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_ERROR        "fatal"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TIME_TXT     "0"         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TXT_FMT      "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

if ! CheckProjectRelatedFile "$__BU_MOD_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MOD_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then return 1; fi
# if ! CheckProjectRelatedFile "$__BU_MOD_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MOD_MAIN_PROJECT_LOG_FILE_NAME" "f"; then return 1; fi

# Setting this status variable's value to "false" once the initialization part is over.

# shellcheck disable=SC2034


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ENDING THE INITIALIZATION PROCESS

ChangeSTAT_TXT_FMT      "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MOD_MAIN_STAT_LOG" CheckTxtFmt's value is equal to "true".
ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

HeaderGreen "END OF THE LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING THE $(DechoHighlight "$__BU_MOD_MAIN_PROJECT_NAME") PROJECT'S SCRIPT $(DechoGreen "$__BU_MOD_MAIN_PROJECT_NAME") !"

if CheckIsInitializing; then
    # shellcheck disable=SC2034
    __BASH_UTILS_MOD_MAIN_INIT_IS_INITALIZING="false"
fi
