#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : module-add-file-by-OS.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# Generating a library file with specific code for each supported operating system, with every basic stuff needed for each file :
#   - the file's informations,
#   - the script's description,
#   - the Shellcheck global disabler,
#   - the execution prevention safeguards,
#   - and the visual decorations.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### BASH DEPENDENCIES

## BASH UTILS

# Feel free to source any dependencies here if needed.

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL RESOURCES DEFINITION #############################################

########################################### PROJECT'S ARGUMENTS DEFINITIONS ###########################################

#### POSITIONAL ARGUMENTS

## FILE'S INFORMATIONS

# ARG TYPE : String
# REQUIRED
# DEFAULT VAL : NULL
# DESC : Target module's name.

__BU_MOD_ADD__ARG_MODULE_NAME=${1:-$'\0'};

# ARG TYPE : String
# REQUIRED
# DEFAULT VAL : NULL
# DESC : Name of the library file to create.

__BU_MOD_ADD__ARG_FILE_NAME=${2:-$'\0'};

# ARG TYPE : String
# REQUIRED
# DEFAULT VAL : NULL
# DESC : Name of the author of the library file to create.

__BU_MOD_ADD__ARG_AUTHOR_NAME=${3:-$'\0'};

# ARG TYPE : String
# OPTIONAL
# DEFAULT VAL : NULL
# DESC : Version of the library file to create.

__BU_MOD_ADD__ARG_FILE_VERSION=${4:-$'\0'};

[[ -n "${__BU_MOD_ADD__ARG_FILE_VERSION}" ]] && shift 4 || shift 3;

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAY OF ARGUMENTS

## OPERATING SYSTEMS SUPPORT

# ARG TYPE : Array
# REQUIRED
# DEFAULT VAL : NULL
# DESC : Array of operating systems names.
__BU_MOD_ADD__ARGS_OS_ARRAY=("${@}");

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## PROJECT'S GLOBAL VARIABLES DEFINITIONS #######################################

#### ARRAYS DEFINITIONS

## SUB-CATEGORY NAME

# Feel free to define arrays here if needed.

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITIONS

## SUB-CATEGORY NAME

# Path to the current module's directory.
__BU_MOD_ADD__GLOBVAR_MODULE_DIR="lib/functions/${__BU_MOD_ADD__ARG_MODULE_NAME}";

# Name of the current OS, respecting the case of the modules' OS folders names.

# Do not set a value now, it will be done in the program's main loop.
__BU_MOD_ADD__GLOBVAR_OS_NAME;

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### CATEGORY NAME

## SUB-CATEGORY NAME

# ························································
# Writing the file's informations section into the targeted file.

function WriteFileInformations()
{
    #**** Parameters ****
    local p_filepath=${1:-$'\0'}; # ARG TYPE : Filepath     - REQUIRED | DEFAULT VAL : NULL     - DESC : Path to the file where the file's informations have to be written.

    #**** Code ****
    if [ -z "${p_filepath}" ]; then echo "${FUNCNAME[0]}() function : file path argument required" >&2; echo >&2; return 1;

cat <<-EOF >> "${p_filepath}"
#!/usr/bin/env bash

# ---------------------
# FILE'S INFORMATIONS :

# Name          : \${p_filepath}
# Module        : \${__BU_MOD_ADD__ARG_MODULE_NAME}
# Author(s)     : \${__BU_MOD_ADD__ARG_AUTHOR_NAME}
# Version       : \${__BU_MOD_ADD__ARG_FILE_VERSION}


EOF
    return 0;
}

# ·························································
# Writing the script's description section into the targeted file.

function WriteScriptDescription()
{
    #**** Parameters ****
    local p_filepath=${1:-$'\0'}; # ARG TYPE : Filepath     - REQUIRED | DEFAULT VAL : NULL     - DESC : Path to the file where the file's informations have to be written.

    #**** Code ****
    if [ -z "${p_filepath}" ]; then echo "${FUNCNAME[0]}() function : file path argument required" >&2; echo >&2; return 1;

cat <<-EOF >> "${p_filepath}"
# ----------------------
# SCRIPT'S DESCRIPTION :

$([ -z "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" ]             && echo -n "# Functions used to process data and parameters about [ INSERT ${p_filepath} INFO ] with the help of the system commands";)
$([ "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" == 'Android' ]   && echo -n "# Functions used to process data and parameters about the device's [ INSERT ${p_filepath} INFO ] with the help of the system commands on an Android-based operating system.";)
$([ "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" == 'BSD' ]       && echo -n "# Functions used to process data and parameters about the computer's [ INSERT ${p_filepath} INFO ] with the help of the system commands on a BSD-based operating system.";)
$([ "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" == 'Haiku' ]     && echo -n "# This script manages the [ INSERT ${p_filepath} INFO ]-related hardware functionalities of the Haiku operating system.";)
$([ "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" == 'Linux' ]     && echo -n "# Functions used to process data and parameters about the computer's [ INSERT ${p_filepath} INFO ] with the help of the system commands on a Linux-based operating system.";)
$([ "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" == 'OSX' ]       && echo -n "# Functions used to process data and parameters about the Mac's [ INSERT ${p_filepath} INFO ] with the help of the OSX system's commands.";)
$([ "${__BU_MOD_ADD__GLOBVAR_OS_NAME}" == 'Windows' ]   && echo -n "# Functions used to process data and parameters about the PC's [ INSERT ${p_filepath} INFO ] with the help of the WSL / Windows system's commands.";)


EOF
    return 0;
}

# ·························································································
# Writing the Shellcheck and the pieces of code which prevent the direct execution of its host file.

function WriteShellcheckGlobalDisablerAndDirectExecutionPreventionCode()
{
    #**** Parameters ****
    local p_filepath=${1:-$'\0'}; # ARG TYPE : Filepath     - REQUIRED | DEFAULT VAL : NULL     - DESC : Path to the file where the file's informations have to be written.

    #**** Code ****
    if [ -z "${p_filepath}" ]; then echo "${FUNCNAME[0]}() function : file path argument required" >&2; echo >&2; return 1;

cat <<-EOF >> "${p_filepath}"
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT ADD A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE THE "$(shellcheck)" COMMAND WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC2154


# ----------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "${__BU_MAIN_FUNCTIONS_FILES_PATH}" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as it is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then if [[ "${LANG}" == de_* ]]; then
    echo -e "ACHTUNG !" >&2; echo >&2;
    echo -e "Dieses Shell-Skript (${BASH_SOURCE[0]}) ist nicht dazu gedacht, direkt ausgeführt zu werden !" >&2; echo >&2;
    echo -e "Verwenden Sie nur dieses Skript, indem Sie es in Ihr Projekt aufnehmen." >&2;

elif [[ "${LANG}" == es_* ]]; then
    echo -e "ATENCIÓN !" >&2; echo >&2;
    echo -e "Este script de shell (${BASH_SOURCE[0]}) no debe ejecutarse directamente !" >&2; echo >&2;
    echo -e "Utilice sólo este script incluyéndolo en el script de su proyecto." >&2;

elif [[ "${LANG}" == fr_* ]]; then
    echo -e "ATTENTION !" >&2; echo >&2;
    echo -e "Ce script shell (${BASH_SOURCE[0]}) n'est pas conçu pour être directement exécuté !" >&2; echo >&2;
    echo -e "Utilisez seulement ce script en l'incluant dans votre projet." >&2;

elif [[ "${LANG}" == id_* ]]; then
    echo -e "PERINGATAN !" >&2; echo >&2;
    echo -e "Skrip shell ini (${BASH_SOURCE[0]}) tidak dimaksudkan untuk dieksekusi secara langsung !" >&2; echo >&2;
    echo -e "Gunakan skrip ini hanya dengan memasukkannya ke dalam skrip proyek Anda." >&2;

elif [[ "${LANG}" == pt_* ]]; then
    echo -e "ATENÇÃO !" >&2; echo >&2;
    echo -e "Este script de shell (${BASH_SOURCE[0]}) não é para ser executado directamente !" >&2; echo >&2;
    echo -e "Utilize este guião apenas incluindo-o no seu projecto." >&2;

elif [[ "${LANG}" == ru_* ]]; then
    echo -e "ВНИМАНИЕ !" >&2; echo >&2;
    echo -e "Этот сценарий оболочки (${BASH_SOURCE[0]}) не предназначен для непосредственного выполнения !" >&2; echo >&2;
    echo -e "Используйте только этот скрипт, включив его в свой проект." >&2;

elif [[ "${LANG}" == uk_* ]]; then
    echo -e "УВАГА !" >&2; echo >&2;
    echo -e "Цей скрипт оболонки (${BASH_SOURCE[0]}) не призначений для безпосереднього виконання !" >&2; echo >&2;
    echo -e "Використовуйте тільки цей скрипт, включивши його в скрипт вашого проекту." >&2;

else
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2; echo >&2;
    echo -e "Use only this script by including it in your project script." >&2;

fi; echo >&2; exit 1; fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

####

##
EOF
    return 0;
}

# ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

####

## OPERATING SYSTEM-INDEPENDENT FILE

if [ -z "${__BU_MOD_ADD__ARG_MODULE_NAME}" ];   then echo "No specified module" >&2;    echo >&2; exit 1; fi

if [ -z "${__BU_MOD_ADD__ARG_FILE_NAME}" ];     then echo "No specified file" >&2;      echo >&2; exit 1; fi

# Creating the library file into the module's root directory.
if [ ! -f "${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__ARG_FILE_NAME}" ]; then
    touch "${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__ARG_FILE_NAME}";
else
    echo "The ${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__ARG_FILE_NAME} file already exists";
    echo;
fi

# ------------------------------------------------------------------------------------------------
# STEP ONE : Writing the "FILE'S INFORMATIONS :" section into each new files with a here document.

WriteFileInformations "${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__ARG_FILE_NAME}" || exit 1;

# -------------------------------------------------------------------------------------------------
# STEP TWO : Writing the "SCRIPT'S DESCRIPTION :" section into each new files with a here document.

WriteScriptDescription "${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__ARG_FILE_NAME}" || exit 1;

# ---------------------------------------------------------------------------------------------------------------------------------
# STEP THREE : Writing the "SHELLCHECK GLOBAL DISABLER :" section and the code which prevent the direct execution of its host file.

WriteShellcheckGlobalDisablerAndDirectExecutionPreventionCode "${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__ARG_FILE_NAME}" || exit 1;

## ----------------------------------------------

## OPERATING SYSTEM-DEPENDENT FILES

# Main loop.
for operating_system in "${__BU_MOD_ADD__ARGS_OS_ARRAY[@]}"; do
    # Setting a variable for the current operating system, as the input specified by the user may not respect the case of the OS folders names.
    if      [ "${operating_system,,}" == 'android' ];   then __BU_MOD_ADD__GLOBVAR_OS_NAME='Android';
    elif    [ "${operating_system^^}" == 'BSD' ];       then __BU_MOD_ADD__GLOBVAR_OS_NAME='BSD';
    elif    [ "${operating_system,,}" == 'haiku' ];     then __BU_MOD_ADD__GLOBVAR_OS_NAME='Haiku';
    elif    [ "${operating_system,,}" == 'linux' ];     then __BU_MOD_ADD__GLOBVAR_OS_NAME='Linux';
    elif    [ "${operating_system^^}" == 'OSX' ];       then __BU_MOD_ADD__GLOBVAR_OS_NAME='OSX';
    elif    [ "${operating_system,,}" == 'windows' ];   then __BU_MOD_ADD__GLOBVAR_OS_NAME='Windows';
    else
        echo "The ${operating_system} operating system is not supported" >&2;
        echo >&2;

        __ERR='error'; break 1;
    fi

    __OS_FILEPATH="${__BU_MOD_ADD__GLOBVAR_MODULE_DIR}/${__BU_MOD_ADD__GLOBVAR_OS_NAME}/${__BU_MOD_ADD__ARG_FILE_NAME}";

    # Creating the library file into the module's OS directory where it belongs.
    if [ ! -f "${__OS_FILEPATH}" ]; then
        touch "${__OS_FILEPATH}";
    else
        echo "The ${__OS_FILEPATH} file already exists" >&2;
        echo >&2;

        __ERR='error'; break 1;
    fi

    # ------------------------------------------------------------------------------------------------
    # STEP ONE : Writing the "FILE'S INFORMATIONS :" section into each new files with a here document.

    WriteFileInformations "${__OS_FILEPATH}" || { __ERR='error'; break 1; };

    # -------------------------------------------------------------------------------------------------
    # STEP TWO : Writing the "SCRIPT'S DESCRIPTION :" section into each new files with a here document.

    WriteScriptDescription "${__OS_FILEPATH}" || { __ERR='error'; break 1; };

    # ---------------------------------------------------------------------------------------------------------------------------------
    # STEP THREE : Writing the "SHELLCHECK GLOBAL DISABLER :" section and the code which prevent the direct execution of its host file.

    WriteShellcheckGlobalDisablerAndDirectExecutionPreventionCode "${__OS_FILEPATH}" || { __ERR='error'; break 1; };
done

if [ "${__ERR}" == 'error' ]; then exit 1; else exit 0; fi
