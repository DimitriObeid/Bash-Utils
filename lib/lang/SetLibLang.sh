#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.
function SetLibLang
{
    case "$LANG" in
        en_*)
            # English
            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$LANG" \

                "$(ChangeSTAT_ERROR 'fatal'; HandleErrors '1' "ERROR : CANNOT FIND THE $(DechoHighlight "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv") FILE" \
                "Please make sure that the file path passed as $(DechoHighlight "${FUNCNAME[0]}") function's first argument is valid" "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")"

                "Translation file found : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
        fr_*)
            # French | Français
            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" "$LANG" \

                "$(ChangeSTAT_ERROR 'fatal'; HandleErrors '1' "ERREUR : IMPOSSIBLE DE TROUVER LE FICHIER $(DechoHighlight "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv")" \
                "Assurez-vous que le chemin du fichier passé en premier argument de la fonction $(DechoHighlight "${FUNCNAME[0]}") soit valide" "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")" \

                "Fichier de traduction trouvé : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
        *)
            # Else, if the detected language is not (yet) supported, the default language will be set as English.
            # As it's an important information, the "echo" command's output has to be redirected to the terminal too, no matter if
            EchoInit "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" "1"
            EchoInit "The $__BU_MAIN_PROJECT_NAME library language will be set in English" "1"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$LANG" "$(ChangeSTAT_ERROR 'fatal'; HandleErrors '1' "ERROR : CANNOT FIND THE $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv FILE" "Please make sure that the file path passed as ${FUNCNAME[0]} function's first argument is valid" \
                "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")"
                "Translation file found : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
    esac
}

# In case an user would like to use another language instead of the current used language in the system,
# he can create a file named "lang.conf" in the "Bash-Utils/config" folder and write its language's
if [ -f "$BASH_UTILS_LANG/lang.conf" ]; then
    LANG="$(cat "$BASH_UTILS_LANG/lang.conf")"
    SetLibLang
else
    SetLibLang
fi
