#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.
function SetLibLang
{
    case "$LANG" in
        en_*)
            # English
            ParseCSVLibLang "$LANG" "In $(Decho -e "${BASH_SOURCE[0]}"), line $(Decho -e "$lineno") --> Error : cannot find the $LIBLANG_TRANSLATION_FILE file, abort" \
                "Translation file found : $LIBLANG_TRANSLATION_FILE"
            ;;
        fr_*)
            # French
            ParseCSVLibLang "$LANG" "Dans le fichier $(Decho -e "${BASH_SOURCE[0]}"), à la ligne $(Decho -e "$lineno") --> Erreur : impossible de trouver le fichier $LIBLANG_TRANSLATION_FILE" \
                "Fichier de traduction trouvé : $LIBLANG_TRANSLATION_FILE"
            ;;
        *)
            # Else, if the detected language is not (yet) supported, the default language will be set as English.
            # As it's an important information, the "echo" command's output has to be redirected to the terminal too, no matter if
            EchoInit "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" "1"
            EchoInit "The $PROJECT_NAME library language will be set in English" "1"

            ParseCSVLibLang "In $(Decho -e "${BASH_SOURCE[0]}"), line $(Decho -e "$lineno") --> Error : cannot find the $LIBLANG_TRANSLATION_FILE file, abort" \
                "Translation file found : $LIBLANG_TRANSLATION_FILE"
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
