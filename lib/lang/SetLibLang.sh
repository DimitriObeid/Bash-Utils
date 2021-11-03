#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.
function SetLibLang
{
    case "$LANG" in
        en_*)
            # English (en_*)

            # Setting the appropriate CSV file's translation's column number (from the ".Bash-utils/config/module/main/LangCSVCode.conf" file).
            __BU_MAIN_LANG_CSV_CODE="$__BU_MAIN_LANG_CSV_CODE_EN"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$LANG" \

                "$(ChangeSTAT_ERROR 'fatal'; HandleErrors '1' "ERROR : CANNOT FIND THE $(DechoHighlight "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv") FILE" \
                "Please make sure that the file path passed as $(DechoHighlight "${FUNCNAME[0]}") function's first argument is valid" "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")"

                "Translation file found : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
        fr_*)
            # French | Français (fr_*)

            # Définition du numéro de colonne approprié pour la traduction du fichier CSV (depuis le fichier ".Bash-utils/config/module/main/LangCSVCode.conf").
            __BU_MAIN_LANG_CSV_CODE="$__BU_MAIN_LANG_CSV_CODE_FR"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" "$LANG" \

                "$(ChangeSTAT_ERROR 'fatal' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"; HandleErrors '1' "ERREUR : IMPOSSIBLE DE TROUVER LE FICHIER $(DechoHighlight "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv")" \
                "Assurez-vous que le chemin du fichier passé en premier argument de la fonction $(DechoHighlight "${FUNCNAME[0]}") soit valide" "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")" \

                "Fichier de traduction trouvé : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
        *)
            # Else, if the detected language is not (yet) supported, the default language will be set as English.

            # Setting the appropriate CSV file's translation's column number (from the ".Bash-utils/config/module/main/LangCSVCode.conf" file).
            __BU_MAIN_LANG_CSV_CODE="$__BU_MAIN_LANG_CSV_CODE_EN"


            # As it's an important information, the "echo" command's output has to be redirected to the
            # terminal too, no matter if it was configured to be redirected only to the log project's file.

            # Backup the "$__BU_MAIN_STAT_LOG_REIDRECT" status variable's value.
            if [ "$__BU_MAIN_STAT_LOG_REIDRECT" = 'log' ]; then
                local __BU_MAIN_STAT_LOG_REIDRECT_OLD='log'
                ChangeSTAT_LOG_REDIRECT "tee" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            fi

            EchoMsg "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" "1"
            EchoMsg "The $__BU_MAIN_PROJECT_NAME library language will be set in English" "1"

            # Changing the "$LANG" environment variable's value for the mandatory arguments call.
            LANG="en_US.UTF-8"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$LANG" "$(ChangeSTAT_ERROR 'fatal' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"; HandleErrors '1' "ERROR : CANNOT FIND THE $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv FILE" "Please make sure that the file path passed as ${FUNCNAME[0]} function's first argument is valid" \
                "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")"
                "Translation file found : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"

            # Setting the backupped value to the "$__BU_MAIN_STAT_LOG_REIDRECT" function.
            if [ -n "$__BU_MAIN_STAT_LOG_REIDRECT_OLD" ] && [ "$__BU_MAIN_STAT_LOG_REIDRECT_OLD" = 'log' ]; then
                __BU_MAIN_STAT_LOG_REIDRECT="$__BU_MAIN_STAT_LOG_REIDRECT_OLD"
            fi
            ;;
    esac
}

# Getting the language code to parse the , then calling the "SetLibLang", or call this function directly if this file is empty or missing.
function GetLibLang()
{
    # In case an user would like to use another language instead of the current used language in the system,
    # he can create a file named "lang.conf" in the "Bash-Utils/config" folder and write its language's
    if [ -f "$__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH" ] && [ -s "$__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH" ]; then
        LANG="$(cat "$__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH")"
        SetLibLang
    else
        SetLibLang
    fi
}
