#!/usr/bin/env bash

# -----------------------
# SCRIPT'S INFORMATIONS :

# Name          : Bash-utils-init.sh
# Author(s)     : Dimitri OBEID
# Version       : 3.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# This file contains the main part of the framework initializer script.

# This script declares every global variables, defines some useful functions you may use in the main module,
# and initializes all the modules you need for your scripts, from their configuration files to their initializer file.


# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT ADD A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE THE "$(shellcheck)" COMMAND WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC2154,SC1090


# ------------------------
# NOTES ABOUT SHELLCHECK :

# To display the content of a variable in a translated string, the use of the "$(printf)" command is mandatory in order to interpret each "%s" pattern as the value of a variable.

# This means that the Shellcheck warning code SC2059 will be triggered anyway, since we have no choice but to store the entirety of every translated strings into global variables, many of which contain the above-mentioned pattern.

# If you add new messages to translate, you must call the "# shellcheck disable=SC2059" directive before the line where you call the
# "$(printf)" command to display the translated message, otherwise Shellcheck will display many warnings during the debugging procedure.

# If the message is displayed inside a function, you can write the "# shellcheck disable=SC2059" directive on the line above the declaration of the said function.

# You can also write this directive at the beginning of a Bash script, but I would not recommand you to do so, since you may use the "$(printf)" command in another context, without the same purpose.


# --------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in your main script file.

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

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### INITIALIZER RESOURCES - FUNCTIONS

## USEFUL FUNCTIONS

# ·························································································
# Use this function to have a better view about a bug location during a "$(bash -x)" debug.

function DbgMsg()
{
    #**** Parameters ****
    local p_code=${1:-1};   # ARG TYPE : Int    - REQUIRED | DEFAULT VAL : 1    - DESC : Exit code.
    local p_sleep=${2:-2};  # ARG TYPE : Int    - REQUIRED | DEFAULT VAL : 2    - DESC : Pause time in seconds.

    #**** Code ****
printf "

-------------------------------------------------
                      DEBUG
-------------------------------------------------

"
    sleep "${p_sleep}";

    if [ "${p_code}" -eq 0 ]; then return 0;
    else
        # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
        exit "${p_code}";
    fi
}

# TODO in both "BU.ModuleInit.IsFrameworkUnlocalizedCompiled()" and "BU.ModuleInit.IsFrameworkLocalizedCompiled()" functions :
#   - Faire en sorte que le code détecte le nom du fichier "Bash-utils.sh" ou "Bash-utils-[a-z][az-]" sourcé, directement depuis le fichier en question quand il est sourcé.

# ··································································································
# Stopping the execution of the framework in case an error occurs, after printing an error message.

function BU.ModuleInit.Exit()                           { local p_code=${1:-1}; BU.ModuleInit.IsInScript && exit "${p_code}"; return "${p_code}"; }

# ······················································································
# Checking if the framework is being installed thanks to the installation script (TODO).

function BU.ModuleInit.IsFrameworkBeingInstalled()      { if [ "${__BU_MODULE_PRE_INIT__IS_FRAMEWORK_INSTALLED,,}" == 'true' ] || [ "${0,,}" == "./install-framework.sh" ] || [ "${0,,}" == "install-framework.sh" ]; then return 0; else return 1; fi }

# ·························································································································································································································
# Checking if the whole framework's main code (config, initializer and main module's code) is compiled in a single unlocalized file (generated by the "res/dev-tools/dev-bin/lib-unite.sh" (or "bin/lib-unite.sh") script).

function BU.ModuleInit.IsFrameworkUnlocalizedCompiled()  { local v_currFile; v_currFile="$(basename "${BASH_SOURCE[0]}")"; if [[ "${v_currFile##*/,,}" == Bash-utils?(-stable)-full.sh ]] && [ "$(wc -l "${v_currFile}" | cut -f1 -d" ")" -ge 15000 ]; then echo "FILE = ${v_currFile}"; return 0; else return 1; fi }

# ····························································································································································································································································
# Checking if the whole framework's main code (config, initializer and main module's code) is compiled in a single localized file (generated by a script to develop, but inspired by the "res/dev-tools/dev-bin/lib-unite.sh" (or "bin/lib-unite.sh") script).

function BU.ModuleInit.IsFrameworkLocalizedCompiled()    { local v_currFile; v_currFile="$(basename "${BASH_SOURCE[0]}")"; if [[ "${v_currFile##*/,,}" == Bash-utils?(-stable)-[a-z][a-z].sh ]] && [ "$(wc -l "${v_currFile}" | cut -f1 -d" ")" -ge 15000 ]; then return 0; else return 1; fi }

# ····································································································································
# Checking if the whole framework's main code (config, initializer and main module's code) is compiled in a single (un)localized file.

function BU.ModuleInit.IsFrameworkCompiled()             { if BU.ModuleInit.IsFrameworkLocalizedCompiled || BU.ModuleInit.IsFrameworkUnlocalizedCompiled; then return 0; else return 1; fi }

# ································································································································
# Checking if the function and / or sourced code currently executed is a part of a script file or running in an interactive shell.

function BU.ModuleInit.IsInScript()                     { local v_3="${0: -3}"; local v_5="${0: -5}"; if [ "${0:0:2}" == './' ] || [[ "${v_3,,}" == .sh ]] || [[ "${v_5,,}" == .bash ]]; then return 0; elif [ "${0}" == 'bash' ]; then return 1; fi }

# ········································
# Checking if the framework is translated.

function BU.ModuleInit.IsTranslated()                   { if [ "${__BU_MODULE_INIT__BU_BASE_IS_TRANSLATED,,}" == 'true' ]; then return 0; else return 1; fi }

# ··························································································································································································································
# Checking if the framework is still initializing, and if the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" global variable's value is '--log-shut', in order to display every error messages from the main module's functions.

function BU.ModuleInit.SetInitErrorMsg()                { if BU.Main.Status.CheckStatIsInitializing && [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION,,}" == '--log-shut' ]; then v_msg_arr_permission_global_backup="${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}"; __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='--log-shut-display'; return 0; else return 1; fi }

# ·······································
# Unsetting the former function's result.

function BU.ModuleInit.UnsetInitErrorMsg()              { if BU.Main.Status.CheckStatIsInitializing && [ -n "${v_msg_arr_permission_global_backup}" ]; then __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="${v_msg_arr_permission_global_backup}"; unset v_msg_arr_permission_global_backup; fi }

## ----------------------------------------------

## FUNCTIONS AND RESOURCES NEEDED FOR TRAPPING SIGNALS

# ················································································································
# NOTE : In the functions with embedded translations, only the languages spoken by more than 100 million people in
# the world (according to this website : https://lingua.edu/the-20-most-spoken-languages-in-the-world-in-2022/)
# will be embedded, in order to avoid bloating the initializer script with thousands of lines of messages.

# ···························································································
# Printing the message which tells to the user that (s)he interrupted the script's execution.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.SIGINT()
{
    #**** Variables ****
    local v_isPrinted; # VAR TYPE : Bool   - DESC : Checks if one of the languages supported by the "Bash-utils-init.sh" file was found on the user's system and that the translated message was printed.

    #**** Code ****
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && { echo >&2; echo "Die Ausführung des Skripts wurde vom Benutzer unterbrochen" >&2 && v_isPrinted='true'; };
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && { echo >&2; echo "The script's execution was interrupted by the user" >&2 && v_isPrinted='true'; };
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && { echo >&2; echo "La ejecución del script fue interrumpida por el usuario" >&2 && v_isPrinted='true'; };

    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && { echo >&2; echo "L'exécution du script a été interrompue par l'utilisateur" >&2 && v_isPrinted='true'; };
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'id' ] && { echo >&2; echo "" >&2 && v_isPrinted='true'; }
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && { echo >&2; echo "A execução do guião foi interrompida pelo utilizador" >&2 && v_isPrinted='true'; };

    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && { echo >&2; echo "Выполнение сценария было прервано пользователем" >&2 && v_isPrinted='true'; };

    [ "${v_isPrinted}" != 'true' ] && { echo >&2; echo "The script's execution was interrupted by the user" >&2; };

    echo >&2;
}

# ·······························
# Defining the framework's traps.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.DefineTraps()
{
    # Defining strings variables.
    __BU_MODULE_INIT_MSG__DEFINING_TRAPS__="";

    # Defining traps.
    trap 'echo "${__BU_MODULE_INIT_MSG__DEFINE_TRAPS__EXITING_SCRIPT}"' 0;

    trap "BU.ModuleInit.SIGINT; BU.ModuleInit.Exit 2" SIGINT;
}

## ----------------------------------------------

## FUNCTIONS NEEDED FOR THE TRANSLATIONS OF MESSAGES BEFORE THE INCLUSION OF THE TRANSLATION FILES.

# ················································································································
# NOTE : In the functions with embedded translations, only the languages spoken by more than 100 million people in
# the world (according to this website : https://lingua.edu/the-20-most-spoken-languages-in-the-world-in-2022/)
# will be embedded, in order to avoid bloating the initializer script with thousands of lines of messages.

# ············································································································
# Printing the messages which tell to the user that

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.MsgLine()       -> Modules initializer script (this file)

function BU.ModuleInit.PrintLogErrorNoTranslationFilesSourced()
{
    # No need to redefine the three arguments inside this function, the scope of the "BU.ModuleInit.PrintLogError()"
    # function's local variables reach the sub-functions called inside the "BU.ModuleInit.PrintLogError()" function.

    #**** Variables ****
    local v_isPrinted;  # VAR TYPE : Bool               - DESC : Checks if one of the languages supported by the "Bash-utils-init.sh" file was found on the user's system and that the translated message was printed.
    local v_userLang;   # VAR TYPE : ISO 639-1 code     - DESC :

    #**** Code ****
    v_userLang="$(echo "${LANG}" | cut -d _ -f1)";

    [ "${v_userLang,,}" == 'de' ] && BU.ModuleInit.MsgLine "$(printf "[FEHLER] DATEI : %s | LINIEN : %s | FEHLERCODE : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2 && v_isPrinted='true';
    [ "${v_userLang,,}" == 'en' ] && BU.ModuleInit.MsgLine "$(printf "[ERROR] FILE : %s | LINE : %s | CODE : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2 && v_isPrinted='true';
    [ "${v_userLang,,}" == 'es' ] && BU.ModuleInit.MsgLine "$(printf "[ERROR] FICHERO : %s | LÍNEA : %s | CÓDIGO : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2 && v_isPrinted='true';

    [ "${v_userLang,,}" == 'fr' ] && BU.ModuleInit.MsgLine "$(printf "[ ERREUR ] FICHER : %s | LIGNE : %s | CODE : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2 && v_isPrinted='true';
    [ "${v_userLang,,}" == 'pt' ] && BU.ModuleInit.MsgLine "$(printf "[ERRO] FICHEIRO : %s | LINHA : %s | CÓDIGO : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2 && v_isPrinted='true';
    [ "${v_userLang,,}" == 'ru' ] && BU.ModuleInit.MsgLine "$(printf "[ОШИБКА] ФАЙЛ : %s | ЛИНИЯ : %s | КОД : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2 && v_isPrinted='true';

    # If the language chosen by the user is not (yet) supported directly in this function, the message is displayed in English.
    [ "${v_isPrinted}" != 'true' ] && BU.ModuleInit.MsgLine "$(printf "[ERROR] FILE : %s | LINE : %s | CODE : %s" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2;

    echo >&2;
}

# ············································································································
# Printing the messages which tell to the user that

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.FindPathNoTranslationFilesSourced()
{
    #**** Parameters ****
    local p_func0=${1:-${FUNCNAME[1]}};     # ARG TYPE : String     - REQUIRED | DEFAULT VAL : "${FUNCNAME[1]}"     - DESC :
    local p_func1=${2:-${FUNCNAME[2]}};     # ARG TYPE : String     - REQUIRED | DEFAULT VAL : "${FUNCNAME[2]}"     - DESC :
    local p_file=${3:-${BASH_SOURCE[0]}};   # ARG TYPE : String     - REQUIRED | DEFAULT VAL : "${BASH_SOURCE[0]}"  - DESC :
    local p_lineno=${4:-NULL};              # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL                 - DESC :
    local p_type=${5:-NULL};                # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL                 - DESC :

    #**** Variables ****
    local v_isPrinted;  # VAR TYPE : Bool               - DESC :
    local v_type;       # VAR TYPE : CMD                - DESC : Checking the value of the "" parameter in order to display the correct string.
    local v_userLang;   # VAR TYPE : ISO 639-1 code     - DESC : Checks if one of the languages supported by the "Bash-utils-init.sh" file was found on the user's system and that the translated message was printed.

    #**** Code ****
    v_type="$([ "${p_type,,}" == 'echo' ] && printf 'echo' || printf 'MSG')";

    v_userLang="$(echo "${LANG}" | cut -d _ -f1)";

    # Deutch | German
    [ "${v_userLang,,}" == 'de' ] && {
        printf "IN DER DATEI « %s », AN DIE FUNKTION « %s », ZUR LINIE « %s », BASH-UTILS WARNUNG : DIESER PFAD KANN NICHT GEFUNDEN WERDEN --> %s/%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Funktion, bei der die Funktion « %s() » aufgerufen wurde: %s" "${v_type}" "${p_func0}" "${p_func1}" >&2; v_isPrinted='true';
    }

    # English
    [ "${v_userLang,,}" == 'en' ] && {
        printf "IN « %s », FUNCTION « %s », LINE « %s » --> BASH-UTILS WARNING : UNABLE TO FIND THIS PATH --> %s/%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Function where the « %s() » function was called : %s()\n" "${v_type}" "${p_func0}" "${p_func1}" >&2; v_isPrinted='true';
    };

    # Español | Spanish
    [ "${v_userLang,,}" == 'es' ] && {
        printf "EN EL FICHERO « %s », A LA FUNCIÓN « %s », A LA LÍNEA « %s » --> ADVERTENCIA DE BASH-UTILS : NO SE ENCUENTRA ESTA RUTA DE ARCHIVO --> %s%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Función en la que se ha llamado a la función « %s() » : %s()" "${v_type}" "${p_func0}" "${p_func1}" >&2; v_isPrinted='true';
    };

    # Français | French
    [ "${v_userLang,,}" == 'fr' ] && {
        printf "DANS LE FICHIER « %s », À LA FONCTION « %s », À LA LIGNE « %s » --> AVERTISSEMENT DE BASH-UTILS : IMPOSSIBLE DE TROUVER CE CHEMIN --> %s/%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Fonction où la fonction « %s() » a été appelée : %s()" "${v_type}" "${p_func0}" "${p_func1}" >&2; v_isPrinted='true';
    };

    # Português | Portuguese
    [ "${v_userLang,,}" == 'pt' ] && {
        printf "EM « %s » FICHEIRO, NA FUNÇÃO « %s() », EM LINHA « %s » --> AVISO DE BASH-UTILS : IMPOSSÍVEL DE ENCONTRAR ESTE CAMINHO --> %s/%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Função onde a função « %s() » foi chamada : %s()" "${v_type}" "${p_func0}" "${p_func1}" >&2; v_isPrinted='true';
    };

    # Русский | Russian
    [ "${v_userLang,,}" == 'ru' ] && {
        printf "В ФАЙЛЕ « %s », К ФУНКЦИИ « %s », К СТРОКЕ « %s » --> ПРЕДУПРЕЖДЕНИЕ « BASH-UTILS » : НЕВОЗМОЖНО НАЙТИ ЭТУ ПУТЬ --> %s/%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Функция, в которой была вызвана функция « %s() » : %s()" "${v_type}" "${p_func0}" "${p_func1}" >&2; v_isPrinted='true';
    }

    # If the language chosen by the user is not (yet) supported directly in this function, the message is displayed in English.
    [ "${v_isPrinted}" != 'true' ] && {
        printf "IN « %s », FUNCTION « %s », LINE « %s » --> BASH-UTILS WARNING : UNABLE TO FIND THIS PATH --> %s/%s\n\n" "${p_file}" "${p_func0}" "${p_lineno}" "${v_parentdir}" "${v_target}" >&2;

        printf "(%s) Function where the « %s() » function was called : %s()\n" "${v_type}" "${p_func0}" "${p_func1}" >&2;
    };
}

## ----------------------------------------------

## FUNCTIONS NEEDED FOR THE INITIALIZATION PROCESS TRANSLATIONS

# ················································································································
# NOTE : In the functions with embedded translations, only the languages spoken by more than 100 million people in
# the world (according to this website : https://lingua.edu/the-20-most-spoken-languages-in-the-world-in-2022/)
# will be embedded, in order to avoid bloating the initializer script with thousands of lines of messages.

# ·························································································································································································
# Printing the message that warns the user that the rest of the framework will use english as default language (this function is not called if the framework is compiled in a single file).

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.GetModuleInitLanguage_SetEnglishAsDefaultLanguage()         -> Modules initializer script (this file)

function BU.ModuleInit.GetModuleInitLanguage_RestOfLibrary()
{
    #**** Variables ****
    local v_isPrinted; # VAR TYPE : Bool   - DESC : Checks if one of the languages supported by the "Bash-utils-init.sh" file was found on the user's system and that the translated message was printed.

    #**** Code ****
    echo '------------------------------------------------------------------------' >&2;
    echo >&2;

    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "Der Rest der Bibliothek wird Englisch als Standardsprache verwenden" >&2 && v_isPrinted='true';
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "The rest of the library will use English as default language" >&2 && v_isPrinted='true';
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && echo "El resto de la biblioteca utilizará el inglés como idioma por defecto" >&2 && v_isPrinted='true';

    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "Le reste de la librairie utilisera l'anglais en tant que langue par défaut" >&2 && v_isPrinted='true';
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "O resto da biblioteca utilizará o inglês como língua padrão" >&2 && v_isPrinted='true';
    [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "Остальная часть библиотеки будет использовать английский язык в качестве языка по умолчанию" >&2 && v_isPrinted='true';

    # If the language chosen by the user is not (yet) supported directly in this function, the message is displayed in English.
    [ "${v_isPrinted}" != 'true' ] && echo "The rest of the library will use English as default language" >&2;

    echo >&2;

    sleep 0.5;

    BU.ModuleInit.GetModuleInitLanguage_SetEnglishAsDefaultLanguage || return 1;
}

# ·········································································································································································································
# Set english as default language if an unsupported language is stored in the "${__BU_MODULE_INIT__USER_LANG}" global variable (this function is not called if the framework is compiled in a single file).

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.SourceEnglishTranslationFiles()     -> Modules initializer script (this file)

# shellcheck disable=SC1090,SC1091
function BU.ModuleInit.GetModuleInitLanguage_SetEnglishAsDefaultLanguage()
{
    #**** Variables ****
    local v_lang_backup="${__BU_MODULE_INIT__USER_LANG}"; # VAR TYPE : ISO 639-1 code   - DESC : Backupping the former language used / chosen by the user.

    #**** Code ****

    # Changing the current language to English.
    LANG="en_US.UTF-8"; __BU_MODULE_INIT__USER_LANG="$(echo "${LANG}" | cut -d _ -f1)";

    BU.ModuleInit.SourceEnglishTranslationFiles "${v_lang_backup}";
}

# ·······································
# Sourcing the English translation files.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.IsFrameworkCompiled()   -> Modules initializer script (this file)
#   - BU.ModuleInit.SetInitLocale.en()      -> Modules initializer script (this file)

# shellcheck disable=SC1090,SC1091
function BU.ModuleInit.SourceEnglishTranslationFiles()
{
    #**** Parameters ****
    local p_lang_backup=${1:-'en'}; # ARG TYPE : ISO 639-1 code    - REQUIRED | DEFAULT VAL : en    - DESC : language in which the  language's backup from the "BU.ModuleInit.GetModuleInitLanguage_SetEnglishAsDefaultLanguage()" function.

    #**** Code ****
    BU.ModuleInit.IsFrameworkCompiled || { source "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH}/en.locale" || {
            echo >&2;

            # Deutch | German
            [ "${p_lang_backup,,}" == 'de' ] && {
                echo '------------------------------------------------------------------------------------------------' >&2 && echo >&2;
                echo "FATALER FEHLER : DIE ENGLISCHE ÜBERSETZUNGSDATEI KONNTE NICHT VON DER QUELLE REFERENZIERT WERDEN" >&2 && echo >&2;

                echo "Da die Nachrichten in der Modulinitialisierungsdatei in Variablen gespeichert werden, stützt sich diese Datei auf diese Übersetzungsdateien, die diese Variablen definieren" >&2;
                echo "Anhalten der Skriptausführung" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }

            # English
            [ "${p_lang_backup,,}" == 'en' ] && {
                echo '-----------------------------------------------------------' >&2 && echo >&2;
                echo "FATAL ERROR : UNABLE TO SOURCE THE ENGLISH TRANSLATION FILE" >&2 && echo >&2;

                echo "Since the messages in the module initialization file are stored into variables, this file relies on these translation files, which define these variables" >&2;
                echo "Aborting the script's execution" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }

            # Español | Spanish
            [ "${p_lang_backup,,}" == 'es' ] && {
                echo '-----------------------------------------------------------------' >&2 && echo >&2;
                echo "ERROR FATAL: IMPOSIBLE OBTENER EL ARCHIVO DE TRADUCCIÓN AL INGLÉS" >&2 && echo >&2;

                echo "Como los mensajes del fichero de inicialización del módulo se almacenan en variables, este fichero es asumido por estos ficheros de traducción, que definen estas variables" >&2;
                echo "Detener la ejecución del script" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }

            # Français | French
            [ "${p_lang_backup,,}" == 'fr' ] && {
                echo '------------------------------------------------------------------------' >&2 && echo >&2;
                echo "ERREUR FATALE : IMPOSSIBLE D'INCLURE LE FICHIER DE TRADUCTION EN ANGLAIS" >&2 && echo >&2;

                echo "Comme les messages du fichier d'initialisation du module sont stockés dans des variables, ce fichier s'appuie sur ces fichiers de traduction, qui définissent ces variables" >&2;
                echo "Arrêt de l'exécution du script" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }

            # Português | Portuguese
            [ "${p_lang_backup,,}" == 'pt' ] && {
                echo '-----------------------------------------------------------------------' >&2 && echo >&2;
                echo "ERRO FATAL: IMPOSSIBILIDADE DE INCLUIR O FICHEIRO DE TRADUÇÃO EM INGLÊS" >&2 && echo >&2;

                echo "Como as mensagens no ficheiro de inicialização do módulo são armazenadas em variáveis, este ficheiro baseia-se nestes ficheiros de tradução, que definem estas variáveis" >&2;
                echo "Interrupção da execução do guião" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }

            # Русский | Russian
            [ "${p_lang_backup,,}" == 'ru' ] && {
                echo '----------------------------------------------------------------------' >&2 && echo >&2;
                echo "ФАТАЛЬНАЯ ОШИБКА: НЕВОЗМОЖНО ВКЛЮЧИТЬ ФАЙЛ ПЕРЕВОДА НА АНГЛИЙСКИЙ ЯЗЫК" >&2 && echo >&2;

                echo "Comme les messages du fichier d'initialisation du module sont stockés dans des variables, ce fichier s'appuie sur ces fichiers de traduction, qui définissent ces variables" >&2;
                echo "Arrêt de l'exécution du script" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }

            # If the language chosen by the user is not (yet) supported directly in this function, the message is displayed in English.
            [[ "${p_lang_backup}" == * ]] && {
                echo '-----------------------------------------------------------' >&2 && echo >&2;
                echo "FATAL ERROR : UNABLE TO SOURCE THE ENGLISH TRANSLATION FILE" >&2 && echo >&2;

                echo "Since the messages in the module initialization file are stored into variables, this file relies on these translation files, which define these variables" >&2;
                echo "Aborting the script's execution" >&2;
                echo >&2;

                # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
                return 1;
            }
        }

        # Calling the function which defines every variables containing the messages in English.
        BU.ModuleInit.SetInitLocale.en;
    }
}

# ······························································································································
# Writing the error messages that , before the definition of the necessary variables for the inclusion of the translation files.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.PrintErrorMissingBashUtilsHomeFolder()
{
    #**** Parameters ****
    local v_file=${1:-${BASH_SOURCE[0]}};   # ARG TYPE : String     - REQUIRED | DEFAULT VAL : "${BASH_SOURCE[0]}"  - DESC :
    local v_func=${2:-${FUNCNAME[1]}};      # ARG TYPE : String     - REQUIRED | DEFAULT VAL : "${FUNCNAME[1]}"     - DESC :
    local v_line=${3:-${LINENO}};           # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : "${LINENO}"          - DESC :

    #**** Variables ****
    local __bu_module_init__user_lang;      # VAR TYPE : ISO 639-1 Code     - DESC : Getting the language used / chosen by the user.
    local v_installFile;                    # VAR TYPE : File               - DESC : Name of the framework installation program.
    local v_isPrinted;                      # VAR TYPE : Bool               - DESC : Checks if one of the languages supported by the "Bash-utils-init.sh" file was found on the user's system and that the translated message was printed.

    #**** Code ****
    __bu_module_init__user_lang="$(echo "${LANG}" | cut -d _ -f1)";

    v_installFile='install_and_update.sh';

    echo >&2;

    # Deutch | German
    [ "${__bu_module_init__user_lang,,}" == 'de' ] && {
        printf "IN DER DATEI « %s », AN DIE FUNKTION « %s », ZUR LINIE « %s », BASH-UTILS WARNUNG :\n" "${v_file}" "${v_func}" "${v_line}" >&2; echo >&2;

        echo "Der Stammordner des Bash-Utils-Konfigurationsverzeichnisses « .Bash-utils » existiert nicht in Ihrem Heimatverzeichnis" >&2; echo >&2;
        echo "Bitte kopieren Sie diesen Ordner in Ihr Home-Verzeichnis. Sie können es installieren, indem Sie die Datei « ${v_installFile} » ausführen, oder Sie können es im Verzeichnis « Bash-utils/install » finden" >&2;

        v_isPrinted='true';
    };

    # English
    [ "${__bu_module_init__user_lang,,}" == 'en' ] && {
        printf "IN « %s », FUNCTION « %s() », LINE « %s » --> BASH-UTILS ERROR\n" "${v_file}" "${v_func}" "${v_line}">&2; echo >&2;

        echo "The Bash Utils framework's configurations root folder « .Bash-utils » doesn't exists in your home directory" >&2; echo >&2;
        echo "Please copy this folder in your home directory. You can install it by executing the « ${v_installFile} » file, or you can find it in the « Bash-utils/install » directory" >&2;
    };

    # Español | Spanish
    [ "${__bu_module_init__user_lang,,}" == 'es' ] && {
        printf "EN EL FICHERO « %s », A LA FUNCIÓN « %s », A LA LÍNEA « %s » --> ADVERTENCIA DE BASH-UTILS :\n" "${v_file}" "${v_func}" "${v_line}" >&2; echo >&2;

        echo "La carpeta raíz para las configuraciones de Bash Utils « .Bash-utils » no existe en su directorio personal." >&2; echo >&2;
        echo "Por favor, copie este archivo en su directorio personal. Puede instalarlo ejecutando el archivo « ${v_installFile} », o puede encontrarlo en la carpeta « Bash-utils/install »" >&2;

        v_isPrinted='true';
    };

    # Français | French
    [ "${__bu_module_init__user_lang,,}" == 'fr' ] && {
        printf "DANS LE FICHIER « %s », À LA FONCTION « %s() », À LA LIGNE « %s » --> ERREUR FATALE DE BASH-UTILS\n" "${v_file}" "${v_func}" "${v_line}" >&2; echo >&2;

        echo "Le dossier racine des configurations du framework Bash Utils « .Bash-utils » n'existe pas dans votre répertoire personnel" >&2; echo >&2;
        echo "Veuillez copier ce dossier dans votre répertoire personnel. Vous pouvez l'installer en exécutant le fichier « ${v_installFile} », ou vous pouvez le trouver dans le dossier « Bash-utils/install »" >&2;

        v_isPrinted='true';
    };

    # Português | Portuguese
    [ "${__bu_module_init__user_lang,,}" == 'pt' ] && {
        printf "EM « %s » FICHEIRO, NA FUNÇÃO « %s() », EM LINHA « %s » --> BASH-UTILS ERRO FATAL\n" "${v_file}" "${v_func}" "${v_line}" >&2; echo >&2;

        echo "A pasta de configuração da raiz da estrutura Bash Utils « .Bash-utils » não existe no seu directório home" >&2; echo >&2;
        echo "Por favor copie esta pasta para o seu directório pessoal. Pode instalá-lo executando o ficheiro « ${v_installFile} », ou pode encontrá-lo na pasta « Bash-utils/install »" >&2;

        v_isPrinted='true';
    };

    # Русский | Russian
    [ "${__bu_module_init__user_lang,,}" == 'ru' ] && {
        printf "В ФАЙЛЕ « %s », К ФУНКЦИИ « %s », К СТРОКЕ « %s » --> ФАТАЛЬНАЯ ОШИБКА « BASH-UTILS »\n" "${v_file}" "${v_func}" "${v_line}" >&2; echo >&2;

        echo "Корневая папка конфигураций фреймворка 'Bash Utils' « .Bash-utils » не существует в вашем домашнем каталоге" >&2; echo >&2;
        echo "Пожалуйста, скопируйте эту папку в свой домашний каталог. Вы можете установить его, запустив файл « ${v_installFile} », или вы можете найти его в папке « Bash-utils/install »" >&2;

        v_isPrinted='true';
    };

    # If the language chosen by the user is not (yet) supported directly in this function, the message is displayed in English.
    [ "${v_isPrinted}" != 'true' ] && [[ "${__bu_module_init__user_lang,,}" == * ]] && {
        printf "IN « %s », FUNCTION « %s() », LINE « %s » --> BASH-UTILS ERROR\n" "${v_file}" "${v_func}" "${v_line}">&2; echo >&2;

        echo "The Bash Utils configurations root folder « .Bash-utils » doesn't exists in your home directory" >&2; echo >&2;
        echo "Please copy this folder in your home directory. You can install it by executing the « ${v_installFile} » file, or you can find it in the « Bash-utils/install » directory" >&2;
    };
}

# ·······················································································································
# Rewriting the library's languages messages (this function is not called if the framework is compiled in a single file).

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.SetInitLocale."${__BU_MODULE_INIT__USER_LANG}"()    -> Modules initializer script's locale files ("config/initializer/locale/${__BU_MODULE_INIT__USER_LANG}.locale").

#   - BU.ModuleInit.GetModuleInitLanguage_RestOfLibrary()               -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkCompiled()                               -> Modules initializer script (this file)
#   - BU.ModuleInit.SourceEnglishTranslationFiles()                     -> Modules initializer script (this file)

# shellcheck disable=SC1091,SC1090
function BU.ModuleInit.GetModuleInitLanguage()
{
    #**** Parameters ****
    local p_lang_ISO_639_1=${1:-NULL};  # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Wanted language.

    #**** Variables ****
    local v_supportedLang;  # VAR TYPE : Array      - DESC :
    local v_langMatch;      # VAR TYPE : String     - DESC :

    local v_isPrinted;      # VAR TYPE : Bool       - DESC : Checks if one of the languages supported by the "Bash-utils-init.sh" file was found on the user's system and that the translated message was printed.

    #**** Code ****
    v_supportedLang=('bg' 'cs' 'da' 'de' 'el' 'en' 'es' 'et' 'fi' 'fr' 'hu' 'id' 'it' 'ja' 'lt' 'lv' 'nl' 'pl' 'pt' 'ro' 'ru' 'sk' 'sl' 'sv' 'tr' 'uk' 'zh');

    [[ ${v_supportedLang[*]} =~ ${p_lang_ISO_639_1,,} ]] && v_langMatch="match";

    # If the selected language was not found among the supported languages.
    if [ -z "${v_langMatch}" ]; then

        if [ -n "${p_lang_ISO_639_1}" ]; then
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "WARNUNG : Die von Ihnen gewählte Sprache (${p_lang_ISO_639_1,,}) wird (noch) nicht vom Initialisierungsskript unterstützt" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "WARNING : Your selected language (${p_lang_ISO_639_1,,}) is not (yet) supported by the initialisation script" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && echo "ADVERTENCIA : El idioma seleccionado (${p_lang_ISO_639_1,,}) no está soportado (todavía) por el script de inicialización." >&2 && v_isPrinted='true';

            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "ATTENTION : La langue sélectionnée (${p_lang_ISO_639_1,,}) n'est pas (encore) supportée par le script d'initialisation" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "AVISO : A sua língua seleccionada (${p_lang_ISO_639_1,,}) não é (ainda) suportada pelo guião de inicialização" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "ВНИМАНИЕ : Выбранный вами язык (${p_lang_ISO_639_1,,}) не поддерживается (пока) скриптом инициализации" >&2 && v_isPrinted='true';

            [ "${v_isPrinted}" != 'true' ] && echo echo "WARNING : Your selected language (${p_lang_ISO_639_1,,}) is not (yet) supported by the initialisation script" >&2;
        else
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "WARNUNG : Ihre aktuelle Sprache (${__BU_MODULE_INIT__USER_LANG,,}) wird (noch) nicht vom Initialisierungsskript unterstützt" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "WARNING : Your current language (${__BU_MODULE_INIT__USER_LANG,,}) is not (yet) supported by the initialisation script" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && echo "ADVERTENCIA : Su idioma actual (${__BU_MODULE_INIT__USER_LANG,,}) no es (todavía) soportado por el script de inicialización." >&2 && v_isPrinted='true';

            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "ATTENTION : Votre langue actuelle (${__BU_MODULE_INIT__USER_LANG,,}) n'est pas (encore) supportée par le script d'initialisation" >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "AVISO : A sua língua actual (${__BU_MODULE_INIT__USER_LANG,,}) não é (ainda) suportada pelo guião de inicialização." >&2 && v_isPrinted='true';
            [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "ВНИМАНИЕ : Ваш текущий язык (${__BU_MODULE_INIT__USER_LANG,,}) не поддерживается (пока) скриптом инициализации." >&2 && v_isPrinted='true';

            [ "${v_isPrinted}" != 'true' ] && echo "WARNING : Your current language (${__BU_MODULE_INIT__USER_LANG,,}) is not (yet) supported by the initialisation script" >&2;
        fi; echo >&2;

        # Setting the value of the "${v_isPrinted}" variable to "false" in order to ensure that the following messages will be printed in English if one of the following messages would be missing.
        v_isPrinted='false';

        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "Das Initialisierungsskript wird Englisch als Standardsprache verwenden." >&2 && v_isPrinted='true';
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "The initialisation script will use english as default language" >&2 && v_isPrinted='true';
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && echo "El script de inicialización utilizará el inglés como idioma por defecto" >&2 && v_isPrinted='true';

        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "Le script d'initialisation utilisera l'anglais en tant que langue par défaut" >&2 && v_isPrinted='true';
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "O guião de inicialização utilizará o inglês como língua padrão" >&2 && v_isPrinted='true';
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "Скрипт инициализации будет использовать английский язык в качестве языка по умолчанию" >&2 && v_isPrinted='true';

        [ "${v_isPrinted}" != 'true' ] &&  echo "The initialisation script will use english as default language" >&2;

        echo >&2;

        # Changing the current language to English.
        __BU_MODULE_INIT__USER_LANG="en_US.UTF-8";

        # Setting the value of the "${v_isPrinted}" variable to "false" in order to ensure that the following messages will be printed in English if one of the following messages would be missing.
        v_isPrinted='false';
    fi

	if [ "${p_lang_ISO_639_1^^}" == 'NULL' ]; then
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "ACHTUNG : Keine Sprache wird als Argument angegeben, wenn die Funktion « ${FUNCNAME[0]}() » aufgerufen wird" >&2 && v_isPrinted='true';
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "WARNING : No language specified as argument when calling the « ${FUNCNAME[0]}() » function" >&2 && v_isPrinted='true';
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && echo "ADVERTENCIA : No se especifica ningún idioma como argumento al llamar a la función « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';

		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "ATTENTION : Aucune langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "ATENÇÃO : Nenhuma língua especificada como argumento ao chamar a função « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "ВНИМАНИЕ : При вызове функции « ${FUNCNAME[0]}() » в качестве аргумента не указан язык" >&2 && v_isPrinted='true';

        [ "${v_isPrinted}" != 'true' ] && echo "WARNING : No language specified as argument when calling the « ${FUNCNAME[0]}() » function" >&2;

        echo >&2;

        # Setting the value of the "${v_isPrinted}" variable to "false" in order to ensure that the following messages will be printed in English if one of the following messages would be missing.
        v_isPrinted='false';

		BU.ModuleInit.GetModuleInitLanguage_RestOfLibrary || return 1;

    elif [ "${p_lang_ISO_639_1^^}" != 'NULL' ] && [ ! -f "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH}/${p_lang_ISO_639_1}.locale" ]; then
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "ACHTUNG : Die Übersetzungsdatei für die Sprache, die beim Aufruf der Funktion « ${FUNCNAME[0]}() » als Argument angegeben wurde, konnte im Ordner « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} » nicht gefunden werden" >&2 && v_isPrinted='true';
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "WARNING : The translation file for the language specified as an argument when calling the « ${FUNCNAME[0]}() » function was not found in the « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} » directory" >&2 && v_isPrinted='true';
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'es' ] && echo "ADVERTENCIA : El archivo de traducción para el idioma especificado como argumento al llamar a la función « ${FUNCNAME[0]}() » no se encontró en el directorio « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} »" >&2 && v_isPrinted='true';

		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "ATTENTION : Le fichier de traduction destiné à la langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]}() » n'a pas été trouvé dans le dossier « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} »" >&2 && v_isPrinted='true';
        [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "ATENÇÃO : O ficheiro de tradução para a língua especificada como argumento ao chamar a função « ${FUNCNAME[0]}() » não foi encontrado na pasta « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} »" >&2 && v_isPrinted='true';
		[ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "ВНИМАНИЕ : Файл перевода для языка, указанного в качестве аргумента при вызове функции « ${FUNCNAME[0]}() » не найден в каталоге « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} »." >&2 && v_isPrinted='true';

        [ "${v_isPrinted}" != 'true' ] && echo "WARNING : The translation file for the language specified as an argument when calling the « ${FUNCNAME[0]}() » function was not found in the « ${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH} » directory" >&2;

        # Setting the value of the "${v_isPrinted}" variable to "false" in order to ensure that the following messages will be printed in English if one of the following messages would be missing.
        v_isPrinted='false';

        echo >&2;

        BU.ModuleInit.GetModuleInitLanguage_RestOfLibrary || return 1;

    else
        # Sourcing the English translation files first, since these files are the most supported, so that if new variables are added, no empty strings will be displayed if the next language files are not updated yet.
        BU.ModuleInit.SourceEnglishTranslationFiles "${__BU_MODULE_INIT__USER_LANG,,}";

        # Sourcing the current language's translations file if the base of the framework is not compiled.
        BU.ModuleInit.IsFrameworkCompiled || {
            source "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH}/${p_lang_ISO_639_1}.locale" || {
                [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'de' ] && echo "ACHTUNG : Die Übersetzungsdatei für die als Argument angegebene Sprache konnte beim Aufruf der Funktion « ${FUNCNAME[0]}() » nicht gefunden werden." >&2 && v_isPrinted='true';
                [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'en' ] && echo "WARNING : Unable to source the translation file for the language specified as argument when calling the « ${FUNCNAME[0]}() » function" >&2 && v_isPrinted='true';
                [ "${__BU_MODULE_INIT__USER_LANG,,}" == "es" ] && echo "ADVERTENCIA : No se ha podido obtener el archivo de traducción para el idioma especificado en el argumento al llamar a la función « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';

                [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'fr' ] && echo "ATTENTION : Impossible de sourcer le fichier de traduction destiné à la langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';
                [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'pt' ] && echo "ATENÇÃO : Não foi possível obter o ficheiro de tradução para a língua especificada como argumento ao chamar a função « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';
                [ "${__BU_MODULE_INIT__USER_LANG,,}" == 'ru' ] && echo "ВНИМАНИЕ : Невозможно включить файл перевода для языка, указанного в качестве аргумента, при вызове функции « ${FUNCNAME[0]}() »" >&2 && v_isPrinted='true';

                # If the language chosen by the user is not (yet) supported directly in this function, the message is displayed in English.
                [ "${v_isPrinted}" != 'true' ] && echo "WARNING : Unable to source the translation file for the language specified as argument when calling the « ${FUNCNAME[0]}() » function" >&2;

                echo >&2;

                BU.ModuleInit.GetModuleInitLanguage_RestOfLibrary || return 1;
            }
        }

        # Calling the function which defines every variables containing the translated messages.
        BU.ModuleInit.SetInitLocale."${__BU_MODULE_INIT__USER_LANG}";
    fi
}
#"
## ----------------------------------------------

## FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES

# ··························································································································································
# Asking to the user if s/he wants to display the initialization logs on the screen (preferably before stopping the script's execution after a fatal error).

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.MsgLine()   -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLog()  -> Modules initializer script (this file)

function BU.ModuleInit.AskPrintLog()
{
    #**** Code ****
    # If no value is stored in the log messages array, then the log messages display procedure is cancelled.
    if [ -z "${__BU_MODULE_INIT_MSG_ARRAY[*]}" ] || [ ${#__BU_MODULE_INIT_MSG_ARRAY[@]} -eq 0 ]; then
        echo "${__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_LOG_TO_DISPLAY}";
        echo; return 0;
    fi

	if [[ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" != --log-shut?(-display) ]]; then
        echo;

		BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__ASKPRINTLOG__ASK_DISPLAY}" '#' 'echo';
		echo;

		# If the user's system language is not English, then a message will be displayed to ask the user in his/her language to write 'yes' or 'Y' if he/she wants to display the initialization logs.
		if [[ "${LANG,,}" != en_* ]]; then
            echo "${__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_ENGLISH}";
            echo;
		fi

		read -rp "${__BU_MODULE_INIT_MSG__ASKPRINTLOG__ENTER_ANS}" read_ask_print_log;
		echo;

		if [ "${read_ask_print_log,,}" == 'yes' ] || [ "${read_ask_print_log^^}" == 'Y' ]; then
			BU.ModuleInit.PrintLog || return 1;

			return 0;
		else
			echo "${__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_DISPLAY}"; echo; return 0;
		fi
	else
		return 0;
	fi
}

# ·······························································
# Printing and / or logging the global variables already defined.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.Msg()           -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLine()       -> Modules initializer script (this file)

#   - DisplayInitGlobalVarsInfos()  -> Modules initializer script (this file)

function BU.ModuleInit.DisplayInitGlobalVarsInfos__DisplayInitializedGlobalVarsInfos()
{
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_GLOBAL_VARS}" '#' 'msg';
    BU.ModuleInit.Msg;

    # ~~~
    # PID
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__SCRIPT_INFO}" '+' 'msg'; BU.ModuleInit.Msg;

    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__PROJECT_PID' "${__BU_MODULE_INIT__PROJECT_PID}" 'Int' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__PID}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__project_pid__lineno}";

    BU.ModuleInit.Msg;

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # FINDING THE ".Bash-utils" FOLDER'S PARENT DIRECTORY
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__ROOT_HOME" "${__BU_MODULE_INIT__ROOT_HOME}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT_HOME}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__root_home__lineno}";

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # FINDING THE ".Bash-utils" FOLDER
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_ROOT_DIR_VARS}" '+' 'msg'; BU.ModuleInit.Msg;

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__ROOT" "${__BU_MODULE_INIT__ROOT}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__root__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__INITIALIZER_PATH' "${__BU_MODULE_INIT__INITIALIZER_PATH}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INITIALIZER_PATH}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__initializer_path__lineno}";

    BU.ModuleInit.Msg;

    # ~~~~~~~~~~~~~~~~~~~
    # TEMPORARY DIRECTORY
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIVGI__INIT_TMP_DIR}" '+' 'msg'; BU.ModuleInit.Msg;
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__TMP_DIR_NAME' "${__BU_MODULE_INIT__TMP_DIR_NAME}" 'String' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIVGI__TMP_DIR_NAME}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__tmp_dir_name__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__TMP_DIR_PATH" "${__BU_MODULE_INIT__TMP_DIR_PATH}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIVGI__TMP_DIR_PATH}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__tmp_dir_path__lineno}";

    # ~~~~~~~~~~~~~~~~~~~~~~~~~
    # CONFIGURATION DIRECTORIES
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_CONF_DIRS}" '+' 'msg'; BU.ModuleInit.Msg;

    # "${__BU_MODULE_INIT__CONFIG_DIR_*}" global variables.
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_DIR_PARENT" "${__BU_MODULE_INIT__CONFIG_DIR_PARENT}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR_PARENT}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_dir_parent__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_DIR_NAME" "${__BU_MODULE_INIT__CONFIG_DIR_NAME}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR_NAME}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_dir_name__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_DIR_PATH" "${__BU_MODULE_INIT__CONFIG_DIR_PATH}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR_PATH}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_dir_path__lineno}";


    # "${__BU_MODULE_INIT__CONFIG_INIT_DIR_*}" global variables.
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_DIR_PARENT" "${__BU_MODULE_INIT__CONFIG_INIT_DIR_PARENT}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR_PARENT}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_dir_parent__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_DIR_NAME" "${__BU_MODULE_INIT__CONFIG_INIT_DIR_NAME}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR_NAME}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_dir_name__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_DIR_PATH" "${__BU_MODULE_INIT__CONFIG_INIT_DIR_PATH}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_dir_path__lineno}";


    # "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_*}" global variables.
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_MODULES_DIR_PARENT" "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PARENT}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR_PARENT}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_modules_dir_parent__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_MODULES_DIR_NAME" "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_NAME}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR_NAME}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_modules_dir_name__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH" "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_modules_dir_path__lineno}";


    # "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_*}" global variables.
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PARENT" "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PARENT}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR_PARENT}"
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_lang_dir_parent__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_NAME" "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_NAME}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR_NAME}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_lang_dir_name__lineno}";

    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH" "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH}" 'Dirpath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR_PATH}" \
        "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_lang_dir_path__lineno}";

    BU.ModuleInit.Msg;

    # INITIALIZER SCRIPT'S CONFIGURATION FILES.
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__CONFIGURATION_FILES}" '+' 'msg';
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS'    "${__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS}"  'Filepath' "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__STATUS}"  "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__config_init_dir__status__lineno}";

    # MODULE DIRECTORIES
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MODULE_INIT_DIR}" '+' 'msg'; BU.ModuleInit.Msg;
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__MODULES_DIR"                "${__BU_MODULE_INIT__MODULES_DIR}"              'Dirpath'   "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__MODULES_DIR}"             "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__modules_dir__lineno}";
    BU.ModuleInit.Msg;

    # FILES
    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_FILE_PATH}" '+' 'msg'; BU.ModuleInit.Msg
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME"                "${__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME}"              'File'      "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME}"         "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__lib_root_dir__file_name__lineno}";
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR"          "${__BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR}"        'Dirpath'   "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR}"   "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__lib_root_dir_file__parent_dir__lineno}";
    BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH"                "${__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH}"              'Filepath'  "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH}"         "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__lib_root_dir__file_path__lineno}";
    BU.ModuleInit.Msg;

    if [ -z "${__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH}" ]; then
        BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_ROOT_FILE}" '+' 'msg'; BU.ModuleInit.Msg;
        BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME"           "${__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME}"         'File'      "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME}"         "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__lib_root_dir_root__file_name__lineno}";
        BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR"      "${__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR}"    'Dirpath'   "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR}"   "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__lib_root_dir_root_file__parent_dir__lineno}";
        BU.ModuleInit.DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH"           "${__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH}"         'Filepath'  "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH}"         "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__lib_root_dir_root__file_path__lineno}";
        BU.ModuleInit.Msg;
    fi

    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MISC_VARS}" '+' 'msg'; BU.ModuleInit.Msg;
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__BU_BASE_IS_TRANSLATED'                  "${__BU_MODULE_INIT__BU_BASE_IS_TRANSLATED}"                'Bool'      "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__BU_BASE_IS_TRANSLATED}"               "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__bu_base_is_translated__lineno}";
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM'            "${__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM}"          'Char'      "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__TRANSLATION_FILE_DELIM}"              "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__csv_translation_file__delim__lineno}";
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__DATE_LOG'                               "${__BU_MODULE_INIT__DATE_LOG}"                             'CMD'       "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__DATE_LOG}"                            "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__date_log__lineno}";
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__USER_LANG'                              "${__BU_MODULE_INIT__USER_LANG}"                            'CMD'       "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__USER_LANG}"                           "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__user_lang__lineno}";
    BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__BASHX_DEBUG_VALS_ARRAY'                 "${__BU_MODULE_INIT__BASHX_DEBUG_VALS_ARRAY}"               'Array'     "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__BASHX_DEBUG_VALS_ARRAY}"              "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${__bu_module_init__bashx_debug_vals_array__lineno}";

    # Unsetting every string variables in order to free up some memory.

	# DO NOT single or double quote the following command substitution.

	# shellcheck disable=SC2046
	unset $(compgen -v "__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__");

    # Unsetting the line number values.

    # shellcheck disable=SC2046
	unset $(compgen -v __bu_module_init__*__lineno);
    unset __bu_module_init__project_pid__lineno \
        __bu_module_init__root_home__lineno \
        __bu_module_init__root__lineno \
        __bu_module_init__initializer_path__lineno \
        __bu_module_init__config_dir_parent__lineno \
        __bu_module_init__config_dir_name__lineno \
        __bu_module_init__config_dir_path__lineno \
        __bu_module_init__config_init_dir_parent__lineno \
        __bu_module_init__config_init_dir_name__lineno \
        __bu_module_init__config_init_dir_path__lineno \
        __bu_module_init__config_modules_dir_path__lineno \
        __bu_module_init__config_init_lang_dir_path__lineno \
        __bu_module_init__config_init_dir__status__lineno \
        __bu_module_init__modules_dir__lineno \
        __bu_module_init__tmp_dir_name__lineno \
        __bu_module_init__tmp_dir_path__lineno \
        __bu_module_init__lib_root_dir__file_name__lineno \
        __bu_module_init__lib_root_dir_file__parent_dir__lineno \
        __bu_module_init__lib_root_dir__file_path__lineno \
        __bu_module_init__lib_root_dir_root__file_name__lineno \
        __bu_module_init__lib_root_dir_root_file__parent_dir__lineno \
        __bu_module_init__lib_root_dir_root__file_path__lineno \
        __bu_module_init__csv_translation_file__delim__lineno \
        __bu_module_init__date_log__lineno \
        __bu_module_init__user_lang__lineno \
        __bu_module_init__bashx_debug_vals_array__lineno
}

# ·······························································
# Displaying the information on the initialized global variables.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.Msg()       -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLine()   -> Modules initializer script (this file)

# shellcheck disable=SC2059
function BU.ModuleInit.DisplayInitGlobalVarsInfos()
{
    if [ "${__BU_MODULE_INIT_MSG_ARRAY_MODE}" == '--mode-log-full' ]; then

        #**** Parameters ****
        local p_var_name=${1:-$'\0'};       # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Name of the variable.
        local p_var_val=${2:-$'\0'};        # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Value stored in the variable (DO NOT FILL THIS FIELD IF THE VARIABLE TYPE IS AN ARRAY, INSTEAD, LEAVE IT AS AN EMPTY STRING).
        local p_var_type=${3:-$'\0'};       # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Type of variable (array, int (integer), float, path, string).
        local p_var_desc=${4:-$'\0'};       # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Description of the variable.
        local p_modl=${5:-NULL};            # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Module where the variable was declared.
        local p_file=${6:-NULL};            # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : File where the variable was declared.
        local p_func=${7:-NULL};            # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Function where the variable was declared.
        local p_line=${8:-NULL};            # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL     - DESC : Line where the variable was declared.

        # If the variable type is an array, then the values must be passed as an array,
        # or else only the first index's value will be displayed.
        shift 8;
        local pa_var_val_array=("${@}");    # ARG TYPE : Array      - OPTIONAL  | DEFAULT VAL : NULL    - DESC :

        #**** Variables ****
        local v_modl; # VAR TYPE : String   - DESC :
        local v_file; # VAR TYPE : String   - DESC :
        local v_func; # VAR TYPE : String   - DESC :
        local v_line; # VAR TYPE : String   - DESC :

        local v_type; # VAR TYPE : String   - DESC : Translating and giving more informations about the variable types.

        #**** Code ****
        v_modl="$(if [[ "${p_modl^^}" != 'NULL' ]]; then printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__MODL}" "${p_modl}"; else echo "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__MODL_NULL}"; fi)";
        v_file="$(if [[ "${p_file^^}" != 'NULL' ]]; then printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE}" "${p_file}"; else echo "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE_NULL}"; fi)";
        v_func="$(if [[ "${p_func^^}" != 'NULL' ]]; then printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC}" "${p_func}"; else echo "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC_NULL}"; fi)";
        v_line="$(if [[ "${p_line^^}" != 'NULL' ]]; then printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE}" "${p_line}"; else echo "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE_NULL}"; fi)";

		if [ "${p_var_type^^}" == 'NULL' ]; then
            p_var_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__NO_VAR_TYPE_GIVEN}";
        else
            # Checking if the "${p_var_type}" argument value matches an awaited pattern.
            # - array	: this variable is an array.
            # - achar   : this variable stores an alphabetic character.
            # - astring : this variable stores an alphabetic string.
            # - bool    : this variable stores a boolean value ("true" or "false" only).
            # - cmd	    : this variable stores code in order to perform an action (either a function, a command or a condition)
            # - char    : this variable stores a single alphanumeric character (can be alphabetic or numeric).
            # - dir		: this variable stores the name of a directory.
            # - dirpath : this variable stores the path to a directory.
            # - file	: this variable stores the name of a file.
            # - filepath: this variable stores the path to a file.
            # - float	: this variable stores a floating number.
            # - floatneg: this variable stores a negative floating number only.
            # - floatpos: this variable stores a positive floating number only.
            # - int		: this variable stores an integer.
            # - intneg  : this variable stores a negative integer only.
            # - intpos  : this variable stores a positive integer only.
            # - path 	: this variable stores the path to a directory or a file.
            # - string	: this variable stores a string (other than the name of a directory or a file, or a path).
            if      [[ "${p_var_type,,}" != arr?(ay) ]];    then true;
            elif    [ "${p_var_type,,}" != 'cmd' ];         then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__CMD}";
            elif    [ "${p_var_type,,}" != 'dir' ];         then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__DIR}";
            elif    [ "${p_var_type,,}" != 'int' ];         then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__INT}";
            elif    [ "${p_var_type,,}" != 'bool' ];        then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__BOOL}";
            elif    [ "${p_var_type,,}" != 'char' ];        then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__CHAR}";
            elif    [ "${p_var_type,,}" != 'file' ];        then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__FILE}";
            elif    [ "${p_var_type,,}" != 'path' ];        then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__PATH}";
            elif    [ "${p_var_type,,}" != "achar" ];       then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__ACHAR}";
            elif    [ "${p_var_type,,}" != 'float' ];       then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__FLOAT}";
            elif    [ "${p_var_type,,}" != "intneg" ];      then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__INTNEG}";
            elif    [ "${p_var_type,,}" != "intpos" ];      then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__INTPOS}";
            elif    [ "${p_var_type,,}" != 'string' ];      then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__STRING}";
            elif    [ "${p_var_type,,}" != "astring" ];     then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__ASTRING}";
            elif    [ "${p_var_type,,}" != 'dirpath' ];     then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__DIRPATH}";
            elif    [ "${p_var_type,,}" != "filepath" ];    then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__FILEPATH}";
            elif    [ "${p_var_type,,}" != "floatneg" ];    then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__FLOATNEG}";
            elif    [ "${p_var_type,,}" != "floatpos" ];    then v_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__TYPE__FLOATPOS}";
			else
				p_var_type="${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__UNKNOWN_VAR_TYPE_GIVEN}";
            fi
		fi

        BU.ModuleInit.Msg;

		# Checking if the variable is an array.
		if [ "${p_var_type}" == 'array' ]; then
            BU.ModuleInit.MsgLine "$(printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_ARRAY}" "${p_var_name}")" '-' 'msg';

		# Checking if the variable is not an array.
		else
            # shellcheck disable=SC2059
            BU.ModuleInit.MsgLine "$(printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_NOT_ARRAY}" "${p_var_name}")" '-' 'msg';
		fi

		BU.ModuleInit.Msg;

		BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DESCRIPTION} ${p_var_desc}";
		BU.ModuleInit.Msg;

		BU.ModuleInit.Msg "${v_modl}";
		BU.ModuleInit.Msg "${v_file}";
		BU.ModuleInit.Msg "${v_func}";
		BU.ModuleInit.Msg "${v_line}";

		# If the variable type is an array, then each value is displayed in several blocks of five rows high, with it's index.
		if [ "${p_var_type,,}" == 'array' ]; then
            BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_TYPE}";
            BU.ModuleInit.Msg;

    		# If a value or more are stored in the processed array.
			if [ -n "${pa_var_val_array[*]}" ]; then

                local v_index=0;

                # Listing every values stored in the array.
                for _ in "${pa_var_val_array[@]}"; do
                    BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_VALUE} [${v_index}] : ${_}";

                    # Storing the following value's index, in order to check if the fifth line is reached (processed in the following condition).
                    local v_value_line=$(( v_index + 1 ));

                    # Writing a blank line every five lines, in order to keep the list easily readable for a human.
                    if [ $(( v_value_line % 5 )) -eq 0 ]; then

                        local TEST_var_val_arr;

                        # shellcheck disable=SC2116
                        TEST_var_val_arr="$(echo "${pa_var_val_array[${#pa_var_val_array[@]} -1]}")";

                        echo "VALUE : ${TEST_var_val_arr}";

                        # Avoid line breaks when the end of the array is reached, if it's last index's modulo of five is equal to 0.
                        if [ "${i}" -eq "${pa_var_val_array[${#pa_var_val_array[@]} -1]}" ]; then BU.ModuleInit.Msg '' '-n';

                        else BU.ModuleInit.Msg;

                        fi
                    fi

                    v_index=$(( v_index + 1 ));
                done;

                BU.ModuleInit.Msg;

                local v_index=0;

			else
				BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_EMPTY}" '-' 'msg';
                BU.ModuleInit.Msg;
			fi
		else
            # shellcheck disable=SC2059
            BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_TYPE}" "${p_var_type}" "${v_type}")";
            BU.ModuleInit.Msg;

			# If a variable is stored in the processed variable.
			if [ -n "${p_var_val}" ]; then

				if [ "${p_var_type,,}" == 'cmd' ]; then
                    # shellcheck disable=SC2059
					BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_CMD}" "${p_var_name}")";
				else
                    # shellcheck disable=SC2059
					BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_NOT_CMD}" "${p_var_val}")";
				fi

			else
				BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_EMPTY}" '-' 'msg';
            fi

			BU.ModuleInit.Msg;

			return 0;
		fi
	else
		return 0;
    fi
}

# ·········································································································································
# Handling the initializer's messages. In case of an error, there's no need to call this function, as the error messages MUST be displayed.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.AskPrintLog()       -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()              -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()        -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgAbort()          -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError()     -> Modules initializer script (this file)

function BU.ModuleInit.Msg()
{
    #**** Parameters ****
    local p_str=${1:-$'\0'};    # ARG TYPE : String     - OPTIONAL  | DEFAULT VAL : NULL    - DESC : The string to write.
    local p_option=${2:-$'\0'}; # ARG TYPE : String     - OPTIONAL  | DEFAULT VAL : NULL    - DESC : The "echo" command's options.

    #**** Code ****
    # If the '--log-display' argument is passed as a 'module' parameter, then every messages must
    # be printed on the screen and redirected towards the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
    if [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION,,}" == '--log-display' ]; then

        # If no messages are stored in the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" array yet;
        if [ -z "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION[*]}" ]; then
            declare __BU_MODULE_INIT_MSG_ARRAY=();
        fi;

        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "${p_str}" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=(''); echo -ne '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("${__BU_MODULE_INIT__DATE_LOG} ${p_str}");

                    echo -ne "${p_str}";
                fi;

                return 0;
            ;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "${p_str}" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('\n'); echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("${__BU_MODULE_INIT__DATE_LOG} ${p_str}\n");

                    echo -e "${p_str}";
                fi;

                return 0;
            ;;
        esac

    # Else, if the '--log-shut' argument is passed as a 'module' parameter, then every initialization
    # messages must be redirected towards the "/dev/null" virtual device file, and the array must be emptied.
    elif [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION,,}" == '--log-shut' ]; then
        return 0;

    # Else, if the '--log-shut-display' argument is passed as a 'module' parameter, then
    # every initialization messages must be redirected to the screen only, not to the array.
    elif [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION,,}" == '--log-shut-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "${p_str}" ]; then
                    echo -ne '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    echo -ne "${p_str}";
                fi

                return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "${p_str}" ]; then
                    echo -e '\n';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    echo -e "${p_str}";
                fi

                return 0;
            ;;
        esac

    # Else, if the '--log-no-display' argument is passed as a 'module' parameter OR if the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" global variable
    # stores no value (empty by default), then every initialization messages must be stored in the "${__BU_MODULE_INIT_MSG_ARRAY}" array without being printed on the screen.
    elif [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION,,}" == '--log-no-display' ] || [ -z "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "${p_str}" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('');

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("${__BU_MODULE_INIT__DATE_LOG} ${p_str}");
                fi

                    return 0;
                ;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "${p_str}" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('\n');

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("${__BU_MODULE_INIT__DATE_LOG} ${p_str}\n");
                fi

                return 0;
            ;;
        esac

    # Else, if an incorrect value is passed as "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" global variable's value.
    else
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 1))" 'E_BUINIT__MSG__BAD_ARRAY_PERMISSION_VAL';

        # shellcheck disable=SC2059
        printf "${__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_1}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" >&2; echo >&2;

        echo "${__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_2}" >&2;

        BU.ModuleInit.MsgAbort;

        BU.ModuleInit.AskPrintLog >&2 || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
    fi

    return 0;
}

# ···············································
# Writing a text under a line with the same size.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.Msg()               -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLineCount()      -> Modules initializer script (this file)

function BU.ModuleInit.MsgLine()
{
    #**** Parameters ****
    local p_str=${1:-$'\0'};        # ARG TYPE : String     - OPTIONAL  | DEFAULT VAL : NULL    - DESC : String to write.
    local p_line=${2:-$'\0'};       # ARG TYPE : Char       - OPTIONAL  | DEFAULT VAL : NULL    - DESC : Line character.
    local p_context=${3:-'echo'};   # ARG TYPE : String     - OPTIONAL  | DEFAULT VAL : NULL    - DESC : Context of the function's call (should the text be processed by the "BU.ModuleInit.Msg" function or with a simple "echo" command ?).

    #**** Code ****
    if      [ "${p_context,,}" == 'echo' ]; then
        BU.ModuleInit.MsgLineCount "${#p_str}" "${p_line}" 'echo';
        echo "${p_str}";

    elif    [ "${p_context,,}" == 'msg' ]; then
        BU.ModuleInit.MsgLineCount "${#p_str}" "${p_line}" 'msg' || return 1;
        BU.ModuleInit.Msg "${p_str}" || return 1;
    fi

    return 0;
}

# ······························································································································
# Drawing a line with a character, that is the same lenght as a string, in order to separate the messagges from different steps.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.Msg()               -> Modules initializer script (this file)

function BU.ModuleInit.MsgLineCount()
{
    #**** Parameters ****
    local p_number=${1:-$'\0'};     # ARG TYPE : Int    - REQUIRED | DEFAULT VAL : NULL     - DESC : Number of times the character has to be display.
    local p_line=${2:-$'\0'};       # ARG TYPE : Int    - REQUIRED | DEFAULT VAL : NULL     - DESC : Line character.
    local p_context=${3:-'echo'};   # ARG TYPE : NULL   - REQUIRED | DEFAULT VAL : NULl     - DESC : Context of the function's call (should the text be processed by the "BU.ModuleInit.Msg" function or with a simple "echo" command ?).

    #**** Code ****
    if      [ "${p_context,,}" == 'echo' ]; then
        for ((i=0; i<p_number; i++)); do echo -n "${p_line}"; done; echo;

    elif    [ "${p_context,,}" == 'msg' ]; then
        for ((i=0; i<p_number; i++)); do BU.ModuleInit.Msg "${p_line}" '-n' || return 1; done; BU.ModuleInit.Msg || return 1;
    fi

    return 0;
}

# ············································
# Writing a non-empty (and translated) string.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.Exit()              -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()        -> Modules initializer script (this file)

function BU.ModuleInit.MsgTranslate()
{
    if [ -n "${1}" ]; then
        echo "${1}";
    else
        if [ "${2,,}" == 'nofail' ]; then
            return 0;
        else
            echo "No message to translate";

            if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi;
        fi
    fi
}

# BU.ModuleInit.MsgTranslate "$(printf "TEST %s" "AS")";

# BU.ModuleInit.Msg "$(BU.ModuleInit.MsgTranslate "TEST 2")";
# BU.ModuleInit.Msg;

# ······························································
# Displaying a text when the script's execution must be stopped.

function BU.ModuleInit.MsgAbort() { echo >&2; echo "${__BU_MODULE_INIT_MSG__MSG_ABORT__ABORT}" >&2; echo >&2; return 0; }

# ·················································
# Pressing any key on the keyboard to do an action.

# shellcheck disable=SC2059
function BU.ModuleInit.PressAnyKey() { echo; read -n 1 -s -r -p "$(printf "${__BU_MODULE_INIT_MSG__PRESS_ANY_KEY__PRESS} %s" "${1}")"; echo; return 0; }

# ···························································································································
# Printing the initialization on the screen. Although this function is called if the '--log-display' value is passed with the
# "module" argument, this function could be used as a help, in case this value's parameters doesn't work in case of a rework.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.MsgLine()       -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLineCount()  -> Modules initializer script (this file)
#   - BU.ModuleInit.PressAnyKey()   -> Modules initializer script (this file)

# shellcheck disable=SC2129
function BU.ModuleInit.PrintLog()
{
    #**** Variables ****
    declare -i v_int_randomizer;    # VAR TYPE : Int        - DESC : This variable stores a random number between 3 and 6 included.
    declare -i v_str_max_size;      # VAR TYPE : Int        - DESC : This variable stores the maximum size of the "${v_str_randomizer}" string.

    local v_str_randomizer;         # VAR TYPE : String     - DESC : This string stores the randomized string which is written in the log file's name.
    local v_str_randomizer_int;     # VAR TYPE : int        - DESC : This variable stores the randomized numer of times another generated md5sum string must be added into the "${v_str_randomizer} variable".
    local v_str_randomizer_tmp;     # VAR TYPE : String     - DESC : This string stores the newly generated md5sum string before it is added into the "${v_str_randomizer}" variable.
    local v_tmp_file;               # VAR TYPE : Filepath   - DESC : Path to the file which stores the content of the "${__BU_MODULE_INIT_MSG_ARRAY[@]}" array.

    #**** Code ****
    v_str_max_size=150;

    shopt -s extglob;

    v_str_randomizer="$(echo "${RANDOM}" | md5sum)";
    v_str_randomizer="${v_str_randomizer%%+(  -)}";

    # Adding some extra randomized numbers, a random number of times between 3 and 6 included.
    v_int_randomizer="$(shuf -i 1-3 -n 1)" || false;

    for ((i=0; i<v_int_randomizer; i++)); do
        v_str_randomizer_tmp="$(echo "${RANDOM}" | md5sum)";
        v_str_randomizer+="${v_str_randomizer_tmp%%+(  -)}";
    done

    # Checking if the name of the file to create is not longer than 255 characters. If so, its size is reduced.
    if [ "${#v_str_randomizer}" -gt "${v_str_max_size}" ]; then
        echo "Filename's randomizer string too long, reducing its size to ${v_str_max_size}" >&2;
        echo >&2;

        until [ "${#v_str_randomizer}" -eq "${v_str_max_size}" ]; do
            v_str_randomizer_int="${#v_str_randomizer}";

            echo "Current number of characters : ${v_str_randomizer_int}";
            echo "String content : ${v_str_randomizer}";
            echo;

            v_str_randomizer="${v_str_randomizer%%+("${v_str_randomizer:$(( v_str_randomizer_int - 1 ))}")}";
        done
    fi

    # Removing the extra whitespace with the dash.
    v_tmp_file="$(printf "%s" "${__BU_MODULE_INIT__ROOT}/$(date +"%Y-%m-%d %H:%M:%S")")___${v_str_randomizer}.tmp"; shopt -u extglob;

    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__PRINTLOG__HERE}" '#' 'echo'; echo

    # If no value is stored in the log messages array, then the log messages display procedure is cancelled.
    if [ -z "${__BU_MODULE_INIT_MSG_ARRAY[*]}" ] || [ ${#__BU_MODULE_INIT_MSG_ARRAY[@]} -eq 0 ]; then
        echo "${__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_LOG_TO_DISPLAY}";
        echo; return 0;
    fi

    if [ "${__BU_MODULE_INIT_MSG_ARRAY_MODE}" == '--mode-log-full' ]; then
        if [ "${__BU_MODULE_INIT_MSG_ARRAY_MODE__IS_ARG,,}" == 'true' ]; then
            echo "${__BU_MODULE_INIT_MSG__PRINTLOG__FULL_MODE__PARAM}";
        else
            echo "${__BU_MODULE_INIT_MSG__PRINTLOG__FULL_MODE}";
        fi

    elif [ "${__BU_MODULE_INIT_MSG_ARRAY_MODE}" == '--mode-log-partial' ]; then
        if [ "${__BU_MODULE_INIT_MSG_ARRAY_MODE__IS_ARG,,}" == 'true' ]; then
            echo "${__BU_MODULE_INIT_MSG__PRINTLOG__PARTIAL_MODE__PARAM}";
        else
            echo "${__BU_MODULE_INIT_MSG__PRINTLOG__PARTIAL_MODE}";
        fi
    fi

    echo;

    BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__PRINTLOG__INITLOGS}" '-' 'echo';
    BU.ModuleInit.MsgLineCount "${#__BU_MODULE_INIT_MSG__PRINTLOG__INITLOGS}" '-' 'echo';
    echo '';

    echo "${__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE}";
    echo '';

	echo "${__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_ADVICE_IF_NO_LOGS_ARE_DISPLAYED}";
	echo '';

    BU.ModuleInit.PressAnyKey "${__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CALL_PRESS_ANY_KEY_FNCT}";
    echo '';

    touch "${v_tmp_file}" || { echo >&2; echo "${__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CANNOT_CREATE_TMP_FILE}" >&2; echo >&2; return 1; };

    echo "${__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE}" >> "${v_tmp_file}";
    echo >> "${v_tmp_file}";

    echo "${__BU_MODULE_INIT_MSG__PRINTLOG__DONT_PRESS_Q}" >> "${v_tmp_file}";
    echo >> "${v_tmp_file}";

    for _ in $(eval echo -e "{1..${#__BU_MODULE_INIT_MSG__PRINTLOG__DONT_PRESS_Q}}"); do echo -n '-' >> "${v_tmp_file}"; done; echo >> "${v_tmp_file}";

    echo >> "${v_tmp_file}";

    for value in "${__BU_MODULE_INIT_MSG_ARRAY[@]}"; do
        # shellcheck disable=SC2059
        printf "${value##* ] }" >> "${v_tmp_file}";
    done

    less "${v_tmp_file}"; rm "${v_tmp_file}";

    echo; echo ">>>>> ${__BU_MODULE_INIT_MSG__PRINTLOG__POST_DISPLAY_TEXT}"; echo;

	# WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array, and it calls this function.

	return 0;
}

# ···················································
# Print an error message in the log storage variable.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.Msg()       -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLine()   -> Modules initializer script (this file)

#   - BU.ModuleInit.PrintLogErrorNoTranslationFilesSourced() -> Modules initializer script (this file)

function BU.ModuleInit.PrintLogError()
{
    #**** Parameters ****
    local p_file=${1:-$'\0'};       # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : File where the error happened.
    local p_lineno=${2:-$'\0'};     # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL     - DESC : Line where the error happened.
    local p_errcode=${3:-$'\0'};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Error code, in order to find what kind of error happened.

    #**** Code ****
    if [ -z "${__BU_MODULE_INIT_MSG_ARRAY_EXISTS}" ]; then
        echo >&2;

        # No need to redefine the three arguments inside this sub-function, the scope of the current function's local variables reach the sub-functions called inside the current function.
        BU.ModuleInit.PrintLogErrorNoTranslationFilesSourced;
    else
        if [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION,,}" != '--log-shut-display' ]; then
            local v_msg_arr_mode_backup="${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}";

            __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='--log-shut-display';
        fi

        BU.ModuleInit.Msg >&2;

        # shellcheck disable=SC2059
        BU.ModuleInit.MsgLine "$(printf "${__BU_MODULE_INIT_MSG__PRINTLOG_ERROR__PRINT_ERROR}" "${p_file}" "${p_lineno}" "${p_errcode}")" '-' 'echo' >&2;

        BU.ModuleInit.Msg >&2;

        if [ -n "${v_msg_arr_mode_backup}" ]; then __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="${v_msg_arr_mode_backup}"; fi
    fi

    return 0;
}

## ----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES INITIALIZATION

# ····················································
# Checking the currently used Bash language's version.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS MODULES INITIALIZATION ERROR : In \n\t%s,\n\tline $(( LINENO - 1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2;
		echo -e "This Bash library requires at least the Bash language's version 4.0.0" >&2;
		echo >&2;

		echo -e "Your Bash version is : ${BASH_VERSION}" >&2;
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library" >&2;
		echo >&2;

		# WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY}" array.
		return 1;
	fi
}

# ···········································································································
# Check if the given path exists (This function is called by the "BU.ModuleInit.SourcingFailure()" function).

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.CheckPath()
{
    #**** Parameters ****
    local p_path=${1:-NULL};        # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Path of the target file or directory.
    local p_target=${2:-NULL};      # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Specify if the target is a directory or a file.
#    local p_findPath=${3:-NULL}     # ARG TYPE : String     - OPTIONAL | DEFAULT VAL : NULL     - DESC :

    #**** Code ****
    if [ "${p_path^^}" == 'NULL' ]; then
        # shellcheck disable=SC2059
        printf "« ${__BU_MODULE_INIT_MSG__CHECKPATH__NO_FILE_PATH} »" >&2; return 0;

    else
        if [ "${p_target,,}" == 'NULL' ]; then
            echo  >&2;

            # shellcheck disable=SC2059
            printf "${__BU_MODULE_INIT_MSG__CHECKPATH__NO_TARGET_SPECIFICATION}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" >&2; echo >&2;

            # shellcheck disable=SC2059
            printf "${__BU_MODULE_INIT_MSG__CHECKPATH__PLEASE_SPECIFY_TARGET_SPECIFICATION}" "${FUNCNAME[0]}" >&2; echo >&2; return 1;
        else
            if [[ "${p_target}" == [D-d] ]]; then

                if [ -d "${p_path}" ]; then
                    printf "%s" "${p_path}"; return 0;

                else
                    printf "%s ${__BU_MODULE_INIT_MSG__CHECKPATH__DIR_NOT_FOUND}" "${p_path}" >&2; return 0;
                fi

            elif [[ "${p_target}" == [F-f] ]]; then

                if [ -f "${p_path}" ]; then
                    printf "%s" "${p_path}"; return 0;

                else
                    printf "%s ${__BU_MODULE_INIT_MSG__CHECKPATH__FILE_NOT_FOUND}" "${p_path}" >&2; return 0;
                fi
            else
                echo >&2;

                # shellcheck disable=SC2059
                printf "${__BU_MODULE_INIT_MSG__CHECKPATH__UNKNOWN_TARGET}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" "${p_target}" >&2; echo >&2; return 1;
            fi
        fi
    fi
}

# ··············································································································
# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.AskPrintLog()                           -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()                                  -> Modules initializer script (this file)
#   - BU.ModuleInit.FindPathNoTranslationFilesSourced()     -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkBeingInstalled()             -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkCompiled()                   -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()                            -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError()                         -> Modules initializer script (this file)

# shellcheck disable=SC2059
function BU.ModuleInit.FindPath()
{
    #**** Parameters ****
    local v_parentdir=${1:-$'\0'};      # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Parent directory.
    local v_target=${2:-$'\0'};         # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Targeted directory or file.
    local v_targetType=${3:-$'\0'};     # ARG TYPE : Char       - REQUIRED | DEFAULT VAL : NULL     - DESC : Getting the type of data to create (d : Directory ; f : File), for the "BU.ModuleInit.CheckPath()" function.
    local v_shut=${4:-$'\0'};           # ARG TYPE : String     - OPTIONAL | DEFAULT VAL : NULL     - DESC : Shut the function's text output, when the function is used to find a file according to a certain pattern.
    local v_specific_var=${5:-$'\0'}    # ARG TYPE : String     - OPTIONAL | DEFAULT VAL : NULL     - DESC : Create a temporary file to store a specific path, for example if you check the existence of a file in a condition.

    #**** Variables ****
    local v_hasFailed;                  # VAR TYPE : String     - DESC : Ending the execution of the current function if an error occured during the execution of the "$(find)" command when a value is passed to the "${v_specific_var}" parameter.

    #**** Code ****
    [ "${v_targetType,,}" != 'd' ] && [ "${v_targetType,,}" != 'f' ] && v_targetType='NULL';

    find "${v_parentdir}" -maxdepth 1 -iname "${v_target}" -print 2>&1 | grep -v "Permission denied" || \
	{
        # If the "Bash-utils-root-val.path" was not found, its error management is skipped, since there may be a super-user privileged version called "Bash-utils-root-val-ROOT.path";
        if [ -z "${__BU_MODULE_INIT__TMP_VAR__FIND_PATH_FUNC_NO_ERR}" ]; then
            #**** Error management variables ****
            declare -i v_e_lineno="$(( LINENO - 2 ))";  # VAR TYPE : Int   - DESC : Storing the line where the last command has failed to execute correctly.

            #**** Error management code ****
            if [ -z "${__BU_MODULE_INIT_MSG_ARRAY_EXISTS}" ]; then
                if [ "${v_shut,,}" != 'shut' ]; then
                    echo >&2;

                    # If the "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH}" directory is not defined yet, or if the current file is not a compiled version of the Bash Utils Framework,
                    # it means that the translation files are not sourced yet, so the messages to display are hard-coded in this file.
                    if [ -z "${__BU_MODULE_INIT_IS_TRANSLATION_FILES_SOURCED}" ] && ! BU.ModuleInit.IsFrameworkCompiled && ! BU.ModuleInit.IsFrameworkBeingInstalled; then
                        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_e_lineno}" 'E_BUINIT__FIND_PATH__ECHO_1__PATH_NOT_FOUND';

                        BU.ModuleInit.FindPathNoTranslationFilesSourced "${FUNCNAME[0]}" "${FUNCNAME[1]}" "${BASH_SOURCE[0]}" "${v_e_lineno}" 'echo';

                        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
                    else
                        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_e_lineno}" 'E_BUINIT__FIND_PATH__ECHO_2__PATH_NOT_FOUND';

                        printf "${__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND} --> %s/%s\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" "${v_parentdir}" "${v_target}" >&2; echo >&2;

                        printf "${__BU_MODULE_INIT_MSG__FIND_PATH__TOP_LEVEL_FUNCTION}\n" "${FUNCNAME[0]}" "${FUNCNAME[1]}" >&2;

                        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
                    fi
                fi

            else
                if [ "${v_shut,,}" != 'shut' ]; then declare -i lineno="${LINENO}";
                    BU.ModuleInit.Msg >&2;

                    BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__FINDPATH__PATH_NOT_FOUND";

                    # If the "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH}" directory is not defined yet, or if the current file is not a compiled version of the Bash Utils Framework,
                    # it means that the translation files are not sourced yet, so the messages to display are hard-coded in this file.
                    if [ -z "${__BU_MODULE_INIT_IS_TRANSLATION_FILES_SOURCED}" ] && ! BU.ModuleInit.IsFrameworkCompiled && ! BU.ModuleInit.IsFrameworkBeingInstalled; then
                        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_e_lineno}" 'E_BUINIT__FIND_PATH__MSG_1__PATH_NOT_FOUND';

                        BU.ModuleInit.FindPathNoTranslationFilesSourced "${FUNCNAME[0]}" "${FUNCNAME[1]}" "${BASH_SOURCE[0]}" "${v_e_lineno}" 'echo';

                        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
                    else
                        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_e_lineno}" 'E_BUINIT__FIND_PATH__MSG_2__PATH_NOT_FOUND';

                        BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND} --> %s/%s\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" "${v_parentdir}" "${v_target}")" >&2; BU.ModuleInit.Msg >&2;

                        BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__FIND_PATH__TOP_LEVEL_FUNCTION}\n" "${FUNCNAME[0]}" "${FUNCNAME[1]}")" >&2;

                        BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

                        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
                    fi
                fi
            fi

            v_hasFailed='failed';
        fi
	};

	if [ "${v_hasFailed}" == 'failed' ]; then echo "FAILED"; if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi; fi

	if [ -n "${v_specific_var}" ]; then
        if [ -n "${__BU_MODULE_INIT__TMP_DIR_PATH}" ]; then
            local v_tmpfile;

            v_tmpfile="${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.${v_specific_var}.tmp";

            if [ ! -f "${v_tmpfile}" ]; then touch "${v_tmpfile}"; fi

            echo "${v_parentdir}/${v_target}" > "${v_tmpfile}";

            return 0;
        else
            # This function is called when the "${__BU_MODULE_INIT__TMP_DIR_PATH}" is created, but at this point, the temporary directory doesn't exists yet, so this feature MUST be disabled UNTIL this directory is created.
            if [ -z "${__BU_MODULE_INIT__TMP_DIR_NAME}" ]; then
                # Creating a variable to store the path of the file, if this value needs to be processed externally.
                __BU_MODULE_INIT__FIND_PATH_RETVAL="${v_parentdir}/${v_target}"; echo "${__BU_MODULE_INIT__FIND_PATH_RETVAL}" > "${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.tmp";

                return 0;
            fi
        fi
    fi

	return 0;
}

# ······························································································································
# Getting the module's name from a subdirectory (this function is called in the main module's "module.conf" configuration file).

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.AskPrintLog()   -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()          -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()    -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError() -> Modules initializer script (this file)

function BU.ModuleInit.GetModuleName()
{
    v_module="$(cd "$(dirname "${1}")" || { local lineno="${LINENO}";
        echo >&2;

        # shellcheck disable=SC2059
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__GETMODULE_NAME__MODULE_NOT_FOUND";

        # shellcheck disable=SC2059
        printf "${__BU_MODULE_INIT_MSG__GET_MODULE_NAME__UNABLE_TO_GET}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" >&2; echo >&2;

        BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
    }; pwd -P)";

    echo "${v_module##*/}"; return 0;
}

# ····························································································································
# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.AskPrintLog()   -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()          -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()    -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError() -> Modules initializer script (this file)

# shellcheck disable=SC2059
function BU.ModuleInit.ListInstalledModules()
{
    #**** Variables ****
    local v_module_tmp_d;   # VAR TYPE : Dirpath    - DESC : Path to the temporary folder which stores the files created in this function.

    local v_module_conf_f;  # VAR TYPE : Filepath   - DESC :
    local v_module_diff_f;  # VAR TYPE : Filepath   - DESC :
    local v_module_init_f;  # VAR TYPE : Filepath   - DESC :

    #**** Code ****
    v_module_tmp_d="${__BU_MODULE_INIT__ROOT}/${__BU_MODULE_INIT__TMP_DIR_NAME}";

    v_module_conf_f="${v_module_tmp_d}/BU_modules_config_dir.out";
    v_module_diff_f="${v_module_tmp_d}/BU_modules_init_diff.out";
    v_module_init_f="${v_module_tmp_d}/BU_modules_init_dir.out";

    if [ ! -d "${v_module_tmp_d}" ]; then
        mkdir -p "${v_module_tmp_d}" ||
		{
            BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMPDIR";

			printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 4 ))" "${__BU_MODULE_INIT__ROOT}" >&2; echo >&2;

			echo "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__ADVICE}" >&2; echo >&2;

            BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

            if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
		}
    fi

    if [ -d "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}" ] && [ -d "${__BU_MODULE_INIT__MODULES_DIR}" ]; then

																		                # In case the "$(ls)" command points towards a bad path because of a bad variable's value.
        ls -1 "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}"    > "${v_module_conf_f}"  || { echo >&2; printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" >&2; echo >&2; BU.ModuleInit.AskPrintLog >&2 || return 1; return 1; };
        ls -1 "${__BU_MODULE_INIT__MODULES_DIR}"                > "${v_module_init_f}"  || { echo >&2; printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${LINENO}" >&2; echo >&2; BU.ModuleInit.AskPrintLog >&2 || return 1; return 1; };

        if diff "${v_module_conf_f}" "${v_module_init_f}" > "${v_module_diff_f}"; then
            echo; echo "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INSTALLED_MODULES_LIST} :"; echo; sleep ".5";

            # Displaying the content of the file which stores both the found modules configuration folders and the the modules initialization folders.
            cat "${v_module_conf_f}"; echo; sleep 1;
        else
            echo >&2;

            printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__ONE_OR_MORE_MODULES_MISSING}\n" "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}" "${__BU_MODULE_INIT__MODULES_DIR}" >&2; echo >&2;

            echo "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_CONFIGURATION_FOLDER_LIST} :" >&2; echo >&2;

            # Displaying the content of the file which stores the found modules configuration folders.
            cat "${v_module_conf_f}" >&2; echo >&2;

            echo "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_INITIALIZATION_FOLDER_LIST} :" >&2; echo >&2;

            # Displaying the content of the file which stores the found modules initialization folders.
            cat "${v_module_init_f}"; echo >&2; echo >&2;

			# Getting the differences between the two files.
			echo "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__LISTED_MODULES_DIFFERENCES_BELOW}" >&2; echo >&2;

			# Printing the differences between the two generated files.
			sdiff "${v_module_conf_f}" "${v_module_conf_f}"; echo >&2;
        fi
    else
        if [ ! -d "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}" ] && [ ! -d "${__BU_MODULE_INIT__MODULES_DIR}" ]; then
            printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__BOTH_CONF_AND_INIT_FOLDER_ARE_MISSING}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 1 ))" >&2;

        elif [ -d "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}" ]; then
            printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__CONF_FOLDER_IS_MISSING}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 1 ))" >&2;

        elif [ -d "${__BU_MODULE_INIT__MODULES_DIR}" ]; then
            printf "${__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INIT_FOLDER_IS_MISSING}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 1 ))" >&2;
        fi

		echo >&2;
    fi

    BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

    if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
}

# ······················································
# Printing an error message if a file cannot be sourced.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.AskPrintLog()   -> Modules initializer script (this file)
#   - BU.ModuleInit.CheckPath()     -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()          -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()    -> Modules initializer script (this file)
#   - BU.ModuleInit.Msg()           -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError() -> Modules initializer script (this file)

# shellcheck disable=SC2059
function BU.ModuleInit.SourcingFailure()
{
    #**** Parameters ****
    local p_path=${1:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Path of the file that cannot be sourced.
    local p_module=${2:-NULL};  # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Name of the module.
    local p_file=${3:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : File where the inclusion failed.
    local p_func=${4:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Function where the inclusion failed.
    local p_line=${5:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Line where the inclusion failed.

    #**** Code ****
    BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${LINENO}" 'E_BUINIT__SOUCING_FAILURE';

    if [ "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" != '--log-shut-display' ]; then local v_msg_arr_mode_backup="${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}"; __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='--log-shut-display'; fi

    BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__SOURCING_FAILURE__UNABLE_TO_SOURCE}" "${p_file}" "${p_func}" "${p_line}" "${p_module}" "$(BU.ModuleInit.CheckPath "${p_path}" 'f')")" >&2; BU.ModuleInit.Msg >&2;

    if [ -n "${v_msg_arr_mode_backup}" ]; then __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="${v_msg_arr_mode_backup}"; fi

    BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

    if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
}

## ----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES PROCESSING

# ··············
# Usage function

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.MsgLine()       -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLineCount()  -> Modules initializer script (this file)

function BU.ModuleInit.ProcessFirstModuleParameters.Usage()
{
    echo >&2; echo "${__BU_MODULE_INIT_MSG__USAGE__SUPVALS}" >&2;
    echo >&2;

	BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG}" '-'; echo >&2;
	echo "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_DISPLAY}" >&2;
	echo "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_NO_DISPLAY}" >&2;
	echo "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT}" >&2;
	echo "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT_DISPLAY}" >&2;
	echo >&2;

	BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG}" '-'; echo >&2;
	echo "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_FULL}" >&2;
	echo "${__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_PARTIAL}" >&2;
	echo >&2

	BU.ModuleInit.MsgLine "${__BU_MODULE_INIT_MSG__USAGE__DEBUG_VALUES_LIST}" '-' >&2; echo >&2;
    echo "${__BU_MODULE_INIT_MSG__USAGE__DEBUG}" >&2;
    echo "${__BU_MODULE_INIT_MSG__USAGE__DEBUG_BASHX}" >&2;
    echo >&2;

    BU.ModuleInit.MsgLineCount "${#__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG}" '-' >&2;
}

# ··························
# Easy writing status error.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.DisplayStatError()
{
    #**** Parameters ****
    local p_file=${1:-NULL};        # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : File where the current function is called (mainly from the "BU.Main.StatusCheckSTAT<...>()" functions).
    local p_lineno=${2:-NULL};      # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL     - DESC : Line where the current function is called (mainly from the "BU.Main.StatusCheckSTAT<...>()" functions).
    local p_bad_value=${3:-NULL};   # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Bad value passed as "BU.Main.StatusCheckSTAT<...>()" function's argument.
    local p_var_name=${4:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Name of the variable that stores the bad value.

    # Shifting the same number of time as the former arguments number
    # to avoid including these arguments values in the allowed values array.
    shift 4;

    local pa_correctValues=("${@}");

    #**** Variables ****
    local i=0;

    #**** Code ****
    echo "AN ERROR OCCURED DURING THIS STATUS VARIABLE CHECKING --> ${p_var_name}" >&2;
    printf "In « %s », line « %s »" "${p_file}" "${p_lineno}" >&2;
    echo "Error : the « %s » variable's value is incorrect." "${p_var_name}" >&2;

    if [ "${p_bad_value^^}" == 'NULL' ]; then
        echo >&2; echo "Bad value : 'An empty string'" >&2;
    else
        echo >&2; EchoError "Bad value : « %s »" "${p_bad_value}" >&2;
    fi

    echo "The allowed values are :" >&2;

    # Displaying the list of every allowed arguments.
    for val in "${pa_correctValues[@]}"; do
        i=$(( i + 1 ));

        # If an empty argument is allowed.
        if [ -z "${val}" ]; then
            echo "%s/%s --> 'An empty argument'" "${i}" "${#pa_correctValues[@]}" >&2;
        else
            echo "%s/%s  --> %s" "${i}" "${#pa_correctValues[@]}" "${val}" >&2;
        fi
    done

    echo >&2;

    return 1;
}

# ·············································································
# Checking the "${__BU_MODULE_INIT_STAT_DEBUG}" global status variable's value.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.DisplayStatError()  -> Modules initializer script (this file)

function BU.ModuleInit.CheckSTAT_DEBUG()
{
    #**** Parameters ****
    local p_file=${1:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : File where the current function is called.
    local p_lineno=${2:-NULL};  # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL     - DESC : Line where the current function is called.

    #**** Variables ****
    local va_correctValues=("true" "false");    # VAR TYPE : Bool   - DESC :

    #**** Code ****
    if [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" != "true" ] && [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" != "false" ]; then
        BU.ModuleInit.DisplayStatError "${p_file}" "${p_lineno}" "${__BU_MODULE_INIT_STAT_DEBUG}" "__BU_MODULE_INIT_STAT_DEBUG" "${va_correctValues[@]}"; return "${?}";
    fi

    return 0;
}

# ···················································································
# Checking the "${__BU_MODULE_INIT_STAT_DEBUG_BASHX}" global status variable's value.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.DisplayStatError()  -> Modules initializer script (this file)

function BU.ModuleInit.CheckSTAT_DEBUG_BASHX()
{
    #**** Parameters ****
    local p_file=${1:-NULL};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : File where the current function is called.
    local p_lineno=${2:-NULL};  # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL     - DESC : Line where the current function is called.

    #**** Variables ****
    local va_correctValues=("${__BU_MODULE_INIT__BASHX_DEBUG_VALS_ARRAY[@]}");
    local v_ArrayValueFound;

    #**** Code ****
    [[ ${va_correctValues[*]} =~ ${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,} ]] && { v_ArrayValueFound='true'; return 0; };

    if [ "${v_ArrayValueFound,,}" != 'true' ]; then BU.ModuleInit.DisplayStatError "${p_file}" "${p_lineno}" \
            "${__BU_MODULE_INIT_STAT_DEBUG_BASHX}" "__BU_MODULE_INIT_STAT_DEBUG_BASHX" "${va_correctValues[@]}"; return "${?}"; fi

    return 0;
}

# ·············································································
# Changing the "${__BU_MODULE_INIT_STAT_DEBUG}" global status variable's value.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.CheckSTAT_DEBUG() -> Modules initializer script (this file)

function BU.ModuleInit.ChangeSTAT_DEBUG()         { __BU_MODULE_INIT_STAT_DEBUG="${1}";         BU.ModuleInit.CheckSTAT_DEBUG         "${2}" "${3}" || return "${?}"; return 0; }

# ·············································································
# Changing the "${__BU_MODULE_INIT_STAT_DEBUG}" global status variable's value.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.CheckSTAT_DEBUG_BASHX() Modules initializer script (this file)

function BU.ModuleInit.ChangeSTAT_DEBUG_BASHX()   { __BU_MODULE_INIT_STAT_DEBUG_BASHX="${1}";   BU.ModuleInit.CheckSTAT_DEBUG_BASHX   "${2}" "${3}" || return "${?}"; return 0; }

# ·····································
# Checking if the debug mode is active.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - Feel free to call a function if it is needed for your contribution.

function BU.ModuleInit.CheckIsDebugging()         { [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" == 'true' ] && return 0; return 1; }

# ·····················································································
# Processing the "module" value's parameters during the top priority modules inclusion.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.AskPrintLog()                   -> Modules initializer script (this file)
#   - BU.ModuleInit.CheckIsDebugging()              -> Modules initializer script (this file)
#   - BU.ModuleInit.DisplayInitGlobalVarsInfos()    -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()                          -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkCompiled()           -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()                    -> Modules initializer script (this file)
#   - BU.ModuleInit.Msg()                           -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgAbort()                      -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError()                 -> Modules initializer script (this file)

# shellcheck disable=SC1090
function BU.ModuleInit.ProcessFirstModuleParameters()
({
    #**** Parameters ****
    local p_module=${1:-$'\0'}; # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Module to include passed as argument, with its own parameters.
    local p_count=${2:-$'\0'};  # ARG TYPE : Int        - REQUIRED | DEFAULT VAL : NULL     - DESC : Counting the times the function was called in the "BashUtils_InitModules" function's main loop.

    #**** Variables ****
    local v_module_name;        # VAR TYPE : String     - DESC : Name of the module without its parameters.
    local v_loop_error;         # VAR TYPE : String     - DESC : This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

    #**** Code ****
    v_module_name="$(echo "${p_module}" | cut -d' ' -f1)";

    ## ----------------------------------------------

    ## PROCESSING THE 'module' VALUE'S ARGUMENTS VALUES

    # Checking if the "module --" value is passed as first argument, in order to configure immediately the initialization language and the authorization to display the initialization logs on the screen.

    # These numbers stored in the "${p_count}" variable refer to the modules indexes.
    if [ "${p_count}" -eq 0 ]; then

        # If the "module" value is passed without parameters.
        if [[ "${p_module}" == "${v_module_name}" ]]; then
            # shellcheck disable=SC2059
            BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__NO_OPTS";

            # shellcheck disable=SC2059
            printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( BASH_LINENO - 5 ))" >&2; echo >&2;

            echo "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__ADVICE}" >&2;

            BU.ModuleInit.MsgAbort;

            BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

            if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi

        elif [[ "${p_module}" == 'module --'* ]]; then

            # Creating a new global variable to store the word array made with the "module" value and the values that come with it.
            read -ra module_array <<< "${p_module}";

			# Unsetting the "module" value from the newly created array, in order to avoid an "unsupported argument" error.
			unset "module_array[0]";

            ## ----------------------------------------------

            ## MODULE : DEFINING RESOURCES FOR THE « module » ARGUMENTS PROCESSING

            # ················································································································································
            # Defining a function to optimize the displaying of errors for the 3 "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" global variable's accepted values.

            # Featured function(s) and file(s) by module(s) and from the "functions" folder :
            #   - BU.ModuleInit.PrintLogError() -> Modules initializer script (this file)

            function BU.ModuleInit.ProcessFirstModuleParameters.LogPermissionWarningOptimize()
            {
                #**** Parameters ****
                local p_value=${1:-$'\0'};  # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : New value to assign to the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable.

                #**** Code ****
                # If the current value AND the new value are the same.
                if [ "${p_value}" == "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" ]; then
                    # shellcheck disable=SC2059
                    BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE";

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" "${p_value}" >&2;

                    echo >&2; return 1;
                else
                    # shellcheck disable=SC2059
                    BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED";

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_1}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2; echo >&2;
                    echo "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_2}" >&2; echo >&2

                    echo "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_EXTRA_INFO}" >&2; echo >&2;

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_CURRENT_VAL}\n" "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" >&2;

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_NEW_VAL}\n" "${p_value}" >&2;

                    echo >&2; return 1;
                fi
            }

            # Processing the list of arguments for the "module" module.
            for module_args in "${module_array[@]}"; do

                ## ----------------------------------------------

                ## "DEBUG" AND "DEBUG_BASHX" STATUS VARIABLES

                # Creating a function to print the correct values for the current option in different languages structures.
                function BU.ModuleInit.ProcessFirstModuleParameters.ProcessBadStatusOptionValues()
                {
                    # shellcheck disable=SC2059
                    BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__PBSOV__MSG}" "${1}" "${2}")" >&2;
                    BU.ModuleInit.Msg >&2;
                }

                # Else, if the "module" parameter's value is a debug value : '--stat-debug=false', '--stat-debug=true'
                if [[ "${module_args,,}" == *'--stat-'* ]]; then
                    #**** Condition variables ****
					local value;    # VAR TYPE : String     - DESC :

                    #**** Condition code ****
                    case "${module_args,,}" in

                        # "${__BU_MODULE_INIT_STAT_DEBUG" global status variable.
                        '--stat-debug='*)
							value="${module_args#*=}";
							value="${value% *}";

                            if      [ "${value,,}" == 'false' ]                                  || [ "${value,,}" == 'true' ]; then
                                    __BU_MODULE_INIT_STAT_DEBUG="${value}";                     BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_STAT_DEBUG' "${__BU_MODULE_INIT_STAT_DEBUG}" 'bool' "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VALS_CHECK_LOOP__STAT__DEBUG__ARG_HAS_AWAITED_VAL}" "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";
                            else
                                BU.ModuleInit.ProcessFirstModuleParameters.ProcessBadStatusOptionValues "--stat-debug" "\n    --stat-debug=false\n    --stat-debug=true" || { v_loop_error='error'; break; };
                            fi
                        ;;

                        # "${__BU_MODULE_INIT_STAT_DEBUG_BASHX" global status variable.
                        '--stat-debug-bashx='*)
							value="${module_args#*=}";
							value="${value% *}";

                            if BU.ModuleInit.CheckIsDebugging; then
                                if      [[ "${value,,}" == c?(at?(eg?(ory))) ]] \
									||  [[ "${value,,}" == c?(at?(eg?(orie)))?(s) ]] \
									||  [[ "${value,,}" == fi?(l?(e))?(s) ]] \
									||  [[ "${value^^}" == FN?(C?(T))?(S) ]] \
									||  [[ "${value,,}" == fun?(c?(t?(ion))?(s)) ]] \
									||  [[ "${value,,}" == m?(od?(ule))?(s) ]] \
									||  [[ "${value,,}" == s?(ub)?(-)c?(at?(eg?(ory))) ]] \
									||  [[ "${value,,}" == s?(ub)?(-)?(c?(at?(eg?(orie)))?(s)) ]]; then

                                    __BU_MODULE_INIT_STAT_DEBUG_BASHX="${value}";               BU.ModuleInit.DisplayInitGlobalVarsInfos  '__BU_MODULE_INIT_STAT_DEBUG_BASHX' "${__BU_MODULE_INIT_STAT_DEBUG_BASHX}" 'String' "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VALS_CHECK_LOOP__STAT__DEBUG_BASHX__ARG_HAS_AWAITED_VAL}"            "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                                elif    [ "${value,,}" == 'void' ]; then
                                    __BU_MODULE_INIT_STAT_DEBUG_BASHX='';                       BU.ModuleInit.DisplayInitGlobalVarsInfos  '__BU_MODULE_INIT_STAT_DEBUG_BASHX' "${__BU_MODULE_INIT_STAT_DEBUG_BASHX}" 'String' "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VALS_CHECK_LOOP__STAT__DEBUG_BASHX__ARG_HAS_AWAITED_VAL__VOID}"      "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                                else
                                    BU.ModuleInit.ProcessFirstModuleParameters.ProcessBadStatusOptionValues "--stat-debug-bashx" "\n    --stat-debug-bashx=category\n    --stat-debug-bashx=file\n    --stat-debug-bashx=function\n    --stat-debug-bashx=module\n    --stat-debug-bashx=sub-category" || { v_loop_error='error'; break; };
                                fi
                            else
                                BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VALS_CHECK_LOOP__STAT__DEBUG_BASHX__STAT_DEBUG_ARG_NOT_TRUE}";
                                BU.ModuleInit.Msg;
                            fi
                        ;;

                        *)
                            #**** Error management variables ****
                            declare -i lineno="$(( LINENO - 1 ))";  # VAR TYPE : Int    - DESC :

                            #**** Error management code ****
                            value="${module_args#* }";
                            value="${value% *}";

                            # shellcheck disable=SC2059
                            printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VALS_CHECK_LOOP__STAT__STAT_IS_NOT_SUPPORTED}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${lineno}" "${value}" >&2;
                            echo >&2;

                            return 1;
                        ;;
                    esac

                ## ----------------------------------------------

                ## MODULE : LOG MESSAGES PROCESSING

                # Else, if the "module" parameter's value is a log redirection parameter : '--log-display', '--log-shut' or '--log-shut-display'.

				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                elif [[ "${module_args,,}" == *'--log-'* ]]; then

					case "${module_args,,}" in

						# Log values :
						# --log-display (printing the initialization messages on the screen while they are appened to the "${__BU_MODULE_INIT_MSG_ARRAY[@]}" array).
						# --log-no-display (do not display the initialization messages on the screen, but log them in the "${__BU_MODULE_INIT_MSG_ARRAY[@}}" array).
						'--log-display' | '--log-no-display')
							# Handling the incompatibility with each other '--log-display', '--log-no-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							if [ -n "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" ]; then
								BU.ModuleInit.ProcessFirstModuleParameters.LogPermissionWarningOptimize "${module_args}";
							fi

                            # By default, the initialization process doesn't prints the log messages, unless there's an error (this printing cannot be avoided).
                            # To print the initialization logs on the screen, you have to pass the '--log-display' argument when you pass the "module" value as first argument
                            __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="${module_args}";
                            echo "INDEX LIST : ${#__BU_MODULE_INIT_MSG_ARRAY[*]}";
                        ;;

						# Log value : --log-shut (don't print the initialization messages on the screen, nor append them into the "${__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-shut')
                            # Handling the incompatibility with each other '--log-display', '--log-no-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							if [ -n "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" ]; then
                                BU.ModuleInit.ProcessFirstModuleParameters.LogPermissionWarningOptimize "${module_args}";
                            fi

                            # If this argument is passed, no initialization messages will be logged in the "${__BU_MODULE_INIT_MSG_ARRAY}" variable,
                            # the existing logged messages will be erased, and no initialization messages will be displayed, unless it's an error message.
                            __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="${module_args}";

                            # Erasing the content of the "${__BU_MODULE_INIT_MSG_ARRAY" variable, since it's no more useful.
                            unset __BU_MODULE_INIT_MSG_ARRAY;
                        ;;

						# Log value : --log-shut-display (print the initialization messages on the screen without appening them into the "${__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-shut-display')
							# Handling the incompatibility with each other '--log-display', '--log-no-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							if [ -n "${__BU_MODULE_INIT_MSG_ARRAY_PERMISSION}" ]; then
                                BU.ModuleInit.ProcessFirstModuleParameters.LogPermissionWarningOptimize "${module_args}";
							fi

                            # If this argument is passed, no initialization messages will be logged in the "${__BU_MODULE_INIT_MSG_ARRAY}" variable,
                            # but all the log messages will be displayed on the screen.
                            __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="${module_args}";
                        ;;

						# An unsupported log argument is passed.
						*)
                            #**** Error management variables ****
                            declare -i lineno="$(( LINENO - 1 ))"   # VAR TYPE : Int    - DESC :

                            local v_unsupported_log_param;          # VAR TYPE : String | DESC :

                            #**** Error management code ****
                            v_unsupported_log_param="$(printf "%s" "${module_args}" | sed "s/^[^ ]* //")";

                            # shellcheck disable=SC2059
							BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL";

							# shellcheck disable=SC2059
							printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "${v_unsupported_log_param}" >&2; echo >&2;

							# shellcheck disable=SC2059
							printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__ADVICE}\n" "${p_count}" >&2;

							BU.ModuleInit.ProcessFirstModuleParameters.Usage;

							BU.ModuleInit.MsgAbort;

							BU.ModuleInit.AskPrintLog >&2 || { v_loop_error='error'; break; }

							v_loop_error='error'; break;
                        ;;
					esac

                ## ----------------------------------------------

                ## MODULE : MODES PROCESSING

				# Else, if the "module" parameter's value is a logging option : "--mode-log-full" or "--mode-log-partial".

				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                elif [[ "${module_args,,}" == '--mode-'* ]]; then

					case "${module_args,,}" in

						# Setting the "${__BU_MODULE_INIT_MSG_ARRAY_MODE" global variable to '--mode-log-full', in order to print every initialization messages, and not only the essential initialization messages.
						'--mode-log-full')
							__BU_MODULE_INIT_MSG_ARRAY_MODE="${module_args}";

							# Displaying the initialization messages already appened in the "${__BU_MODULE_INIT_MSG_ARRAY" global variable.
							BU.ModuleInit.DisplayInitGlobalVarsInfos__DisplayInitializedGlobalVarsInfos

                            # Declaring a global variable which stores the information that this logging option's value
                            # was modified / passed as argument while calling the "module" value in the project's main file.
                            __BU_MODULE_INIT_MSG_ARRAY_MODE__IS_ARG='true';;

						# Setting the "${__BU_MODULE_INIT_MSG_ARRAY_MODE" global variable to '--mode-log-partial', in order to print the essential initialization messages only (already set by default).
						'--mode-log-partial')
							__BU_MODULE_INIT_MSG_ARRAY_MODE="${module_args}";

                            # Unsetting every unsused string variables in order to free up some memory.

                            # shellcheck disable=SC2046
                            unset $(compgen -v "__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__");

                            # Declaring a global variable which stores the information that this logging option's value
                            # was modified / passed as argument while calling the "module" value in the project's main file.
                            __BU_MODULE_INIT_MSG_ARRAY_MODE__IS_ARG='true';
                        ;;

						# An unsupported mode argument is passed.
						*)
                            #**** Error management variables ****
                            declare -i lineno="$(( LINENO - 1 ))";  # VAR TYPE : Int    - DESC :

                            local v_unsupported_log_param;          # VAR TYPE : String | DESC :

                            #**** Error management code ****
                            v_unsupported_log_param="$(printf "%s" "${module_args}" | sed "s/^[^ ]* //")";

                            # shellcheck disable=SC2059
							BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL";

							# shellcheck disable=SC2059
							printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}" "${v_unsupported_log_param}" >&2; echo >&2;

							# shellcheck disable=SC2059
							printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__ADVICE}\n" "${p_count}" >&2;

							BU.ModuleInit.ProcessFirstModuleParameters.Usage;

							BU.ModuleInit.MsgAbort;

							BU.ModuleInit.AskPrintLog >&2 || { v_loop_error='error'; break; }

							v_loop_error='error'; break;
                        ;;
					esac

                ## ----------------------------------------------

                ## MODULE : ALIASES FILES INCLUSION

                elif [[ "${module_args,,}" == --include-aliases=* ]]; then
                    __BU_MODULES_INIT_INCLUDE_ALIASES='--include-aliases';

                    # Getting the modules list.
                    value="${module_args#*=}";
					value="${value% *}";

                    # Looping through the modules list.
                    echo "LISTE : $value";

                ## ----------------------------------------------

                ## MODULE : HANDLING UNSUPPORTED ARGUMENTS

                # Else, if the "module" value's argument is not a supported one.
                else
                    #**** Error management variables ****
                    declare -i lineno="$(( LINENO - 1 ))";  # VAR TYPE : Int    - DESC

                    local v_unsupported_log_param;          # VAR TYPE : String | DESC

                    #**** Error management code ****
                    v_unsupported_log_param="$(printf "%s" "${module_args}" | sed "s/^[^ ]* //")";

                    # shellcheck disable=SC2059
                    BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__MODULE_GEN_OPT_UNSUPPORTED_VAL";

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}" "${v_unsupported_log_param}" >&2; echo >&2;

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__ADVICE}\n" "${p_count}" >&2;

                    BU.ModuleInit.ProcessFirstModuleParameters.Usage;

                    BU.ModuleInit.MsgAbort;

                    BU.ModuleInit.AskPrintLog >&2 || { v_loop_error='error'; break; };

                    v_loop_error='error'; break;
                fi
            done; if [ "${v_loop_error,,}" == 'error' ]; then if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi; fi

            # Sourcing the "Status.conf" file, and then modifying the sourced global status variables values.
            if ! BU.ModuleInit.IsFrameworkCompiled && ! source "${__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS}"; then echo >&2;
                # shellcheck disable=SC2059
                printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE__SOURCE_STATUS_CONF_FILE__ERROR}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 2 ))"; echo >&2; return 1;
            else
                # shellcheck disable=SC2059
                BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE__SOURCE_STATUS_CONF_FILE__SUCCESS}" "${__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS}")";
                BU.ModuleInit.Msg;
            fi

            # Creating a global variable to store a value which proves that the 'module --*' value was passed as first argument, for the condition which checks if the 'main' module is passed as second argument.
            __BU_MODULE_INIT_MODULE_FIRST_ARG='true';

        fi

    ## ----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE AND THE 'main' MODULE PASSING

    # Else, if the "main" module is passed as second argument, after the "module" value.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "${p_count}" -eq 1 ] && [ -n "${__BU_MODULE_INIT_MODULE_FIRST_ARG}" ] && [[ "${p_module,,}" == 'main' ]] || [[ "${p_module}" == [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then

        __BU_MODULE_INIT_IS_MAIN_MODULE_INITIALIZED='true';

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;

    ## ----------------------------------------------

    ## 'module' VALUE NOT PASSED, BUT 'main' MODULE PASSED AS FIRST ARGUMENT

    # Else, if the "module --*" value is not passed as first argument.

    # Checking if the "main" module is passed as first argument, in order to avoid unexpected bugs during the other modules' initialization process.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "${p_count}" -eq 0 ] && [[ "${p_module,,}" == 'main' ]] || [[ "${p_module}" == [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then

        __BU_MODULE_INIT_IS_MAIN_MODULE_INITIALIZED='true';

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;

    ## ----------------------------------------------

    ## MISSING 'main' MODULE AFTER THE 'module' VALUE

    # Else, if the the "module --" value is passed as first argument, but the "main" module is missing.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "${p_count}" -ge 1 ] && [[ ( -n "${__BU_MODULE_INIT_MODULE_FIRST_ARG}" ) && ( -z "${__BU_MODULE_INIT_IS_MAIN_MODULE_INITIALIZED}" ) ]] && [[ ("${p_module,,}" != 'main') || ( "${p_module}" != [Mm][Aa][Ii][Nn][[:space:]]--* ) ]]; then
        # shellcheck disable=SC2059
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING";

        # shellcheck disable=SC2059
        printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2; echo >&2;

        # shellcheck disable=SC2059
        printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__ADVICE}\n" "${v_module_name}" "${FUNCNAME[0]}" >&2;

        BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi

        return 1;

	## ----------------------------------------------

    ## 'Main' MODULE PASSED AS FIRST ARGUMENT, BUT BEFORE THE 'module' VALUE

	# Else, if the "main" module is passed as first argument, BUT before the "module --*" value.

	elif [ "${p_count}" -ge 1 ] && [ -n "${__BU_MODULE_INIT_IS_MAIN_MODULE_INITIALIZED}" ] && [[ "${p_module,,}" == "module --"* ]]; then
        # shellcheck disable=SC2059
		BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE";

		# shellcheck disable=SC2059
		printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
		echo >&2; echo "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__ADVICE}" >&2;

        BU.ModuleInit.MsgAbort;

        BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi

    ## ----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE OR THE 'main' MODULE PASSING

    # Else, if the count is superior to 0 or 1, then the function'e execution is stopped.
    elif [ "${p_count}" -ge 1 ]; then

        return 0;

    ## ----------------------------------------------

    ## NO 'module' AND 'main' PASSED AS FIRST, THEN AS SECOND ARGUMENTS

    else
        # shellcheck disable=SC2059
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__PROCESS_FIRST_MODULE_PARAMETERS__MODULE_AND_MAIN_PARAMS_MISSING";

        # shellcheck disable=SC2059
        printf "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING}\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
        echo >&2; echo "${__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__ADVICE}" >&2;

        BU.ModuleInit.MsgAbort;

        echo >&2; BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
    fi

    return 0;
})

# ·················································································································
# Initializing every modules from the "BashUtils_InitModules()" function or any other modules initializer function.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Decho.Decho.Highlight()               -> Main -> Decho.lib

#   - BU.Main.Headers.Header.Green()                -> Main -> Headers.lib

#   - BU.ModuleInit.DisplayInitGlobalVarsInfos()    -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()                          -> Modules initializer script (this file)
#   - BU.ModuleInit.FindPath()                      -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkCompiled()           -> Modules initializer script (this file)
#   - BU.ModuleInit.ListInstalledModules()          -> Modules initializer script (this file)
#   - BU.ModuleInit.Msg()                           -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgAbort()                      -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgLine()                       -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintLogError()                 -> Modules initializer script (this file)
#   - BU.ModuleInit.ProcessFirstModuleParameters()  -> Modules initializer script (this file)
#   - BU.ModuleInit.SourcingFailure()               -> Modules initializer script (this file)

# shellcheck disable=SC1090
function BashUtils_InitModules._()
{
    #**** Parameters ****
    local p_modules_list=("${@}");

    #**** Variables ****
    local v_index=0;    # Index of the currently processed module (incremented at each loop's iteration). ALWAYS BEGIN WITH THE '0' VALUE !!!
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

    #**** Code ****
    # Checking if any wanted module exists with its configuration and its library, then source every related shell files.
    for module in "${p_modules_list[@]}"; do

        ## ----------------------------------------------

        ## INITIALIZER'S FIRST ARGUMENTS PROCESSING ("module --*" AND "main --*" VALUES)

        # Calling the function which processes the « module » argument and its parameters, along with the « main » module.
        if [ "${FUNCNAME[1]}" == 'BashUtils_InitModules' ]; then
            BU.ModuleInit.ProcessFirstModuleParameters "${module}" "${v_index}" || { v_loop_error='error'; break; }
        fi

        ## ----------------------------------------------

        ## DEFINING LOCAL VARIABLES FOR EACH MODULE TO BE INITIALIZED

        # Defining variables for each iteration.
        local v_module_name;

        v_module_name="$(echo "${module}" | cut -d' ' -f1)";

        ## ----------------------------------------------

        ## DEFINING GLOBAL VARIABLES FOR EACH MODULE TO BE INITIALIZED

        __BU_MODULE_INIT_MODULE_NAME="${v_module_name}";

        # Getting the current module's configurations directory AND its initialization directory (the "module --"* value is NOT a module).
        if [[ "${module}" != 'module --'* ]]; then

            # Getting the current module's configurations directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}" "${v_module_name}" 'd' || {
                BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

                if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
            })";

            # shellcheck disable=SC2059
            BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH' "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" 'Dirpath' \
                "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__CONF_PATH__DIGVI}" "${v_module_name}" "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}")" \
                "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$(( LINENO - 2 ))";


            # Getting the current module's initialization directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__MODULES_DIR}" "${v_module_name}" 'd' || {
                BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

                if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
            })";

            # shellcheck disable=SC2059
            BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH' "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" 'Dirpath' \
                "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INIT_PATH__DIGVI}" "${v_module_name}" "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}")" \
                "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$(( LINENO - 2 ))";
        fi

        # Storing the module's name with it's arguments, in order to transform it in an array of strings to be processed in this loop (for each module, in their "initializer.sh" file).
        if [[ "${p_modules_list[i]}" == "${v_module_name} --"* ]]; then

            # shellcheck disable=SC2034
            __BU_MODULE_INIT_MODULE_AND_ARGS_STRING="${module}";

            # shellcheck disable=SC2059
            BU.ModuleInit.DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_MODULE_AND_ARGS_STRING' "${__BU_MODULE_INIT_MODULE_AND_ARGS_STRING}" 'String' \
                "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__NAME_WITH_ARGS}" "${FUNCNAME[0]}" "${#p_modules_list}" "${module}")" \
                "${__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__IS_VAR_DEF_IN_INITIALIZER__MAIN_FILE}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$(( LINENO - 2 ))";
        fi

        # Checking for each module's files if the currently processed "BashUtils_InitModules" argument is not "module" (already processed in the "BU.ModuleInit.ProcessFirstModuleParameters()" function).
        if [[ "${module}" != 'module --'* ]]; then

            ## ----------------------------------------------

            # MODULES' CONFIGURATION FILES SOURCING

            # Checking if the module's configuration directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}"; then local lineno="${LINENO}";
                # shellcheck disable=SC2059
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__INITMODULE__MODULE_CONFIG_DIR_NOT_FOUND";

                printf '\n' >&2;

                # shellcheck disable=SC2059
                printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND}\n\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}" "${v_module_name}" >&2;

                # shellcheck disable=SC2059
                printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__ADVICE}" >&2; BU.ModuleInit.CheckPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" 'f' >&2;
                printf '\n\n';

                # Listing all the installed modules in the user's hard drive.
                # No need to call the function "BU.ModuleInit.AskPrintLog" function, it's already called in the function "BU.ModuleInit.ListInstalledModules".
                BU.ModuleInit.ListInstalledModules || { v_loop_error="error"; break; }

                v_loop_error="error"; break;
            else
                # ---------------------------------------------------------------------------------------------------------------
                # OPTIONAL : SOURCING THE ALIASES CONFIGURATION FILE IN ORDER TO LET THE DEVELOPER WRITING SHORTER FUNCTION NAMES

                # If the '--no-aliases-include' option was not passed to the modules initializer.
                if [ -n "${__BU_MODULES_INIT_INCLUDE_ALIASES}" ]; then
                    BU.ModuleInit.Msg;

                    # Assigning the files names to the "${__BU_MODULE_INIT__MODULES_DIR__(OS_)ALIASES_CONF__NAMES}" global variables.
                    __BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__NAMES+=("Aliases.conf" "Aliases.${v_module_name}.conf" "${v_module_name}.Aliases.conf");

                    __BU_MODULE_INIT__MODULES_DIR__ALIASES_OS_CONF__NAMES+=(    "${}.Aliases.${v_module_name}" "Aliases.${v_module_name}.${}.conf" \
                                                                                    "${}.${v_module_name}.Aliases.conf" "Aliases.${}.${v_module_name}.conf");

                    # Getting the aliases file's path with a "for" loop.
                    for aliasesFilename in "${va_aliasesFileNames[@]}"; do

                        # Setting a value to the "${__BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PATH}" variable.
                        if BU.ModuleInit.FindPath "${__BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PARENT}" "${aliasesFilename}" 'f' 'shut' 'modaliasfile'; then
                            __BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PATH="${__BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PARENT}/${aliasesFilename}";
                        fi

                        # Setting a value to the "${__BU_MODULE_INIT__MODULES_DIR__OS_ALIASES_CONF__PATH}" variable.
                        if BU.ModuleInit.FindPath "${__BU_MODULE_INIT__MODULES_DIR__OS_ALIASES_CONF__PARENT}" "${aliasesFilename}" 'f' 'shut' 'osmodaliasfile'; then
                            __BU_MODULE_INIT__MODULES_DIR__OS_ALIASES_CONF__PATH="${__BU_MODULE_INIT__MODULES_DIR__OS_ALIASES_CONF__PARENT}/${aliasesFilename}";
                        fi
                    done

                    # Thanks to the "BU.ModuleInit.FindPath()" function, the file names are case-insensitive.
                    if [ -n "${__BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PATH}" ]    && [ -f "${__BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PATH}" ]; then

                            local v_module_aliases_file_name;

                            v_module_aliases_file_name="$(basename "$(cat "${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.modaliasfile.tmp")")";
                    fi

                    if [ -n "${__BU_MODULE_INIT__MODULES_DIR__OS_ALIASES_CONF__PATH}" ] && [ -f "${__BU_MODULE_INIT__MODULES_DIR__OS_ALIASES_CONF__PATH}" ]; then

                            local v_module_os_aliases_file_name;

                            v_module_os_aliases_file_name="$(basename "$(cat "${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.osmodaliasfile.tmp")")";
                    fi

                    if [ -n "${v_module_aliases_file_name}" ]; then
                        BU.ModuleInit.IsFrameworkCompiled || {
                            # If the aliases file is empty.
                            if [ ! -s "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_aliases_file_name}" 'f')" ]; then false > /dev/null; fi

                            source "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_aliases_file_name}" 'f')" || {
                                BU.ModuleInit.SourcingFailure "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}/${v_module_aliases_file_name}" "${v_module_name}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                                v_loop_error="error";

                                break;
                            }
                        }
                    fi

                    if [ -n "${v_module_os_aliases_file_name}" ]; then
                        BU.ModuleInit.IsFrameworkCompiled || {
                            # If the aliases file is empty.
                            if [ ! -s "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_os_aliases_file_name}" 'f')" ]; then false > /dev/null; fi

                            source "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_os_aliases_file_name}" 'f')" || {
                                BU.ModuleInit.SourcingFailure "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}/${v_module_os_aliases_file_name}" "${v_module_name}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                                v_loop_error="error";

                                break;
                            }
                        }
                    fi

                    unset v_module_aliases_file_name;
                    unset v_module_os_aliases_file_name;
                fi

                # ----------------------------------------------------
                # MANDATORY : SOURCING THE MODULE'S CONFIGURATION FILE

                # shellcheck disable=SC2059
                BU.ModuleInit.MsgLine "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__SOURCE_MSG}" "${v_module_name}")" '#' 'msg'; BU.ModuleInit.Msg;

                # Thanks to the "BU.ModuleInit.FindPath()" function, the file names are case-insensitive.
                if  [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "Module.${v_module_name}.conf" 'f' 'shut' 'modconffile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_name}.Module.conf" 'f' 'shut' 'modconffile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "Module.${v_module_name}.Module.conf" 'f' 'shut' 'modconffile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_name}.Module.${v_module_name}.conf" 'f' 'shut' 'modconffile')" ]] \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "module.conf" 'f' 'shut' 'modconffile')" ]]; then

                        local v_module_config_file_name;

                        v_module_config_file_name="$(basename "$(cat "${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.modconffile.tmp")")";
                else
                    BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "$(( LINENO - 2 ))" "E_BUINIT__INITMODULE__MODULE_CONFIG_FILE_NOT_FOUND";

                    # shellcheck disable=SC2059
                    printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__MODULE_CONF_FILE_NOT_FOUND}" "${v_module_name}" "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}";

                    BU.ModuleInit.MsgAbort;

                    BU.ModuleInit.AskPrintLog >&2 || { v_loop_error="error"; break; }

                    v_loop_error="error"; break;
                fi

                BU.ModuleInit.IsFrameworkCompiled || {
                    # If the module's configuration file is empty, then the initialization stops.
                    if [ ! -s "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_config_file_name}" 'f')" ]; then

                        # shellcheck disable=SC2059
                        BU.ModuleInit.PrintLogError "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__MODULE_CONF_FILE_IS_EMPTY}" "${v_module_name}" "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_config_file_name}")" "$(basename "${BASH_SOURCE[0]}")" "$(( LINENO - 1 ))" "E_BUINIT__INITMODULE__MODULE_CONFIG_FILE_IS_EMPTY";

                        BU.ModuleInit.SourcingFailure "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}/${v_module_config_file_name}" "${v_module_name}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                        BU.ModuleInit.MsgAbort;

                        BU.ModuleInit.AskPrintLog >&2 || { v_loop_error="error"; break; }

                        v_loop_error='error';

                        break;
                    fi

                    source "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}" "${v_module_config_file_name}" 'f')" || {
                        BU.ModuleInit.SourcingFailure "${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}/${v_module_config_file_name}" "${v_module_name}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}"; v_loop_error="error"; break;
                    }
                }

                unset v_module_config_file_name;
            fi

            # -----------------------------------------------

            # MODULES' INITIALIZATION FILES SOURCING

            # Checking if the module's initialization directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}"; then local lineno="${LINENO}";
                # shellcheck disable=SC2059
                BU.ModuleInit.PrintLogError "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__CALL_PLE}" "${v_module_name}")" "$(basename "${BASH_SOURCE[0]}")" "${lineno}" "E_BUINIT__INITMODULE__MODULE_INIT_DIR_NOT_FOUND";

                printf '\n' >&2;

                # shellcheck disable=SC2059
                printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND}\n\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}" "${v_module_name}" >&2;

                # shellcheck disable=SC2059
                printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__ADVICE}"; BU.ModuleInit.CheckPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" 'f' >&2;
                printf '\n\n' >&2;

                BU.ModuleInit.MsgAbort;

                v_loop_error="error"; break;
            else
                # shellcheck disable=SC2059
                BU.ModuleInit.MsgLine "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__SOURCE}" "${v_module_name}")" '-' 'msg';

                ## ----------------------------------------------------
                # MANDATORY : SOURCING THE MODULE'S INITIALIZATION FILE

                # Thanks to the "BU.ModuleInit.FindPath()" function, the file names are case-insensitive.
                if  [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Initializer.${v_module_name}.sh" 'f' 'shut' 'modinitfile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${v_module_name}.Initializer.sh" 'f' 'shut' 'modinitfile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Initializer.${v_module_name}.Initializer.sh" 'f' 'shut' 'modinitfile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${v_module_name}.Initializer.${v_module_name}.sh" 'f' 'shut' 'modinitfile')" ]] || \

                    [[ -f "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Initializer.sh" 'f' 'shut' 'modinitfile')" ]]; then
                        local v_module_init_file_name;

                        v_module_init_file_name="$(basename "$(cat "${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.modinitfile.tmp")")";
                else
                    # shellcheck disable=SC2059
                    BU.ModuleInit.PrintLogError "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__MODULE_INIT_FILE_NOT_FOUND}" "${v_module_name}" "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}")" "$(basename "${BASH_SOURCE[0]}")" "$(( LINENO - 1 ))" "E_BUINIT__INITMODULE__MODULE_INIT_FILE_NOT_FOUND";

                    BU.ModuleInit.MsgAbort;

                    BU.ModuleInit.AskPrintLog >&2 || { v_loop_error="error"; break; }

                    v_loop_error="error"; break;
                fi

                BU.ModuleInit.IsFrameworkCompiled || {
                    # If the module's initializer file is empty, then the initialization stops.
                    if [ ! -s "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${v_module_init_file_name}" 'f')" ]; then

                        # shellcheck disable=SC2059
                        BU.ModuleInit.PrintLogError "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__MODULE_INIT_FILE_IS_EMPTY}" "${v_module_name}" "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${v_module_init_file_name}")" "$(basename "${BASH_SOURCE[0]}")" "$(( LINENO - 1 ))" "E_BUINIT__INITMODULE__MODULE_INIT_FILE_IS_EMPTY";

                        BU.ModuleInit.SourcingFailure "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}/${v_module_init_file_name}" "${v_module_name}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                        BU.ModuleInit.MsgAbort;

                        BU.ModuleInit.AskPrintLog >&2 || { v_loop_error="error"; break; }

                        v_loop_error='error';

                        break;
                    fi

                    source "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${v_module_init_file_name}" 'f')" || {
                        BU.ModuleInit.SourcingFailure "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}/${v_module_init_file_name}" "${v_module_name}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}"; v_loop_error="error"; break;
                    }
                }

                unset v_module_init_file_name;

                # shellcheck disable=SC2059
                BU.Main.Headers.Header.Green "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__END_OF_MODULE_INIT}" "$(BU.Main.Decho.Decho.Highlight "${v_module_name}")")";
            fi
        fi

        # Incrementing the modules array index variable.
        v_index="$(( v_index + 1 ))";

    done; if [ "${v_loop_error,,}" == 'error' ]; then BU.ModuleInit.IsInScript && BU.ModuleInit.Exit 1; return 1; fi
}

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BEGIN INITIALIZATION PROCESS

## CHECKING IF THE CURRENT SHELL IS BASH

# shellcheck disable=SC2009
if ! ps -a | grep -E "${$}" | grep "bash" > /dev/null; then
    [ "$(echo "${LANG}" | cut -d _ -f1)" == 'de' ] && echo "BASH-UTILS ERROR : Ihr aktueller Shell-Interpreter ist nicht der « Bash » Interpreter, sondern der « ${SHELL##*/} » Interpreter" >&2 && echo >&2;
    [ "$(echo "${LANG}" | cut -d _ -f1)" == 'en' ] && echo "BASH-UTILS ERROR : Your current shell interpreter is not the « Bash » interpretor, but the « ${SHELL##*/} » interpretor" >&2 && echo >&2;
    [ "$(echo "${LANG}" | cut -d _ -f1)" == 'es' ] && echo "ERROR BASH-UTILS : Su intérprete de shell actual no es el intérprete « Bash », sino el intérprete « ${SHELL##*/} »" && echo >&2;

    [ "$(echo "${LANG}" | cut -d _ -f1)" == 'fr' ] && echo "ERREUR DE BASH-UTILS : Votre interpréteur shell actuel n'est pas l'interpréteur « Bash », mais l'interpréteur « ${SHELL##*/} »" >&2 && echo >&2;
    [ "$(echo "${LANG}" | cut -d _ -f1)" == 'pt' ] && echo "BASH-UTILS ERRO : O seu intérprete shell actual não é o intérprete « Bash », mas o intérprete « ${SHELL##*/} »" >&2 && echo >&2;
    [ "$(echo "${LANG}" | cut -d _ -f1)" == 'ru' ] && echo "ОШИБКА « BASH-UTILS » : Ваш текущий интерпретатор оболочки - это не интерпретатор « Bash », а интерпретатор « ${SHELL##*/} »" >&2 && echo >&2;

	# WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY" array.
    BU.ModuleInit.IsInScript && exit 1; return 1;
fi

## ----------------------------------------------

## CHECKING THE CURRENT VERSION OF THE LANGUAGE

# Checking the version of the Bash language currently used on the user's system.
BU.ModuleInit.CheckBashMinimalVersion || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

## ----------------------------------------------

## CALLING THE TRAPS RESOURCES

BU.ModuleInit.DefineTraps;

## ----------------------------------------------

## DEFINING GLOBAL VARIABLES

# ··························································································································································
# Defining a function in order to suppress every shellcheck advices about the "printf" command, in order to do so at once AND to keep the code's decoration.

# Note : the purpose of this function is to hide its long code in any code editor, in order to make the navigation easier into this file.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.FindPath()                              -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkBeingInstalled()             -> Modules initializer script (this file)
#   - BU.ModuleInit.IsFrameworkCompiled()                   -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()                            -> Modules initializer script (this file)
#   - BU.ModuleInit.PrintErrorMissingBashUtilsHomeFolder()  -> Modules initializer script (this file)

# shellcheck disable=SC2059,SC2016
function BU.ModuleInit.DefineBashUtilsGlobalVariablesBeforeInitializingTheModules()
{
    #**** Code ****

    # PID
    __BU_MODULE_INIT__PROJECT_PID="${$}";
    __bu_module_init__project_pid__lineno="$(( LINENO - 1 ))";

    # -------------------------------------------

    # FINDING THE ".Bash-utils" FOLDER'S PARENT DIRECTORY

    __BU_MODULE_INIT__ROOT_HOME="${HOME}";
    __bu_module_init__root_home__lineno="$(( LINENO - 1 ))";

    # -------------------------------------------

    # STORING THE NAME OF THE FRAMEWORK'S TEMPORARY DIRECTORY

    __BU_MODULE_INIT__TMP_DIR_NAME="tmp";
    __bu_module_init__tmp_dir_name__lineno="$(( LINENO - 1 ))";

    # -------------------------------------------

    ## FINDING THE ".Bash-utils" FOLDER

    # If the framework base is not being installed on the user's hard drive.
    if ! BU.ModuleInit.IsFrameworkBeingInstalled; then
        # If the ".Bash-utils" folder exists in its defined parent directory,
        # then the ".Bash-utils" default parent folder is defined as the user's home directory.
        if [ -d "${__BU_MODULE_INIT__ROOT_HOME}/.Bash-utils" ]; then
            __bu_module_init__root__lineno="$(( LINENO + 2 ))";

            __BU_MODULE_INIT__ROOT="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT_HOME}" ".Bash-utils" 'd' || {
                printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
                    "$(basename "${BASH_SOURCE[0]}")" "${__bu_module_init__root__lineno}" '$__BU_MODULE_INIT__ROOT';

                BU.ModuleInit.IsInScript && exit 1; return 1;
            })";

            # If the base code of the framework is not compiled in a single file.
            if ! BU.ModuleInit.IsFrameworkCompiled; then
                # shellcheck disable=SC2034
                __bu_module_init__initializer_path__lineno="$(( LINENO + 2 ))";

                __BU_MODULE_INIT__INITIALIZER_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT_HOME}" "$(basename "${BASH_SOURCE[0]}")" 'f' || {
                    printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" "$(basename "${BASH_SOURCE[0]}")" \
                        "${__bu_module_init__initializer_path__lineno}" '$__BU_MODULE_INIT__INITIALIZER_PATH';

                    BU.ModuleInit.IsInScript && exit 1; return 1;
                })";
            fi
        # Else, if the ".Bash-utils" folder does not exists in its defined parent directory.
        else
            BU.ModuleInit.PrintErrorMissingBashUtilsHomeFolder "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$(( LINENO - 1 ))";

            # WARNING : Do not call the "BU.ModuleInit.AskPrintLog()" function here, the current function is defined before the "${__BU_MODULE_INIT_MSG_ARRAY" array.
            BU.ModuleInit.IsInScript && exit 1; return 1;
        fi

    # Else, if the ".Bash-utils" folder doesn't exists in its defined parent directory AND the framework base is being installed on the user's hard drive,
    # then the ".Bash-utils" default parent folder is defined as the "/tmp" folder in the system root directory. This redefinition is important for the next path variables' values.
    else
        # Checking if the ".Bash-utils" folder exists in the user's home directory.
        if [ ! -d "${__BU_MODULE_INIT__ROOT_HOME}" ]; then
            # Redefining the "${__BU_MODULE_INIT__ROOT_HOME}" global variable.
            __BU_MODULE_INIT__ROOT_HOME='/tmp';
            __bu_module_init__root_home__lineno="$(( LINENO - 1 ))";

            # Creating the framework's temporary folder to store the temporary files generated by the initializer script.
            mkdir -p "${__BU_MODULE_INIT__ROOT_HOME}/.Bash-utils/${__BU_MODULE_INIT__TMP_DIR_NAME}" > /dev/null || {
                mkdir -p "${__BU_MODULE_INIT__ROOT_HOME}/.Bash-utils/${__BU_MODULE_INIT__TMP_DIR_NAME}" || {
                    echo "ERROR : PLEASE LAUNCH THIS SCRIPT WITH SUPER-USER PRIVILEGES, OR CHECK YOUR PERMISSIONS ON THE « ${__BU_MODULE_INIT__ROOT_HOME} » DIRECTORY";
                }

                __BU_MODULE_INIT__ROOT_HOME="${HOME}";
            }

            BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT_HOME}" ".Bash-utils" && {
                __bu_module_init__root__lineno="$(( LINENO + 2 ))";

                __BU_MODULE_INIT__ROOT="$(BU.ModuleInit.FindPath "/${__BU_MODULE_INIT__ROOT_HOME}/.Bash-utils" "${__BU_MODULE_INIT__TMP_DIR_NAME}" 'd' || {
                    printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
                        "$(basename "${BASH_SOURCE[0]}")" "${__bu_module_init__root__lineno}" '$__BU_MODULE_INIT__ROOT';

                    BU.ModuleInit.IsInScript && exit 1; return 1;
                })";
            };

        else
            BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT_HOME}" ".Bash-utils" && {
                __bu_module_init__root__lineno="$(( LINENO + 2 ))";

                __BU_MODULE_INIT__ROOT="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT_HOME}/.Bash-utils" "${__BU_MODULE_INIT__TMP_DIR_NAME}" 'd' || {
                    printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
                        "$(basename "${BASH_SOURCE[0]}")" "${__bu_module_init__root__lineno}" '$__BU_MODULE_INIT__ROOT';

                    BU.ModuleInit.IsInScript && exit 1; return 1;
                })";
            };
        fi
    fi

    # -------------------------------------------

    # TEMPORARY DIRECTORY

    if [ ! -d "${__BU_MODULE_INIT__ROOT}/${__BU_MODULE_INIT__TMP_DIR_NAME}" ]; then mkdir -p "${__BU_MODULE_INIT__ROOT}/${__BU_MODULE_INIT__TMP_DIR_NAME}"; fi

    __bu_module_init__tmp_dir_path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__TMP_DIR_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT}" "${__BU_MODULE_INIT__TMP_DIR_NAME}" 'd')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__TMP_DIR_PATH';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    # -------------------------------------------

    # CONFIGURATIONS DIRECTORIES

    # -----------------------------
    # Configurations directory path
    # -----------------------------

    __bu_module_init__config_dir_parent__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_DIR_PARENT="${__BU_MODULE_INIT__ROOT}";

    __bu_module_init__config_dir_name__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_DIR_NAME='config';

    __bu_module_init__config_dir_path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__CONFIG_DIR_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__CONFIG_DIR_PARENT}" "${__BU_MODULE_INIT__CONFIG_DIR_NAME}" 'd')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
        "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__CONFIG_DIR_PATH';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    # ------------------------------------------
    # Module's initializer script directory path
    # ------------------------------------------

    __bu_module_init__config_init_dir_parent__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_INIT_DIR_PARENT="${__BU_MODULE_INIT__CONFIG_DIR_PATH}";

    __bu_module_init__config_init_dir_name__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_INIT_DIR_NAME='initializer';

    __bu_module_init__config_init_dir_path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__CONFIG_INIT_DIR_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__CONFIG_INIT_DIR_PARENT}" "${__BU_MODULE_INIT__CONFIG_INIT_DIR_NAME}" 'd')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__CONFIG_INIT_DIR_PATH';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    # --------------------------------
    # Modules configurations directory
    # --------------------------------

    __bu_module_init__config_modules_dir_parent__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_MODULES_DIR_PARENT="${__BU_MODULE_INIT__CONFIG_DIR_PATH}";

    __bu_module_init__config_modules_dir_name__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_MODULES_DIR_NAME='modules';

    __bu_module_init__config_modules_dir_path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PARENT}" "${__BU_MODULE_INIT__CONFIG_MODULES_DIR_NAME}" 'd')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    ## -----------------------------------------------------------------------------------
    # Translation files for the initializer script + the main module config and init files
    ## -----------------------------------------------------------------------------------

    __bu_module_init__config_init_lang_dir_parent__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PARENT="${__BU_MODULE_INIT__CONFIG_INIT_DIR_PATH}";

    __bu_module_init__config_init_lang_dir_name__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_NAME='locale';

    __bu_module_init__config_init_lang_dir_path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PARENT}" "${__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_NAME}" 'd')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR_PATH';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    # -------------------------------------------

    # INITIALIZER SCRIPT'S CONFIGURATION FILES

    __bu_module_init__config_init_dir__status__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__CONFIG_INIT_DIR_PATH}" "Status.conf" 'f')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    # -------------------------------------------

    # MODULES DIRECTORIES

    __bu_module_init__modules_dir__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__MODULES_DIR="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__ROOT}" "modules" 'd')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__MODULES_DIR';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    # -------------------------------------------

    # MODULES FILES

    __bu_module_init__config_init_dir__aliases_conf__parent__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PARENT="${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}";

    # DO NOT FILL A VALUE TO THE "${__BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__NAMES/PATH}" GLOBAL VARIABLES HERE, IT WILL BE DONE IN THE "BashUtils_InitModules()" FUNCTION.
    __bu_module_init__config_init_dir__aliases_conf__name__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__NAMES=();

    __bu_module_init__config_init_dir__aliases_conf__path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__MODULES_DIR__ALIASES_CONF__PATH="";


    __bu_module_init__config_init_dir__aliases_conf__parent__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__MODULES_DIR__ALIASES_OS_CONF__PARENT="${__BU_MODULE_INIT__CONFIG_MODULES_DIR_PATH}";


    # DO NOT FILL A VALUE TO THE "${__BU_MODULE_INIT__MODULES_DIR__ALIASES_OS_CONF__NAMES/PATH}" GLOBAL VARIABLES HERE, IT WILL BE DONE IN THE "BashUtils_InitModules()" FUNCTION.
    __bu_module_init__config_init_dir__aliases_conf__name__lineno="$(( LINENO + 1 ))";
    __BU_MODULE_INIT__MODULES_DIR__ALIASES_OS_CONF__NAMES=();

    __bu_module_init__config_init_dir__aliases_conf__path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__MODULES_DIR__ALIASES_OS_CONF__PATH="";

    # -------------------------------------------

    # OTHER FILES

    # Creating a global variable for storing the instruction not to stop the script if the "${__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH}" is not found, since a super-user privileged version exists.
    __BU_MODULE_INIT__TMP_VAR__FIND_PATH_FUNC_NO_ERR='no-err';

    __BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME="Bash-utils-root-val.path";
    __bu_module_init__lib_root_dir__file_name__lineno="$(( LINENO - 1 ))";

    __BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR="${__BU_MODULE_INIT__ROOT}";
    __bu_module_init__lib_root_dir_file__parent_dir__lineno="$(( LINENO - 1 ))";

    # ----------------------------------------------
    # Path to the framework's library root directory
    # ----------------------------------------------

    __bu_module_init__lib_root_dir__file_path__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR}" "${__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME}" 'f')" || {
        printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
            "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__MODULES_DIR';

        BU.ModuleInit.IsInScript && exit 1; return 1;
    };

    unset __BU_MODULE_INIT__TMP_VAR__FIND_PATH_FUNC_NO_ERR;

    if [ -z "${__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH}" ]; then
        __BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME="Bash-utils-root-val-ROOT.path";
        __bu_module_init__lib_root_dir_root__file_name__lineno="$(( LINENO - 1 ))";

        __BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="${__BU_MODULE_INIT__ROOT}";
        __bu_module_init__lib_root_dir_root_file__parent_dir__lineno="$(( LINENO - 1 ))";

        __bu_module_init__lib_root_dir_root__file_path__lineno="$(( LINENO + 2 ))";

        __BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH="$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR}" "${__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME}" 'f')" || {
            printf "${__BU_MODULE_INIT_MSG__PRINT_MISSING_PATH_FOR_DEFINED_GLOBAL_VARIABLE__NO_FNCT}" \
                "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" '$__BU_MODULE_INIT__MODULES_DIR';

            BU.ModuleInit.IsInScript && exit 1; return 1;
        };
    fi

    # -------------------------------------------

    # MISC

    # Storing the "false" value in the variable whose purpose is to check via the "BU.ModuleInit.IsTranslated()"
    # function if the framework's main module is translated thanks to the CSV file parser.
    __BU_MODULE_INIT__BU_BASE_IS_TRANSLATED="false";
    __bu_module_init__bu_base_is_translated__lineno="$(( LINENO - 1 ))";

    __BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM=',';
    __bu_module_init__csv_translation_file__delim__lineno="$(( LINENO - 1 ))";

    __BU_MODULE_INIT__DATE_LOG="[ $(date +"%Y-%m-%d %H:%M:%S") ]";
    __bu_module_init__date_log__lineno="$(( LINENO - 1 ))";

    # If you want to use another language than your system's, please redefine the "${LANG}" environment variable before sourcing this initialization file.
    __BU_MODULE_INIT__USER_LANG="$(echo "${LANG}" | cut -d _ -f1)";
    __bu_module_init__user_lang__lineno="$(( LINENO - 1 ))";

    ## -------------------------------------------------------------------------------------
    # Array of allowed values for the "${__BU_MODULE_INIT_STAT_DEBUG_BASHX}" global variable
    ## -------------------------------------------------------------------------------------

    __bu_module_init__bashx_debug_vals_array__lineno="$(( LINENO + 2 ))";

    __BU_MODULE_INIT__BASHX_DEBUG_VALS_ARRAY=('C' 'cs' 'cat' 'cats' 'categ' 'categs' 'category' 'categorie' 'categories' \
                                              'fi' 'fil' 'fils' 'fis'  'file' 'files' \
                                              'FN' 'FNC' 'FNCS' 'FNS' 'FNCT' 'FNCTS' \
                                              'fun' 'funs' 'func' 'funcs' 'funct' 'functs' 'function' 'functions' \
                                              'M' 'ms' 'mod' 'mods' 'module' 'modules' \
                                              'S' 'ss' 'sub' 'subs' 'subc' 'subcs' 'subcat'  'subcats' 'subcateg'  'subcategs'  'subcategory'  'subcategorie'  'subcategories' \
                                              'sc' 'scs' 'scat' 'scats' 'scateg' 'scategs' 'scategory'  'scategorie' 'scategories' \
                                              's-'  's-s' 's-c' 's-cs' 's-cat' 's-cats' 's-categ' 's-categs' 's-category' 's-categorie' 's-categories' \
                                              'sub-' 'sub-s' 'sub-c' 'sub-cs' 'sub-cat' 'sub-cats' 'sub-categ' 'sub-categs' 'sub-category' 'sub-categorie' 'sub-categories');
    return 0;
}

# Calling the function previously defined, or else the global variables will not be declared.
BU.ModuleInit.DefineBashUtilsGlobalVariablesBeforeInitializingTheModules;

## ----------------------------------------------

## CALLING THE NEEDED FUNCTIONS (DEFINED IN THIS FILE) THAT MUST BE CALLED BEFORE INITIALIZING THE FIRST GLOBAL VARIABLES

# THE "BU.ModuleInit.GetModuleInitLanguage()" FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!!

# Since this function gets the language currently used by the system, if you want to change the language, you just have to define
# a new value to the "${LANG}" environment variable before calling the "BashUtils_InitModules()" function in your main script file.

# Setting the whole project's language by getting and sourcing the "gettext.sh" file.

# If the framework is compiled, then you should call the "Bash-utils-${language}.sh" file which corresponds to the language that you want to use.
BU.ModuleInit.IsFrameworkLocalizedCompiled || {
    if [ "${__BU_MODULE_INIT__USER_LANG,,}" != 'en' ]; then
        BU.ModuleInit.GetModuleInitLanguage "${__BU_MODULE_INIT__USER_LANG}" || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };
    fi
}

declare __BU_MODULE_INIT_IS_TRANSLATION_FILES_SOURCED='true';

## ----------------------------------------------

## DEFINING NEW GLOBAL VARIABLES TO STORE THE INITIALIZATION LOGS AND DISPLAY THEM OR NO

# NOTE : The redirections are processed by the "BU.ModuleInit.Msg" function.

# This global variable stores the log messages.
declare __BU_MODULE_INIT_MSG_ARRAY=();

# This global variables stores a random text. It's enough to determine if the messages can be printed and / or stored in the "${__BU_MODULE_INIT_MSG_ARRAY" array with the "BU.ModuleInit.Msg" function.
declare __BU_MODULE_INIT_MSG_ARRAY_EXISTS="$((RANDOM % 255))";

# This global variable stores the processing mode (partial or full).

# By default, it stores the '--mode-log-partial' value, in order to avoid the initialization process being too much verbose.
declare __BU_MODULE_INIT_MSG_ARRAY_MODE='--mode-log-partial';

# This global variable stores the value (given in the "BashUtils_InitModules()" function's main loop)
# which authorizes the displaying of the logs messages on the screen.

# By default, it stores no value, so that the messages are redirected to the "${__BU_MODULE_INIT_MSG_ARRAY" only,
# without being redirected to the screen too (these instructions are processed in the "BU.ModuleInit.Msg" function).
declare __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='';

## ----------------------------------------------

## CALLING THE OTHER FUNCTIONS FOR INITIALIZATION

# Writing the initialization content into the messages array. It will be displayed later on the screen if the « --log-init-display » argument is passed with the « module » argument.
__BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MSG_INITIALIZING_THE_MODULES}")");
__BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg)");

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SOURCING THE MODULES

## INCLUSION OF LIBRARY FILES ACCORDING TO THE INCLUDED MODULE

# ············································································································································
# Please call immediately this function once this file is sourced, and pass it each module you need as arguments, and their supported options.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Decho.Decho.Function()                -> Main -> Decho.lib
#   - BU.Main.Decho.Decho.Highlight()               -> Main -> Decho.lib
#   - BU.Main.Decho.Decho.Path()                    -> Main -> Decho.lib

#   - BU.Main.Headers.Header.Green()                -> Main -> Headers.lib
#   - BU.Main.Headers.Header.Warning()              -> Main -> Headers.lib

#   - BU.Main.Status.ChangeSTAT_INITIALIZING()      -> Main -> Status.lib
#   - BU.Main.Status.CheckStatIsInitializing()      -> Main -> Status.lib

#   - BU.ModuleInit.AskPrintLog()                   -> Modules initializer script (this file)
#   - BU.ModuleInit.Exit()                          -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()                    -> Modules initializer script (this file)
#   - BU.ModuleInit.Msg()                           -> Modules initializer script (this file)

# shellcheck disable=SC1090
function BashUtils_InitModules()
{

    #**** Pre-initialization processing ****
    if [ -n "${__BU_MODULE_INIT_IS_SOURCED}" ] && [ "sourced" == "${__BU_MODULE_INIT_IS_SOURCED}" ]; then
        # shellcheck disable=SC2059
        BU.Main.Headers.Header.Warning "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED}\n" "$(BU.Main.Decho.Decho.Function "${FUNCNAME[0]}")")"; return 1;
    fi

    #**** Parameters ****
    local p_modules_list=("${@}");    # List of all the modules to include passed as arguments

	#**** Variables (global) ****

	#**** Variables (local) ****

	#**** Code ****
	# Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then local lineno="${LINENO}";
        # shellcheck disable=SC2059
		printf "${__BU_MODULE_INIT_MSG__BU_IM__MUST_PASS_A_MODULE_NAME}\n\n" "$(basename "${BASH_SOURCE[0]}")" "${lineno}" "${FUNCNAME[0]}" >&2;

        BU.ModuleInit.AskPrintLog || { if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi };

        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
	fi

    # Writing the list of the installed modules.
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg "${__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG}")");
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg)");

    # Listing the included modules.
	for module_args in "${p_modules_list[@]}"; do
        i=0; # Module's array index incrementer.

        if [[ "${module_args,,}" == 'module --'* ]]; then
            # shellcheck disable=SC2059
            __BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_MODULE_PARAM}" "${i}" "${module_args}")")");
        else
            i="$(( i + 1 ))" # Incrementing the module's array index

            # Name and arguments of the module stored as the nth index of the module list array.

            # shellcheck disable=SC2059
            __BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_NOT_MODULE_PARAM}" "${i}" "${module_args}")")");
        fi
	done

	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg)");
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU.ModuleInit.Msg)");

	# The modules initialization's main process was moved into the "BashUtils_InitModules._()" function, in order ease the access of its functionnalities from any module initializer function.
    BashUtils_InitModules._ "${p_modules_list[@]}" || {
        if BU.ModuleInit.IsInScript; then BU.ModuleInit.Exit 1; else return 1; fi
    };

	# Sourcing the user defined aliases file if the library is directly used from a script file.
	if ! BU.ModuleInit.IsInScript && [ -f "${__BU_MAIN_PROJECT_ALIAS_FILE_PATH}" ] && [ -n "${__BU_MAIN_PROJECT_ALIAS_FILE_PATH}" ]; then BU.Main.Files.SourceFile "${__BU_MAIN_PROJECT_ALIAS_FILE_PATH}" || return 1; fi

	# /////////////////////////////////////////////////////////////////////////////////////////////// #

	#### ENDING THE WHOLE INITIALIZATION PROCESS

	# shellcheck disable=SC2059
	BU.Main.Headers.Header.Green "$(printf "${__BU_MODULE_INIT_MSG__BU_IM__END_OF_FRAMEWORK_INIT}" "$(BU.Main.Decho.Decho.Highlight "${__BU_MAIN_PROJECT_NAME}")" "$(BU.Main.Decho.Decho.Path "${__BU_MAIN_PROJECT_FILE_PATH}" "${__BU_MAIN_COLOR_TXT_PATH}")")";

	# This is the ONLY line where the "${__BU_MAIN_STAT_INITIALIZING}" global status variable's value can be modified.
	# DO NOT set it anymore to "true", or else your script can be prone to bugs.
    if  BU.Main.Status.CheckStatIsInitializing; then
        BU.Main.Status.ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "${LINENO}" || return 1;
	fi

	# Note : the "${__BU_MODULE_INIT_MSG_ARRAY" variable is purged from the logged messages after writing its content in the project's log file.

	# Setting a global variable that prevent a new call of this function.
	__BU_MODULE_INIT_IS_SOURCED='sourced';

	# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	# Backupping a message variable in case the current function is called again, in order to display again the same error message after unsetting every initialization message variables.
	# local var_backup="${__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED}";

	# ---------------------------------------------------------------------------------
	# Unsetting every initialization message variables in order to free up some memory.

	# DO NOT DOUBLE QUOTE THE COMMAND SUBSTITUTION !!!!!

	# shellcheck disable=SC2046
	# unset $(compgen -v "__BU_MODULE_INIT_MSG__");

	# ---------------------------------------------------------------------------
	# Resetting the "${__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED}" variable.
	# __BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED="${var_backup}";

    # Defining a function which is to be used to check if the framework is already sourced, in order to avoid too many checkings in the very beginning of any script that uses this framework, and a new inclusion of the framework's files.

    # Just write this line at the beginning of your script : "x="$(IsInBUFramework)"; if [ "${x^^}" != 'BU' ]; then".

    # After the 'then', call the "BashUtils_InitModules()" with it's mandatory arguments, and then your wanted arguments.
    if ! BU.ModuleInit.IsInScript; then function IsInBUFramework() { echo "BU"; }; fi

	return 0;
}



## NOTE : At this point, the "${__BU_MODULE_INIT_MSG__}" variables values are deleted. Do not add message variables related to the following functions in the initializer file's languages files.

# ···························································································································································································································
# Initializing a single new module after the successful initialization of the main module, in case another module must be added later in the project's script, after the execution of the "BashUtils_InitModules()" function.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Errors.HandleErrors() -> Main -> Errors.lib

function BU.ModuleInit.InitNewModule()
{
    #**** Parameters ****
    local p_newmodule=${1:-$'\0'};  # String    - Default : NULL    - Name of the module to include.

    #**** Code ****
    # If no module name is passed as argument.
    if [ -z "${p_newmodule}" ]; then local lineno="${LINENO}";
		BU.Main.Errors.HandleErrors '1' "$(printf "NO MODULE NAME PASSED AS « %s() » FUNCTION ARGUMENT" "${FUNCNAME[0]}")" \
			"$(printf "You must pass a module name when you call the « %s » module initialization function" "${FUNCNAME[0]}")" \
			"No new module name passed as argument" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return 1;
    else
        BashUtils_InitModules._ "${p_newmodule}" || return 1;

        return 0;
    fi
}

# ································································································································································································································
# Initializing more than one new modules after the successful initialization of the main module, in case other modules must be added later in the project's script, after the execution of the "BashUtils_InitModules()" function.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Errors.HandleErrors()             -> Main -> Errors.lib

#   - BU.Main.Headers.Header.Aqua.Turquoise()   -> Main -> Headers.lib

#   - BU.ModuleInit.Exit()                      -> Modules initializer script (this file)
#   - BU.ModuleInit.InitNewModule()             -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()                -> Modules initializer script (this file)

function BU.ModuleInit.InitNewModules()
{
	#**** Parameters ****
	local p_modules_list=("${@}"); # Array    - Default : NULL    - List of the new modules to init.

	#**** Variables (global) ****

	#**** Variables (local) ****
    local v_index=0;    # Index of the currently processed module (incremented at each loop's iteration). ALWAYS BEGIN WITH THE '0' VALUE !!!
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.

	#**** Code ****
	# Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then local lineno="${LINENO}";
        # shellcheck disable=SC2059
		BU.Main.Errors.HandleErrors '1' "$(printf "NO MODULES NAMES PASSED AS « %s() » FUNCTION ARGUMENT" "${FUNCNAME[0]}")" \
			"$(printf "You must pass one or more modules names when you call the « %s » modules initialization function" "${FUNCNAME[0]}")" \
			"No new module(s) name(s) passed as argument(s)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

		return 1;
    else
        # At this point, the main module is initialized, so its functions can be called safely.
        BU.Main.Headers.Header.Aqua.Turquoise "";

        BashUtils_InitModules._ "${p_modules_list[@]}" || return 1;

        if [ "${v_loop_error}" == 'error' ]; then BU.ModuleInit.IsInScript && BU.ModuleInit.Exit 1; return 1; fi

        return 0;
	fi
}

# ···················································
# Sourcing a single aliases file for a single module.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   -

function BU.ModuleInit.SourceAliasesFile()
{
    return 0;
}

# ················································
# Sourcing multiple aliases files for each module.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.ModuleInit.SourceAliasFile() -> Modules initializer script (this file)

function BU.ModuleInit.SourceAliasesFiles()
{
    return 0;
}

# ·························
# Unsource a single module.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Echo.Newline()

#   - BU.Main.Errors.HandleErrors()     -> Main -> Errors.lib

#   - BU.Main.Headers.Newstep()         -> Main -> Headers.lib

#   - BU.UnsourceExceptionFunctions()   -> From the file processed by the function's major condition.
#   - BU.UnsourceExceptionVariables()   -> From the file processed by the function's major condition.

function BU.ModuleInit.UnsourceModule()
{
    #**** Parameters ****
    local p_module=${1:-$'\0'};  # String    - Default : NULL    - Name of the module to unsource.

    #**** Code ****
    # If no module name is passed as argument.
    if [ -z "${p_module}" ]; then local lineno="${LINENO}";
		BU.Main.Errors.HandleErrors '1' "$(printf "NO MODULE NAME PASSED AS « %s() » FUNCTION ARGUMENT" "${FUNCNAME[0]}")" \
			"$(printf "You must pass a module name when you call the « %s » module unsourcing function" "${FUNCNAME[0]}")" \
			"No module name passed as argument" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return 1;
    else
        # Checking if the main module is passed as argument, to prevent its unsourcing.
        if [[ "${p_module}" == [Mm][Aa][Ii][Nn] ]]; then
            BU.Main.Errors.HandleErrors '1' "$(printf "%s YOU TRIED TO UNSOURCE THE MAIN MODULE" "$(BU.Main.Decho.__Decho.Yellow "WARNING :")")" \
                "Calling the main module as argument would unsource every files related to the main module, thus making the main functions of the framework unusable" \
                "$(printf "Main module passed as argument to the %s function" "${FUNCNAME[0]}")" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";
        else
            BU.Main.Headers.Newstep "UNSOURCING THE ${p_module^^} MODULE";
            BU.Main.Echo.Newline;

            # Unsourcing functions whose names does not follow the advised Bash Utils coding style.
            if  [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Unsource.sh"                                           'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "UnsourceExceptions.sh"                                 'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Unsource.${p_module}.sh"                               'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "UnsourceExceptions.${p_module}.sh"                     'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Unsource.${p_module}.Unsource.sh"                      'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "Unsource.${p_module}.UnsourceExceptions.sh"            'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "UnsourceExceptions.${p_module}.sh"                     'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "UnsourceExceptions.${p_module}.UnsourceExceptions.sh"  'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${p_module}.Unsource.sh"                               'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${p_module}.UnsourceExceptions.sh"                     'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${p_module}.Unsource.${p_module}.sh"                   'f' 'shut' 'unsourceexcept')" ]] || \
                [[ "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${p_module}.UnsourceExceptions.${p_module}.sh"         'f' 'shut' 'unsourceexcept')" ]]; then

                    v_module_unsourceexcept_file_name="$(basename "$(cat "${__BU_MODULE_INIT__TMP_DIR_PATH}/BU_module_init__find_path.unsourceexcept.tmp")")";

                    # Sourcing the file to get every functions and variables names, in order to unset each of them.

                    # shellcheck disable=SC1090
                    source "$(BU.ModuleInit.FindPath "${__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH}" "${v_module_unsourceexcept_file_name}" 'f')" || {
                        BU.Main.Errors.HandleErrors "1" "UNABLE TO SOURCE THE ${p_module} MODULE'S UNSOURCER FILE" \
                            "" "" "$(basename "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$(( LINENO - 1 ))")";
                    };

                    # Calling the "BU.UnsourceExceptionFunctions()" function (defined in the "${v_module_unsourceexcept_file_name}" file),
                    # which calls the "$(unset ${function})" command before each function name in order to unsource it.
                    BU.UnsourceExceptionFunctions;

                    # Calling the "BU.UnsourceExceptionVariables()" function (defined in the "${v_module_unsourceexcept_file_name}" file),
                    # which calls the "$(unset ${variable})" command before each variable name in order to unsource it.
                    BU.UnsourceExceptionVariables;

                    return 0;
            fi

            # Unsetting every functions from the target module (DO NOT QUOTE THE $(compgen -v ...) COMMAND SUBSTITUTION !!!).
            # unset -f $(compgen -c "BU.${p_module}.");

            # Unsetting every variables from the target module (DO NOT QUOTE THE $(compgen -v ...) COMMAND SUBSTITUTION !!!).
            # unset $(compgen -v "__BU_${p_module^^}_");

            return 0;
        fi
    fi
}

# ·····················································
# Unsourcing multiple modules at once from the project.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Errors.HandleErrors()             -> Main -> Errors.lib

#   - BU.Main.Headers.Header.Aqua.Turquoise()   -> Main -> Headers.lib

#   - BU.ModuleInit.Exit()                      -> Modules initializer script (this file)
#   - BU.ModuleInit.IsInScript()                -> Modules initializer script (this file)
#   - BU.ModuleInit.UnsourceModule()            -> Modules initializer script (this file)

function BU.ModuleInit.UnsourceModules()
{
    #**** Parameters ****
    local p_modules_list=("${@}");  # Array     - Default : NULL    - List of the modules to unsource.

    #**** Code ****
	# Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then local lineno="${LINENO}";
        # shellcheck disable=SC2059
		BU.Main.Errors.HandleErrors '1' "$(printf "NO MODULES NAMES PASSED AS « %s() » FUNCTION ARGUMENT" "${FUNCNAME[0]}")" \
			"$(printf "You must pass one or more module name when you call the « %s » modules unsourcing function" "${FUNCNAME[0]}")" \
			"No module(s) name(s) passed as argument(s)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

		return 1;
    else
        # At this point, the main module is initialized, so its functions can be safely called.
        BU.Main.Headers.Header.Aqua.Turquoise "";

        for i in "${p_modules_list[@]}"; do
            BU.ModuleInit.UnsourceModule "${i}" || { v_loop_error='error'; break; };
        done

        if [ "${v_loop_error}" == 'error' ]; then BU.ModuleInit.IsInScript && BU.ModuleInit.Exit 1; return 1; fi

        return 0;
	fi

    return 0;
}

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MODULES TRANSLATIONS

## MISC FUNCTIONS DEFINITION

# ·················································································································
# Remaking the "BU.Main.Errors.HandleErrors()" function in order to make it working for the initialization process.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - BU.Main.Errors.HandleErrors() -> Main -> Errors.lib

#   - BU.ModuleInit.AskPrintLog()   -> Modules initializer script (this file)
#   - BU.ModuleInit.MsgAbort()      -> Modules initializer script (this file)

function BU.ModuleInit.HandleErrors()
{
    #**** Parameters ****
    local p_returnCode=${1:-0}          # Int       - Default : NULL    - Return code of the last command or function called before the current function.
    local p_errorString=${2:-NULL};     # String    - Default : NULL    - String of the type of error to display.
    local p_adviceString=${3:-NLL};     # String    - Default : NULL    - String of characters displaying a tip to direct the user to the best solution to apply in case of a problem.
    local p_badValue=${4:-NULL};        # String    - Default : NULL    - Incorrect value which caused the error.
    local p_file=${5:-NULL};            # String    - Default : NULL    - The name of the file where the error occured.
    local p_function=${6:-NULL};        # String    - Default : NULL    - The name of the function where the error occured.
    local p_lineno=${7:-NULL};          # String    - Default : NULL    - Line on which the error message occured (obtained in a very simple way by calling the POSIX environment variable "${LINENO}").

    #**** Code ****
    if [ "${p_returnCode}" -eq 0 ]; then return 0; else
        if [ -n "${__BU_MODULE_INIT_IS_SOURCED}" ] && [ "${__BU_MODULE_INIT_IS_SOURCED}" == 'sourced' ]; then
            BU.Main.Errors.HandleErrors "${p_returnCode}" "${p_errorString}" "${p_adviceString}" "${p_badValue}" "${p_file}" "${p_function}" "${p_lineno}"; return "${?}";

        else
            echo "IN ${p_file}, FUNCTION ${p_function}, LINE ${p_lineno} --> ERROR : ${p_errorString}" >&2;
            echo "Advice : ${p_adviceString}" >&2;
            echo >&2;

            echo "Value that caused this error : ${p_badValue}" >&2;

            BU.ModuleInit.MsgAbort;

            BU.ModuleInit.AskPrintLog >&2 || return 1;

            return "${p_returnCode}";
        fi
    fi

    return 1;
}

## ----------------------------------------------

## PARSING THE TRANSLATION FILE OF THE CURRENTLY PROCESSED MODULE

# ················································
# Parsing the translation CSV file of each module.

# The "BU.ModuleInit.ParseCSVLang()" function MUST be called in the current module's initialization script.

# IMPORTANT : It MUST be called AFTER the "BU.Main.Initializer.SourceLibrary" and BEFORE the "BU.Main.Initializer.SourceConfig()"
# functions in the main module's initialization file, in the "STEP FOUR" sub-section, in order to get the main module's functions and
# to translate the global variables descriptions written with the "BU.ModuleInit.DisplayInitGlobalVarsInfos()" function.

# Featured function(s) and file(s) by module(s) and from the "functions" folder :
#   - TODO

# shellcheck disable=SC1090
function BU.ModuleInit.ParseCSVLang()
{
    #**** Parameters ****
    local p_lang_ISO_639_1=${1:-${__BU_MODULE_INIT__USER_LANG}};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : ${__BU_MODULE_INIT__USER_LANG}   - DESC : Language to fetch.
    local p_delim=${2:-$'\0'};                                   	# ARG TYPE : Char       - REQUIRED | DEFAULT VAL : NULL                             - DESC : CSV file delimiter.

    #**** Variables ****
    local v_outputFileName="${__BU_MODULE_INIT_MODULE_NAME}.${p_lang_ISO_639_1}.translate";
    local v_outputFileParent="${__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH}";
    local v_outputFilePath="${v_outputFileParent}/${v_outputFileName}";

    local v_filename="${__BU_MODULE_INIT_MODULE_NAME}-${p_lang_ISO_639_1}.csv";
    local v_CSVFirstColRow;

    # Getting the total number of columns.
    local x;

	# Gets the return code of the Perl script used to parse the translation file in CSV format.
	local v_perlScriptReturnCode;

	local v_perlScriptExecLineno;

    # Getting the wanted column (set to 0, and the value will be taken from a new assignation of the variable with the call of the "BU.Main.Text.GetSubStringAfterDelim" function as sub-shell).
#    local v_wantedColID=0;

    # Getting the string of values (gathered from the first row of the CSV file) after the nth delimiter.
#    local v_CSVFirstColRowAfterNthDelim;

    # Perl script return codes.
    local v_perlScriptNoCSVFileGivenAsArgErrorCode="10022";             # Do not change this return code.
    local v_perlScriptPathIsDirErrorCode="1";
    local v_perlScriptFileIsNotCSVFormatErrorCode="2";

    local v_perlScriptIndexColNotPassedAsSecondArgErrorCode="3";
    local v_perlScriptIndexColIsNotIntErrorCode="4";
    local v_perlScriptLangFileOutputNotPassedAsThirdArgErrorCode="5";

    local v_perlScriptCSVFileCannotBeReadErrorCode="6";
    local v_perlScriptOutputFileCannotBeCreatedErrorCode="7";
    local v_perlScriptNotEnoughDiskSpaceAvailableErrorCode="14";        # Do not change this return code.

    #**** Code ****
    # Note : if the file cannot be obtained, or if there is another error during the parsing of the current module's translations CSV file,
    # then the execution of the script MUST be stopped, or else no messages will be printed on the screen while the script is executed.

    # If the output file already exists, then it's not necessary to retranslate the module.
    if [ -f "${v_outputFilePath}" ] && [ -n "${v_outputFilePath}" ]; then
		BU.ModuleInit.Msg "The ${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH} translations CSV file already exists for this language : ${p_lang_ISO_639_1}";
		BU.ModuleInit.Msg;

		BU.ModuleInit.IsFrameworkUnlocalizedCompiled && {
            source "${v_outputFilePath}" || {
                local C="${?}";

                local lineno="$(( LINENO - 3 ))";

                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__UNABLE_TO_SOURCE_TRANSL_OUT_FILE";

                BU.ModuleInit.HandleErrors "${C}" "$(printf "UNABLE TO SOURCE THE EXISTING « %s » TRANSLATIONS FILE" "${v_outputFilePath}")" \
                    "Please check what causes the script to not source the output file, which contains the target language's translations" \
                    "${v_outputFilePath}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

                return "${?}";
            }

            return 0;
		};
	fi

    # If no path to the module's translation CSV file is given.
    if [ -z "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" ]; then local lineno="${LINENO}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__NO_PATH_TO_MOD_TRANSL_FILE";

        BU.ModuleInit.HandleErrors '1' "$(printf "NO PATH TO THE « %s » MODULE'S TRANSLATION FILE EXISTS" "${__BU_MODULE_INIT_MODULE_NAME}")" \
            "Please give a valid path to the current module's translations CSV file" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    fi

    if [ -z "${v_filename}" ]; then local lineno="${LINENO}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" 'E_BUINIT__PARSECSVLANG__';

        return "${?}";
    fi

    # if a path to the module's translation CSV was given, but doesn't matches to a valid file path (the given path doesn't exists).
    if [ -n "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" ] && [ ! -f "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" ]; then local lineno="${LINENO}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__INVALID_TRANSL_FILE_PATH";

        BU.ModuleInit.HandleErrors '1' "$(printf "THE PATH TO THE « %s » TRANSLATION FILE IS NOT VALID" "${__BU_MODULE_INIT_MODULE_NAME}")" \
            "Please give a valid path to the current module's translations CSV file" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    fi

    # If a path to the module's translation CSV was given AND the path exists AND the output file doesn't exists, but the exact file name doesn't matches with the defined name pattern.
    if [ -n "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" ] \
        && [ -f "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" ] \
        && [ ! -f "${v_outputFilePath}" ] \
        && [ "$(basename "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")" != "${v_filename}" ]; then local lineno="${LINENO}";
            BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__TARGET_TRANSL_FILE_DOES_NOT_MATCHES_DEFINED_PATTERN";

            BU.ModuleInit.HandleErrors '1' "$(printf "THE NAME OF THE « %s » PROJECT'S TRANSLATION FILE DOESN'T MATCHES WITH THE DEFINED NAME PATTERN" "${__BU_MODULE_INIT_MODULE_NAME}")" \
                "Please give a valid name to the current module's translations CSV file. The pattern is (without single quotes) : '\$module_name'-'\$ISO_639-1_language_code'" \
				"${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

            return "${?}";
    fi

    # If no delimiter is given.
    if [ -z "${p_delim}" ]; then local lineno="${LINENO}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__UNDEFINED_DELIM";

        BU.ModuleInit.HandleErrors '1' "NO DELIMITER WAS GIVEN FOR THE CSV FILE" \
            "Please give a « single unicode character » as CSV delimiter in order to get each wanted cell" \
            "${p_delim}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    fi

    if [ -n "${p_delim}" ] && [ "${#p_delim}" -gt 1 ]; then local lineno="${LINENO}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__DELIM_MUST_BE_UNICODE_CHAR";

        BU.ModuleInit.HandleErrors '1' "THE GIVEN DELIMITER MUST BE A SINGLE UNICODE CHARACTER" \
            "Please give a « single unicode character » as valid CSV delimiter in order to get each wanted cell" \
            "${p_delim}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    fi

    # Begin parsing the CSV file.
    BU.Main.Headers.Header.Blue "$(printf "PARSING THE « %s » PROJECT'S  « %s » TRANSLATIONS CSV FILE" "${__BU_MAIN_PROJECT_NAME}" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")";

    BU.ModuleInit.Msg "Finding the variables list column";
    BU.ModuleInit.Msg;

    # If the targeted CSV file cannot be read by the current user.
    if [ ! -r "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" ]; then local lineno="${lineno}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__UNABLE_TO_READ_FILE";

        BU.ModuleInit.HandleErrors '1' "$(printf "Unable to read the « %s » file" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")" \
            "Please check the permissions of this file" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    fi

    # Getting the first row and first column's cell.
    v_CSVFirstColRow="$(BU.Main.Text.GetSubStringBeforeDelim "$(awk 'NR == 1 {print $1}' "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" || {
        local C="${?}";

        local lineno="$(( LINENO - 3 ))";

        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__VARIABLE_VAL_UNABLE_TO_FIND";

        BU.ModuleInit.HandleErrors '1' "$(printf "UNABLE TO FIND THE VALUE « VARIABLE » IN THE FIRST ROW AND FIRST COLUMN OF THE « %s » FILE" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")" \
            "$(printf "Please check if the value mentioned above is present on this EXACT cell of the « %s » file" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")" \
            "${v_CSVFirstColRow}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    })" "${p_delim}" '--init')";

    if [ "${v_CSVFirstColRow}" != "VARIABLE" ]; then local lineno="${LINENO}";
        BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${lineno}" "E_BUINIT__PARSECSVLANG__VARIABLE_VAL_NOT_FOUND";

        BU.ModuleInit.HandleErrors '1' "$(printf "NO « VARIABLE » VALUE FOUND AT THE FIRST COLUMNN AND FIRST ROW OF THE « %s »" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")" \
            "Make sure the current module's CSV translations file is correctly formatted. You can check the main module's CSV file to check how the formatting should be done" \
            "${v_CSVFirstColRow}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${lineno}";

        return "${?}";
    else
        BU.ModuleInit.Msg "$(printf "Parsing the « %s » translations file" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")";
        BU.ModuleInit.Msg;

        BU.ModuleInit.Msg "$(printf "Getting the chosen language's row (targeted language : %s)" "${p_lang_ISO_639_1}")";
        BU.ModuleInit.Msg;

        # Getting the total number of columns.
        x="$(awk -F, '{ print NF; exit }' "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}")";

        # Getting the langage ISO 639-1 code from the first row.
#        v_CSVFirstColRowAfterNthDelim="$(BU.Main.Text.GetSubStringAfterDelim "${v_CSVFirstColRow}" "${p_delim}" "$(( x - 1 ))") '' '--init'";

        # Getting the wanted language's column.
        v_wantedColID="$(BU.Main.Text.GetSubStringAfterDelim "${v_CSVFirstColRow}" "${p_delim}" "$(( x - 1 ))" "count" '--init')";

        # The targeted column is acquired, the Perl script's parsing program SetMouduleLang.pl can finally be called.
		v_perlScriptExecLineno="${LINENO}"; perl "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" "${v_filename}" "${v_wantedColID}" "${v_outputFilePath}";

        # Getting the return value of the last command.
		v_perlScriptReturnCode="${?}";

		# Checking the eventual errors returned by the parsing program.
		if [ "${v_perlScriptReturnCode}" -eq 0 ]; then
			BU.ModuleInit.Msg "$(printf "The « %s » translations CSV file was successfully parsed, and the « %s » language's translations output file « %s » was successfully created" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" "${p_lang_ISO_639_1}" "${v_outputFilePath}")";
			BU.ModuleInit.Msg;

			__BU_MODULE_INIT__BU_BASE_IS_TRANSLATED='true';

			BU.ModuleInit.IsFrameworkUnlocalizedCompiled && {
                source "${v_outputFilePath}" || {
                    local C="${?}"; BU.ModuleInit.SourcingFailure "${v_outputFilePath}" "${__BU_MODULE_INIT_MODULE_NAME}" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "${LINENO}";

                    return "${C}";
                };  return    0;
            };

		else
			# The CSV file was not passed as first argument.
			if		[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptNoCSVFileGivenAsArgErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_FIRST_ARG_NOT_CSV_FILE";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "NO CSV FILE GIVEN AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME}")" \
                    "Please pass as first argument the path of the translations CSV file you want to process" \
                    "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

			# A path was passed as first argument, but it's a directory path.
			elif	[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptPathIsDirErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_FIRST_ARG_IS_DIR";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "THE PATH PASSED AS FIRST ARGUMENT FOR THE « %s » PERL SCRIPT IS A DIRECTORY PATH, AND NOT A CSV FILE PATH" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME}")" \
                    "Please pass as first argument the path of the translations CSV ${__BU_MAIN_TXT_FMT_ITALIC}>>> file <<<${__BU_MAIN_TXT_FMT_ITALIC_RESET} you want to process" \
                    "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

			# A path was passed as first argument. It's a file, but not in CSV format.
			elif	[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptFileIsNotCSVFormatErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_FIRST_ARG_FILE_IS_NOT_CSV";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "THE FILE PATH PASSED AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT IS NOT A CSV FILE PATH" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME}")" \
                    "Please pass as first argument the path of the translations ${__BU_MAIN_TXT_FMT_ITALIC}>>> CSV file <<<${__BU_MAIN_TXT_FMT_ITALIC_RESET} you want to process" \
                    "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

			# The column's index was not passed as second argument.
			elif	[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptIndexColNotPassedAsSecondArgErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_SEC_ARG_NO_COL_INDEX";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "NO COLUMN INDEX PASSED AS SECOND ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME}")" \
                    "Please pass as second argument as the index of the column you want to process" "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

			# The column's index passed as second argument was not an integer.
			elif	[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptIndexColIsNotIntErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_SEC_ARG_NOT_INT";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "THE PERL TRANSLATION SCRIPT'S SECOND ARGUMENT IS NOT AN INTEGER" \
                    "Please pass an integer as second argument, as the target column ID" "${v_perlScriptReturnCode}" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

            # The language file's output path was not passed as third argument.
            elif    [ "${v_perlScriptReturnCode}" -eq "${v_perlScriptLangFileOutputNotPassedAsThirdArgErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_THIRD_ARG_NO_OUT_FILEPATH";

                BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "NO LANGUAGE FILE'S OUTPUT PATH PASSED AS THIRD ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME}")" \
                    "Please pass a third argument as the output file path to create" "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

			# The CSV file cannot be read by the Perl script.
			elif	[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptCSVFileCannotBeReadErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_UNABLE_TO_READ_CSV_FILE";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "THE « %s » PERL TRANSLATION SCRIPT CANNOT READ THE TARGET « %s » CSV TRANSLATIONS FILE" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH}" "${v_filename}")" \
                    "Please check the permissions of the targeted CSV file, then relaunch the script" "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

			# The output file cannot be created by the Perl script.
			elif	[ "${v_perlScriptReturnCode}" -eq "${v_perlScriptOutputFileCannotBeCreatedErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_UNABLE_TO_CREATE_OUT_FILE";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "THE « %s » LANGUAGE'S OUTPUT FILE CANNOT BE CREATED BY THE « %s » PERL TRANSLATION SCRIPT" "${v_outputFilePath}" "${__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME}")" \
                    "Please check the cause of this error, then relaunch the script" "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

				return "${v_perlScriptReturnCode}";

            # Not enough storage is available to complete this operation.
            elif    [ "${v_perlScriptReturnCode}" -eq "${v_perlScriptNotEnoughDiskSpaceAvailableErrorCode}" ]; then
                BU.ModuleInit.PrintLogError "${BASH_SOURCE[0]}" "${v_perlScriptExecLineno}" "E_BUINIT__PARSECSVLANG__PERL_SCRIPT_NO_SPACE_LEFT_ON_DEVICE";

				BU.ModuleInit.HandleErrors "${v_perlScriptReturnCode}" "$(printf "NO SPACE LEFT ON THE DEVICE FOR THE CREATION OF THE « %s » LANGUAGE'S OUTPUT FILE" "${v_outputFilePath}")" \
                    "Please free up some disk memory before using this script to translate the current module" "${v_perlScriptReturnCode}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "${v_perlScriptExecLineno}";

                printf "Deleting the created language's output file « %s »\n" "${v_outputFilePath}" >&2;
                echo >&2;

                if rm -v "${v_outputFilePath}"; then
                    printf "The « %s » file was successfully erased\n" "${v_outputFilePath}" >&2;
                    echo >&2;

                else
                    printf "UNABLE TO DELETE THE LANGUAGE'S OUTPUT FILE « %s »\n" "${v_outputFilePath}" >&2;
                    echo "Please do so before relaunching this script after freeing some space on your hard drive, in order to avoid this script to consider the translations already done" >&2;
                    echo >&2;
                fi

                BU.ModuleInit.AskPrintLog >&2 || { if BU.ModuleInit.IsInScript; then exit 1; else return 1; fi };

                if BU.ModuleInit.IsInScript; then exit "${v_perlScriptReturnCode}"; else return "${v_perlScriptReturnCode}"; fi
            fi
		fi
	fi
}

## ----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #
