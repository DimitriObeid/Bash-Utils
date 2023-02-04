#!/usr/bin/env bash
# ------------------------

## SCRIPT'S INFORMATIONS :
# Name                  : ${__compiled_file_name}.sh
# Code's Author(s)      : Dimitri OBEID
# Compilation athor(s)  : $([ -n "$__COMPILATION_AUTHOR" ] && printf "%s" "${__COMPILATION_AUTHOR}" || printf 'Feel free to give your name(s) if you have compiled this file by yourself')
# Version               : 1.0

# ------------------
# FILE DESCRIPTION :

# This file contains compiled version of the framework initializer script and the main module.
# This script declares every global variables, defines some useful functions you may use in the main module,
# and initializes all the modules you need for your scripts, from their configuration files to their initializer file.

# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC1090

# ------------------------
# NOTES ABOUT SHELLCHECK :

# To display the content of a variable in a translated string, the use of the "$(printf)" command is mandatory in order to interpret each "%s" pattern as the value of a variable.

# This means that the Shellcheck warning code SC2059 will be triggered anyway, since we have no choice but to store the entire translated string in a variable.

# If you add new messages to translate, you must call the "shellcheck disable=SC2059" directive before the line where you call the
# "$(printf)" command to display the translated message, otherwise Shellcheck will display many warnings during the debugging procedure.

# If the message is displayed inside a function, you can write the "shellcheck disable=SC2059" directive on the line above the declaration of the said function.

# You can also write this directive at the beginning of a Bash script, but I would not recommand you to do so, since you may use the "$(printf)" command in another context, without the same purpose.

# --------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in your main script file.

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

elif [[ "${LANG}" == ru_* ]]; then
    echo -e "ВНИМАНИЕ !" >&2; echo >&2;
    echo -e "Этот сценарий оболочки (${BASH_SOURCE[0]}) не предназначен для непосредственного выполнения !" >&2;
    echo -e "Используйте только этот скрипт, включив его в свой проект." >&2; echo >&2;

else
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use only this script by including it in your project script." >&2; echo >&2;

fi; exit 1; fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #