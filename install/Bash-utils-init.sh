#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name          : Bash-utils-init.sh
# Description   : Library initializer script, initializing all the modules you need for your scripts.
# Author(s)     : Dimitri Obeid
# Version       : 3.0

# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC2154,SC1090

# -----------------------------------------------------------------------------
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your main script file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

    exit 1;
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### INITIALIZER RESOURCES - FUNCTIONS

## USEFUL FUNCTIONS

# Use this function to have a better view about a bug location during a "bash -x" debug.
function DbgMsg()
{
    #**** Parameters ****
    local p_code=$1		# Exit code.
    local p_sleep=$2	# Pause time in seconds.

    #**** Code ****
printf "

-------------------------------------------------
                      DEBUG
-------------------------------------------------

"

    if [ "$p_code" -eq 0 ]; then
        sleep "$p_sleep"

        return
    else
        exit 1		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
    fi
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE INITIALIZATION PROCESS TRANSLATIONS

function BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary()
{
    echo '------------------------------------------------------------------------' >&2;
    echo >&2;

    [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'de' ] && echo "Der Rest der Bibliothek wird Englisch als Standardsprache verwenden" >&2 && echo >&2;
    [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'en' ] && echo "The rest of the library will use english as default language" >&2 && echo >&2;
    [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'es' ] && echo "El resto de la biblioteca utilizará el inglés como idioma por defecto" >&2 && echo >&2;

    [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'fr' ] && echo "Le reste de la librairie utilisera l'anglais en tant que langue par défaut" >&2 && echo >&2;

    sleep 0.5;

    BU::ModuleInit::GetModuleInitLanguage_SetEnglishAsDefaultLanguage;
}

function BU::ModuleInit::GetModuleInitLanguage_SetEnglishAsDefaultLanguage()
{
    # Changing the current language to English.
    LANG="en_US.UTF-8";

    source "$__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR/en.locale" || {
        echo >&2;

        # Deutch | German
        [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'de' ] && {
            echo '------------------------------------------------------------------------------------------------' >&2 && echo >&2;
            echo "FATALER FEHLER : DIE ENGLISCHE ÜBERSETZUNGSDATEI KONNTE NICHT VON DER QUELLE REFERENZIERT WERDEN" >&2 && echo >&2;

            echo "Da die Nachrichten in der Modulinitialisierungsdatei in Variablen gespeichert werden, stützt sich diese Datei auf diese Übersetzungsdateien, die diese Variablen definieren" >&2;
            echo "Anhalten der Skriptausführung" >&2;
            echo >&2;

            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            exit 1;
        }

        # English
        [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'en' ] && {
            echo '-----------------------------------------------------------' >&2 && echo >&2;
            echo "FATAL ERROR : UNABLE TO SOURCE THE ENGLISH TRANSLATION FILE" >&2 && echo >&2;

            echo "Since the messages in the module initialization file are stored into variables, this file relies on these translation files, which define these variables" >&2;
            echo "Aborting the script's execution" >&2;
            echo >&2;

            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            exit 1;
        }

        # Español | Spanish
        [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'es' ] && {
            echo '-----------------------------------------------------------------' >&2 && echo >&2;
            echo "ERROR FATAL: IMPOSIBLE OBTENER EL ARCHIVO DE TRADUCCIÓN AL INGLÉS" >&2 && echo >&2;

            echo "Como los mensajes del fichero de inicialización del módulo se almacenan en variables, este fichero es asumido por estos ficheros de traducción, que definen estas variables" >&2;
            echo "Detener la ejecución del script" >&2;
            echo >&2;

            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            exit 1;
        }

        # Français | French
        [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'fr' ] && {
            echo '----------------------------------------------------------------------' >&2 && echo >&2;
            echo "ERREUR FATALE : IMPOSSIBLE D'INCLURE LE FICHIER DE TRADUCTIONS ANGLAIS" >&2 && echo >&2;

            echo "Comme les messages du fichier d'initialisation du module sont stockés dans des variables, ce fichier s'appuie sur ces fichiers de traduction, qui définissent ces variables" >&2;
            echo "Arrêt de l'exécution du script" >&2;
            echo >&2;

            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            exit 1;
        }
    }
}

# Rewriting the library's languages messages.
function BU::ModuleInit::GetModuleInitLanguage()
{
    #**** Parameters ****
    local p_lang=$1;    # Wanted language.

    #**** Code ****
	if [ -z "$p_lang" ]; then
        [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'de' ] && echo "ACHTUNG : Keine Sprache wird als Argument angegeben, wenn die Funktion « ${FUNCNAME[0]} » aufgerufen wird" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'en' ] && echo "WARNING : No language specified as argument when calling the « ${FUNCNAME[0]} » function" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'es' ] && echo "ADVERTENCIA : No se especifica ningún idioma como argumento al llamar a la función « ${FUNCNAME[0]} »" >&2 && echo >&2;

		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'fr' ] && echo "Attention : Aucune langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]} »" >&2 && echo >&2;

		BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary;

    elif [ -n "$p_lang" ] && [ ! -f "$__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR/$p_lang.locale" ]; then
		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'de' ] && echo "ACHTUNG : Die Übersetzungsdatei für die Sprache, die beim Aufruf der Funktion « ${FUNCNAME[0]} » als Argument angegeben wurde, konnte im Ordner « $__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR » nicht gefunden werden" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'en' ] && echo "WARNING : The translation file for the language specified as an argument when calling the « ${FUNCNAME[0]} » function was not found in the « $__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR » directory" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'es' ] && echo "ADVERTENCIA : El archivo de traducción para el idioma especificado como argumento al llamar a la función « ${FUNCNAME[0]} » no se encontró en el directorio « $__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR »" >&2 && echo >&2;

		[ "${__BU_MODULE_INIT_USER_LANG,,}" = 'fr' ] && echo "ATTENTION : Le fichier de traduction destiné à la langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]} » n'a pas été trouvé dans le dossier « $__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR »" >&2 && echo >&2;

        BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary;

    else
        source "$__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR/$p_lang.locale" || {
            [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'de' ] && echo "ACHTUNG : Die Übersetzungsdatei für die als Argument angegebene Sprache konnte beim Aufruf der Funktion « ${FUNCNAME[0]} » nicht gefunden werden." >&2 && echo >&2;
            [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'en' ] && echo "WARNING : Unable to source the translation file for the language specified as argument when calling the « ${FUNCNAME[0]} » function" >&2 && echo >&2;
            [ "${__BU_MODULE_INIT_USER_LANG,,}" = "es" ] && echo "ADVERTENCIA : No se ha podido obtener el archivo de traducción para el idioma especificado en el argumento al llamar a la función « ${FUNCNAME[0]} »" >&2 && echo >&2;

            [ "${__BU_MODULE_INIT_USER_LANG,,}" = 'fr' ] && echo "FR | ATTENTION : Impossible de sourcer le fichier de traduction destiné à la langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]} »" >&2 && echo >&2;

            BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary;
        }
    fi
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES

# Asking to the user if (s)he wants to display the initialization logs on the screen (preferably before stopping the script's execution after a fatal error).
function BU::ModuleInit::AskPrintLog()
{
	#**** Code ****
	if [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" == '--log-display' ]; then
        echo;

		BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__ASK_DISPLAY" '#' 'echo';

		# If the user's defined language is not English, then a message will be displayed to ask the user in his/her language to write 'yes' or 'Y' if he/she wants to display the initialization logs.
		if [ "${__BU_MODULE_INIT_USER_LANG,}" != 'en' ]; then
            echo "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_ENGLISH";
		fi

		echo; read -rp "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__ENTER_ANS" read_ask_print_log;

		if [ "${read_ask_print_log,,}" = 'yes' ] || [ "${read_ask_print_log^^}" = 'Y' ]; then
			BU::ModuleInit::PrintLog;

			return 0;
		else
			echo; echo "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_DISPLAY"; echo; return 0;
		fi
	else
		return 0;
	fi
}

# Printing and / or logging the global variables already defined.
function BU::ModuleInit::DisplayInitGlobalVarsInfos__DisplayInitializedGlobalVarsInfos()
{
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_GLOBAL_VARS" '#' 'msg';
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__SCRIPT_INFO" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_PROJECT_PID'           "$__BU_MODULE_INIT_PROJECT_PID" 'Int'       "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__PID"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_project_pid_lineno";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_ROOT_DIR_VARS" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_ROOT_HOME"             "$__BU_MODULE_INIT_ROOT_HOME"               'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT_HOME"               "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_root_home_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_ROOT"                  "$__BU_MODULE_INIT_ROOT"                    'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT"                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_root_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_INITIALIZER_PATH'      "$__BU_MODULE_INIT_INITIALIZER_PATH"        'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INITIALIZER_PATH"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_initializer_path_lineno";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_CONF_DIRS" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_CONFIG_DIR"            "$__BU_MODULE_INIT_CONFIG_DIR"              'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR"              "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_config_dir_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_CONFIG_INIT_DIR"       "$__BU_MODULE_INIT_CONFIG_INIT_DIR"         'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR"         "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_config_init_dir_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_CONFIG_MODULES_DIR"    "$__BU_MODULE_INIT_CONFIG_MODULES_DIR"      'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR"      "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_config_modules_dir_lineno";

    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR"  "$__BU_MODULE_INIT_CONFIG_INIT_LANG_DIR"    'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_config_init_lang_dir_lineno";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MODULE_INIT_DIR" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_MODULES_DIR"           "$__BU_MODULE_INIT_MODULES_DIR"             'Dirpath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__MODULES_DIR"             "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_modules_dir_lineno";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_FILE_PATH" '+' 'msg'; BU::ModuleInit::Msg
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_NAME"            "$__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_NAME"          'File'      "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME"           "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_lib_root_dir_file_name_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PARENT_DIR"      "$__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PARENT_DIR"    'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_lib_root_dir_file_parent_dir_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PATH"            "$__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PATH"          'Filepath'  "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH"           "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_lib_root_dir_file_path_lineno";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_ROOT_FILE" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_NAME"       "$__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_NAME"         'File'      "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_lib_root_dir_root_file_name_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "$__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR"   'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_lib_root_dir_root_file_parent_dir_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PATH"       "$__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PATH"         'Filepath'  "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_lib_root_dir_root_file_path_lineno";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MISC_VARS" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CSV_TRANSLATION_FILE_DELIM'    "$__BU_MODULE_INIT_CSV_TRANSLATION_FILE_DELIM"              'Char'  "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__TRANSLATION_FILE_DELIM"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_csv_translation_file_delim_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_DATE_LOG'                      "$__BU_MODULE_INIT_DATE_LOG"                                'CMD'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__DATE_LOG"                  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_date_log_lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_USER_LANG'                     "$__BU_MODULE_INIT_USER_LANG"                               'CMD'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__USER_LANG"                 "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init_user_lang_lineno";

    # Unsetting the string variables.
    unset __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_GLOBAL_VARS \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__SCRIPT_INFO \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__PID \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT_HOME \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INITIALIZER_PATH \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__MODULES_DIR \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__TRANSLATION_FILE_DELIM \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__DATE_LOG \
        __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__USER_LANG

    # Unsetting the line number values.
    unset __bu_module_init_project_pid_lineno \
        __bu_module_init_root_home_lineno \
        __bu_module_init_root_lineno \
        __bu_module_init_initializer_path_lineno \
        __bu_module_init_config_dir_lineno \
        __bu_module_init_config_init_dir_lineno \
        __bu_module_init_config_modules_dir_lineno \
        __bu_module_init_config_init_lang_dir_lineno \
        __bu_module_init_modules_dir_lineno \
        __bu_module_init_lib_root_dir_file_name_lineno \
        __bu_module_init_lib_root_dir_file_parent_dir_lineno \
        __bu_module_init_lib_root_dir_file_path_lineno \
        __bu_module_init_lib_root_dir_root_file_name_lineno \
        __bu_module_init_lib_root_dir_root_file_parent_dir_lineno \
        __bu_module_init_lib_root_dir_root_file_path_lineno \
        __bu_module_init_csv_translation_file_delim_lineno \
        __bu_module_init_date_log_lineno \
        __bu_module_init_user_lang_lineno
}

# Displaying the information on the initialized global variables
function BU::ModuleInit::DisplayInitGlobalVarsInfos()
{
    if [ "$__BU_MODULE_INIT_MSG_ARRAY_MODE" = '--mode-log-full' ]; then

        #**** Parameters ****
        local p_var_name=$1;	# Name of the variable.
        local p_var_val=$2;		# Value stored in the variable.
		local p_var_type=$3;	# Type of variable (array, int (integer), float, path, string).
        local p_var_desc=$4;	# Description of the variable.
        local p_file=$5;        # File where the variable was declared.
        local p_func=$6;        # Function where the variable was declared.
        local p_line=$7;        # Line where the variable was declared.

        # If the variable type is an array, then the values must be passed as an array,
        # or else only the first index's value will be displayed.
        shift 7
        local pa_var_val_array=("$@")

        #**** Variables ****
        local v_file; v_file="$([[ -n "$p_file" ]] && printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE" "$p_file" || echo "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE_NULL")";
        local v_func; v_func="$([[ -f "$p_func" ]] && printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC" "$p_func" || echo "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC_NULL")";
        local v_line; v_line="$([[ -n "$p_line" ]] && printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE" "$p_line" || echo "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE_NULL")";

        #**** Code ****
		# Checking if the "$p_var_type" argument value matches an awaited pattern.
		# - array	: this variable is an array.
		# - code	: this variable stores code in order to perform an action (either a function, a command or a condition)
		# - dir		: this variable stores the name of a directory.
		# - file	: this variable stores the name of a file.
		# - float	: this variable stores a floating number.
		# - int		: this variable stores an integer.
		# - path:	: this variable stores a path.
		# - string	: this variable stores a string (other than the name of a directory or a file, or a path).
		if [ "${p_var_type,,}" != 'array' ]	\
			&& [ "${p_var_type,,}" != 'cmd' ] \
			&& [ "${p_var_type,,}" != 'bool' ] \
			&& [ "${p_var_type,,}" != 'dir' ] \
			&& [ "${p_var_type,,}" != 'file' ] \
			&& [ "${p_var_type,,}" != 'float' ]	\
			&& [ "${p_var_type,,}" != 'dirpath' ] \
			&& [ "${p_var_type,,}" != "filepath" ] \
			&& [ "${p_var_type,,}" != 'int' ] \
			&& [ "${p_var_type,,}" != 'path' ] \
			&& [ "${p_var_type,,}" != 'string' ]
			then
				p_var_type="unknown type";
		fi

        BU::ModuleInit::Msg;

		# Checking if the variable is an array.
		if [ "$p_var_type" = 'array' ]; then
            BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_ARRAY" "$p_var_name")" '-' 'msg';

		# Checking if the variable is not an array.
		else
            BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_NOT_ARRAY" "$p_var_name")" '-' 'msg';
		fi

		BU::ModuleInit::Msg;

		BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DESCRIPTION $p_var_desc";
		BU::ModuleInit::Msg;

		BU::ModuleInit::Msg "$v_file";
		BU::ModuleInit::Msg "$v_func";
		BU::ModuleInit::Msg "$v_line";

		if [ "${p_var_type,,}" = 'array' ]; then
            BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_TYPE";
            BU::ModuleInit::Msg;

    		# If a value or more are stored in the processed array.
			if [ -n "${pa_var_val_array[*]}" ]; then

                local v_index=0;

                for _ in "${pa_var_val_array[@]}"; do
                    BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_VALUE [$v_index] : $_";

                    # Line break every five lines, in order to keep the values list readable for a human.
                    local v_value_line=$(( v_index + 1 ));

                    if [ $(( v_value_line % 5 )) -eq 0 ]; then

                        # Avoid line breaks when the end of the array is reached, if it's last index's modulo of five is equal to 0.
                        if [ "$i" -eq "${pa_var_val_array[${#pa_var_val_array[@]} -1]}" ]; then BU::ModuleInit::Msg '' '-n';

                        else BU::ModuleInit::Msg;

                        fi
                    fi

                    v_index=$(( v_index+1 ));
                done;

                BU::ModuleInit::Msg;

                local v_index=0;

			else
				BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_EMPTY" '-' 'msg';
                BU::ModuleInit::Msg;
			fi
		else
            BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_TYPE" "$p_var_type")";
            BU::ModuleInit::Msg;

			# If a variable is stored in the processed variable.
			if [ -n "$p_var_val" ]; then

				if [ "${p_var_type,,}" = 'cmd' ]; then
					BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_CMD" "$p_var_name")";
				else
					BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_NOT_CMD" "$p_var_val")";
				fi

			else
				BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_EMPTY" '-' 'msg';
            fi

			BU::ModuleInit::Msg;

			return 0;
		fi
	else
		return 0;
    fi
}

# Handling the initializer's messages. In case of an error, there's no need to call this function, as the error messages MUST be displayed.
function BU::ModuleInit::Msg()
{
    #**** Parameters ****
    local p_str=$1;     # The string to display.
    local p_option=$2;  # The "echo" command's options.

    #**** Code ****
    # If the '--log-display' argument is passed as a 'module' parameter, then every messages must
    # be printed on the screen and redirected towards the "$__BU_MODULE_INIT_MSG_ARRAY" array.
    if [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=''; echo -ne '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT_DATE_LOG $p_str");

                    echo -ne "${p_str##* ] }"; fi;

					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('\n'); echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT_DATE_LOG $p_str\n");

                    echo -e "${p_str##* ] }"; fi;

					return 0;;
        esac

    # Else, if the '--log-shut' argument is passed as a 'module' parameter, then every initialization
    # messages must be redirected towards the "/dev/null" virtual device file, and the array must be emptied.
    elif [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-shut' ]; then
        return 0;

    # Else, if the '--log-shut-display' argument is passed as a 'module' parameter, then
    # every initialization messages must be redirected to the screen only, not to the array.
    elif [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-shut-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    echo -ne '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    echo -ne "$p_str"; fi

					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    echo -e "$p_str"; fi

					return 0;;
        esac

    # Else, if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable stores no value (empty by default), then every
    # initialization messages must be stored in the "$__BU_MODULE_INIT_MSG_ARRAY" array without being printed on the screen.
    elif [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('');

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT_DATE_LOG $p_str");

                    echo -ne "${p_str##* ] }"; fi;

					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('\n'); echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT_DATE_LOG $p_str\n"); fi

					return 0;;
        esac

    # Else, if an incorrect value is passed as "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable's value.
    else
        echo >&2; printf "$__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_1" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" >&2;
        echo >&2; echo "$__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_2" >&2;

        BU::ModuleInit::MsgAbort;

        BU::ModuleInit::AskPrintLog >&2;

        exit 1;
    fi

    return 0;
}

# Writing a text under a line with the same size.
function BU::ModuleInit::MsgLine()
{
    #**** Parameters ****
    local p_str=$1;     # String to display.
    local p_line=$2;    # Line character.
    local p_context=$3; # Context of the function's call (should it be processed by the "BU::ModuleInit::Msg" function or with a simple "echo" command ?).

    #**** Code ****
    if      [ "${p_context,,}" = 'echo' ]; then
        BU::ModuleInit::MsgLineCount "${#p_str}" "$p_line" 'echo';
        echo "$p_str";

    elif    [ "${p_context,,}" = 'msg' ]; then
        BU::ModuleInit::MsgLineCount "${#p_str}" "$p_line" 'msg';
        BU::ModuleInit::Msg "$p_str";

    else
        echo >&2; echo "TEST-MSGLINE" >&2; echo >&2; exit 1;
    fi

    return 0;
}

# Drawing a line with a character, that is the same lenght as a string, in order to separate the messagges from different steps.
function BU::ModuleInit::MsgLineCount()
{
    #**** Parameters ****
    local p_number=$1;  # Number of times the character has to be display.
    local p_line=$2;    # Line character.
    local p_context=$3; # Context of the function's call (should it be processed by the "BU::ModuleInit::Msg" function or with a simple "echo" command ?).

    #**** Code ****
    if      [ "${p_context,,}" = 'echo' ]; then
        for ((i=0; i<p_number; i++)); do echo -n "$p_line"; done; echo;

    elif    [ "${p_context,,}" = 'msg' ]; then
        for ((i=0; i<p_number; i++)); do BU::ModuleInit::Msg "$p_line" '-n'; done; BU::ModuleInit::Msg;

    else
        echo >&2; echo "TEST-MSGLINECOUNT" >&2; echo >&2; exit 1;
    fi

    return 0;
}

# Displaying a text when the script's execution must be stopped.
function BU::ModuleInit::MsgAbort() { echo >&2; echo "$__BU_MODULE_INIT_MSG__MSG_ABORT__ABORT" >&2; echo >&2; return 0; }

# Pressing any key on the keyboard to do an action.
function BU::ModuleInit::PressAnyKey() { echo; read -n 1 -s -r -p "$(printf "$__BU_MODULE_INIT_MSG__PRESS_ANY_KEY__PRESS %s" "$1")"; echo; return 0; }

# Printing the initialization on the screen. Although this function is called if the '--log-display' value is passed with the
# "module" argument, this function could be used as a help, in case this value's parameters doesn't work in case of a rework.
function BU::ModuleInit::PrintLog()
{
    #**** Variables ****
    local v_init_logs_str="$__BU_MODULE_INIT_MSG__PRINTLOG__INITLOGS";
    local v_tmp_file;
        v_tmp_file_original="$(echo "$RANDOM" | md5sum).tmp";

    shopt -s extglob;

    local v_tmp_file;
         v_tmp_file="${v_tmp_file_original%%+( - )}";   # Removing the extra whitespace with the dash.
    shopt -u extglob;

    #**** Code ****
    echo;

    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__PRINTLOG__HERE" '#' 'echo'; echo

    if [ "$__BU_MODULE_INIT_MSG_ARRAY_MODE" = '--mode-log-full' ]; then
        echo "$__BU_MODULE_INIT_MSG__PRINTLOG__FULL_MODE"; echo;

    elif [ "$__BU_MODULE_INIT_MSG_ARRAY_MODE" = '--mode-log-partial' ]; then
        echo "$__BU_MODULE_INIT_MSG__PRINTLOG__PARTIAL_MODE"; echo;
    fi

    BU::ModuleInit::MsgLine "$v_init_logs_str" '-' 'echo';
    BU::ModuleInit::MsgLineCount "${#v_init_logs_str}" '-' 'echo';
    BU::ModuleInit::Msg;

    BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE";
    BU::ModuleInit::Msg;

    BU::ModuleInit::PressAnyKey "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CALL_PRESS_ANY_KEY_FNCT";
    BU::ModuleInit::Msg;

    touch "$v_tmp_file" || { echo >&2; echo "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CANNOT_CREATE_TMP_FILE" >&2; echo >&2; return 1; };

    echo "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE" >> "$v_tmp_file";
    echo >> "$v_tmp_file";

    echo "$__BU_MODULE_INIT_MSG__PRINTLOG__DONT_PRESS_Q" >> "$v_tmp_file"
    echo >> "$v_tmp_file";
    echo >> "$v_tmp_file";

    for value in "${__BU_MODULE_INIT_MSG_ARRAY[@]}"; do
        # shellcheck disable=SC2059
        printf "${value##* ] }" >> "$v_tmp_file";
    done

    less "$v_tmp_file";

    rm "$v_tmp_file";

    echo; echo ">>>>> $__BU_MODULE_INIT_MSG__PRINTLOG__POST_DISPLAY_TEXT"; echo;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array, and it calls this function.

	return 0;
}

# Print an error message in the log storage variable.
function BU::ModuleInit::PrintLogError()
{
    #**** Parameters ****
    local p_desc=$1;    # Description of the error.
    local p_lineno=$2;  # Line where the error happened.

    #**** Code ****
    BU::ModuleInit::Msg >&2;

    BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__PRINTLOG_ERROR__PRINT_ERROR" "$p_desc" "$p_lineno")" '-' 'msg' >&2;

    BU::ModuleInit::Msg >&2;

    return 0;
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES INITIALIZATION

# Checking the currently used Bash language's version.
function BU::ModuleInit::CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS MODULES INITIALIZATION ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2;
		echo -e "This Bash library requires at least the Bash language's version 4.0.0" >&2;
		echo >&2;

		echo -e "Your Bash version is : $BASH_VERSION" >&2;
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library" >&2;
		echo >&2;

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
		exit 1;
	fi
}

# Check if the given path exists (This function is called by the "BU::ModuleInit::SourcingFailure()" function).
function BU::ModuleInit::CheckPath()
{
    #**** Parameters ****
    local p_path=$1;    # Path of the target file or directory.
    local p_target=$2;  # Specify if the target is a directory or a file.

    #**** Code ****
    if [ -z "$p_path" ]; then
        printf "« $__BU_MODULE_INIT_MSG__CHECKPATH__NO_FILE_PATH »" >&2; return 0;

    else
        if [ -z "$p_target" ]; then
            echo  >&2; printf "$__BU_MODULE_INIT_MSG__CHECKPATH__NO_TARGET_SPECIFICATION\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2;

            printf "$__BU_MODULE_INIT_MSG__CHECKPATH__PLEASE_SPECIFY_TARGET_SPECIFICATION" "${FUNCNAME[0]}" >&2; echo >&2; return 1;
        else
            if [[ "$p_target" = [D-d] ]]; then

                if [ -d "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;

                else
                    printf "%s $__BU_MODULE_INIT_MSG__CHECKPATH__DIR_NOT_FOUND" "$p_path" >&2; return 0;
                fi

            elif [[ "$p_target" = [F-f] ]]; then

                if [ -f "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;

                else
                    printf "%s $__BU_MODULE_INIT_MSG__CHECKPATH__FILE_NOT_FOUND" "$p_path" >&2; return 0;
                fi
            else
                echo >&2; printf "$__BU_MODULE_INIT_MSG__CHECKPATH__UNKNOWN_TARGET\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$p_target" >&2; echo >&2; return 1;
            fi
        fi
    fi
}

# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.
function BU::ModuleInit::FindPath()
{
	#	$1	--> Parent directory.
    #	$2	--> Targeted directory or file.
    find "$1" -maxdepth 1 -iname "$2" -print 2>&1 | grep -v "Permission denied" ||
	{
        if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_EXISTS" ]; then
            echo >&2; printf "$__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND --> %s/%s\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$1" "$2" >&2; echo >&2;

        else
            BU::ModuleInit::Msg >&2; BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND --> %s/%s\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$1" "$2")" >&2; BU::ModuleInit::Msg >&2;
        fi

        return 1;
	}; return 0;
}

# Getting the module's name from a subdirectory (this function is called in the main module's "module.conf" configuration file).
function BU::ModuleInit::GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" || { echo >&2; printf "$__BU_MODULE_INIT_MSG__GET_MODULE_NAME__UNABLE_TO_GET" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2; BU::ModuleInit::AskPrintLog >&2; exit 1; }; pwd -P)";

    echo "${v_module##*/}"; return 0;
}

# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.
function BU::ModuleInit::ListInstalledModules()
{
    #**** Variables ****
    local v_module_tmp_d="$__BU_MODULE_INIT_ROOT/tmp";

    local v_module_conf_f="$v_module_tmp_d/BU_modules_config_dir.out";
    local v_module_diff_f="$v_module_tmp_d/BU_modules_init_diff.out";
    local v_module_init_f="$v_module_tmp_d/BU_modules_init_dir.out";

    #**** Code ****
    if [ ! -d "$v_module_tmp_d" ]; then
        mkdir -p "$v_module_tmp_d" ||
		{
            BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__CALL_PLE" "$__BU_MODULE_INIT_ROOT")" "$LINENO";

			printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))" "$__BU_MODULE_INIT_ROOT" >&2; echo >&2;

			echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__ADVICE" >&2; echo >&2;

			BU::ModuleInit::AskPrintLog >&2; exit 1;
		}
    fi

    if [ -d "$__BU_MODULE_INIT_CONFIG_MODULES_DIR" ] && [ -d "$__BU_MODULE_INIT_MODULES_DIR" ]; then

																				# In case the "ls" command points towards a bad path because of a bad variable's value.
        ls -1 "$__BU_MODULE_INIT_CONFIG_MODULES_DIR"	> "$v_module_conf_f"    || { echo >&2; printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2; BU::ModuleInit::AskPrintLog >&2; exit 1; };
        ls -1 "$__BU_MODULE_INIT_MODULES_DIR"			> "$v_module_init_f"    || { echo >&2; printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2; BU::ModuleInit::AskPrintLog >&2; exit 1; };

        if diff "$v_module_conf_f" "$v_module_init_f" > "$v_module_diff_f"; then
            echo; echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INSTALLED_MODULES_LIST :"; echo; sleep ".5";

            # Displaying the content of the file which stores both the found modules configuration folders and the the modules initialization folders.
            cat "$v_module_conf_f"; echo; sleep 1;
        else
            echo >&2; printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__ONE_OR_MORE_MODULES_MISSING\n" "$__BU_MODULE_INIT_CONFIG_MODULES_DIR" "$__BU_MODULE_INIT_MODULES_DIR" >&2; echo >&2;

            echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_CONFIGURATION_FOLDER_LIST :" >&2; echo >&2;

            # Displaying the content of the file which stores the found modules configuration folders.
            cat "$v_module_conf_f" >&2; echo >&2;

            echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_INITIALIZATION_FOLDER_LIST :" >&2; echo >&2;

            # Displaying the content of the file which stores the found modules initialization folders.
            cat "$v_module_init_f"; echo >&2; echo >&2;

			# Getting the differences between the two files.
			echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__LISTED_MODULES_DIFFERENCES_BELOW" >&2; echo >&2;

			# Printing the differences between the two generated files.
			sdiff "$v_module_conf_f" "$v_module_conf_f"; echo >&2;
        fi
    else
        if [ ! -d "$__BU_MODULE_INIT_CONFIG_MODULES_DIR" ] && [ ! -d "$__BU_MODULE_INIT_MODULES_DIR" ]; then
            printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__BOTH_CONF_AND_INIT_FOLDER_ARE_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" >&2;

        elif [ -d "$__BU_MODULE_INIT_CONFIG_MODULES_DIR" ]; then
            echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__CONF_FOLDER_IS_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" >&2;

        elif [ -d "$__BU_MODULE_INIT_MODULES_DIR" ]; then
            echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INIT_FOLDER_IS_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" >&2;
        fi

		echo >&2;
    fi

	BU::ModuleInit::AskPrintLog;

    exit 1;
}

# Printing an error message if a file cannot be sourced.
function BU::ModuleInit::SourcingFailure()
{
    #**** Parameters ****
    local p_path=$1;    # Path of the file that cannot be sourced.
    local p_module=$2;  # Name of the module.

    #**** Code ****
    BU::ModuleInit::Msg >&2; BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__SOURCING_FAILURE__UNABLE_TO_SOURCE" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" "$p_module" "$(BU::ModuleInit::CheckPath "$p_path" 'f')" >&2; BU::ModuleInit::Msg >&2; BU::ModuleInit::AskPrintLog >&2; exit 1;
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES PROCESSING

# Usage function
function BU::ModuleInit::Usage()
{
	echo >&2; echo "$__BU_MODULE_INIT_MSG__USAGE__SUPVALS" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG";
	echo >&2;

	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_DISPLAY" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT_DISPLAY" >&2;
	echo >&2;

	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG";
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_FULL" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_PARTIAL" >&2;
}

# Processing the "module" value's parameters.
function BU::ModuleInit::ProcessFirstModuleParameters()
{
    #**** Parameters ****
    local p_module=$1;  # Mmodules to include passed as argument, with its own parameters.
    local p_count=$2;   # Counting the times the function was called in the "BashUtils_InitModules" function's main loop.

    #**** Variables ****
    local v_module_name;
        v_module_name="$(echo "$p_module" | cut -d' ' -f1)";

    #**** Code ****

    # -----------------------------------------------

    ## PROCESSING THE 'module' VALUE'S ARGUMENTS VALUES

    # Checking if the "module --" value is passed as first argument, in order to configure immediately the initialization language and the authorization to display the initialization logs on the screen.

    # These numbers stored in the "$p_count" variable refer to the modules indexes.
    if [ "$p_count" -eq 0 ]; then

        # If the "module" value is passed without parameters.
        if [[ "$p_module" == "$v_module_name" ]]; then
            BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__CALL_PLE\n" "${FUNCNAME[0]}")" "$(( LINENO - 1 ))";

            echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
            echo >&2; echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__ADVICE" >&2;

            BU::ModuleInit::MsgAbort;

            BU::ModuleInit::AskPrintLog; exit 1;

        elif [[ "$p_module" == 'module --'* ]]; then

            # Creating a new global variable to store the word array made with the "module" value and the values that come with it.
            read -ra module_array <<< "$p_module";

			# Unsetting the "module" value from the newly created array, in order to avoid an "unsupported argument" error.
			unset "module_array[0]";

            # -----------------------------------------------

            ## MODULE : DEFINING RESOURCES FOR THE « module » ARGUMENTS PROCESSING

            # Defining a function to optimize the displaying of errors for the 3 "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable's accepted values.
            function BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize()
            {
                #**** Parameters ****
                local p_value=$1;   # New value to assign to the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable.

                #**** Code ****
                # If the current value AND the new value are the same.
                if [ "$p_value" = "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
                    BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE__CALL_PLE" "${FUNCNAME[0]}")" "$p_value" "$(( LINENO - 1 ))";

                    echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))" "$p_value" >&2;

                    echo >&2; return 1;
                else
                    BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__CALL_PLE" "${FUNCNAME[0]}" "$p_value" "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION")" "$LINENO";

                    echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_1\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))" >&2; echo >&2;
                    echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_2" >&2; echo >&2

                    echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_EXTRA_INFO" >&2;

                    echo >&2;
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_CURRENT_VAL\n" "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" >&2;
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_NEW_VAL\n" "$p_value" >&2;

                    echo >&2; return 1;
                fi
            }

            # Processing the list of arguments for the "module" module.
            for module_args in "${module_array[@]}"; do

                # -----------------------------------------------

                ## MODULE : USER'S LANGUAGE PROCESSING

                # If the "module" value's argument is "--lang="
#                 if [[ "$module_args" == *'--lang='* ]]; then
#
#                     if [ -n "$__BU_MODULE_INIT_MODULE_LANG_ARG" ]; then
#                         BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : Another language added to the « module » value's arguments list (first : $__BU_MODULE_INIT_MODULE_LANG_ARG | New : $module_args)" "$LINENO";
#
#                         echo >&2; echo "In « ${BASH_SOURCE[0]} », line $(( LINENO-3 )) --> Warning : you already passed a language to the « module » argument list";
#                         echo "Please choose only one of these languages" >&2;
#                         echo >&2;
#
#                         echo "Current language : $__BU_MODULE_INIT_MODULE_LANG_ARG" >&2;
#                         echo "Chosen language : $module_args" >&2;
#                     else
#                         case "$module_args" in
#                             # Deutch | German
#                             'de_'[A-Z][A-Z])
#                                 # Erstellung einer neuen Variablen zur Speicherung der derzeit vom Betriebssystem verwendeten Sprache.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#
#                             # English
#                             'en_'[A-Z][A-Z])
#                                 # Creating a new variable to store the language currently used by the operating system.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#
#                             # Español | Spanish
#                             'es_'[A-Z][A-Z])
#                                 # Creación de una nueva variable para almacenar el idioma utilizado actualmente por el sistema operativo.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#
#                             # Français | French
#                             'fr_'[A-Z][A-Z])
#                                 # Création d'une nouvelle variable pour y enregistrer la langue actuellement utilisée par le système d'exploitation.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#                             *)
#                                 ;;
#                         esac
#                     fi

                # -----------------------------------------------

                ## MODULE : LOG MESSAGES PROCESSING

                # Else, if the "module" parameter's value is a log redirection parameter : '--log-display', '--log-shut' or '--log-shut-display'.

				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                if [[ "${module_args,,}" == *'--log-'* ]]; then

					case "${module_args,,}" in

						# Log value : --log-display (printing the initialization messages on the screen while they are appened to the "$__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-display')
							if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then

								# By default, the initialization process doesn't prints the log messages, unless there's an error (this printing cannot be avoided).
								# To print the initialization logs on the screen, you have to pass the '--log-display' argument when you pass the "module" value as first argument
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";

							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";

								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
							fi;;

						# Log value : --log-shut (don't print the initialization messages on the screen, nor append them into the "$__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-shut')
							if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then

								# If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_INIT_MSG_ARRAY" variable,
								# the existing logged messages will be erased, and no initialization messages will be displayed, unless it's an error message.
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";

								# Erasing the content of the "$__BU_MODULE_INIT_MSG_ARRAY" variable, since it's no more useful.
								unset __BU_MODULE_INIT_MSG_ARRAY;

							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";

								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";

								# Erasing the content of the "$__BU_MODULE_INIT_MSG_ARRAY" variable, since it's no more useful.
								unset __BU_MODULE_INIT_MSG_ARRAY;
							fi;;

						# Log value : --log-shut-display (print the initialization messages on the screen without appening them into the "$__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-shut-display')
							if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
								# If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_INIT_MSG_ARRAY" variable,
								# but all the log messages will be displayed on the screen.
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";

							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";

								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
							fi;;

						# An unsupported log argument is passed.
						*)
                            local v_unsupported_log_param;
                                v_unsupported_log_param="$(printf "%s" "$module_args" | sed "s/^[^ ]* //")";

							BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE" "${FUNCNAME[0]}" "$module_args")" "$(( LINENO - 3))";

							echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "$v_unsupported_log_param" >&2;
							echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__ADVICE\n" "$p_count" >&2;

							BU::ModuleInit::Usage;

							BU::ModuleInit::MsgAbort;

							BU::ModuleInit::AskPrintLog >&2; exit 1;;
					esac

                # -----------------------------------------------

                ## MODULE : MODES PROCESSING

				# Else, if the "module" parameter's value is a logging option : "--mode-log-full" or "--mode-log-partial".

				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                elif [[ "${module_args,,}" = '--mode-'* ]]; then

					case "${module_args,,}" in

						# Setting the "$__BU_MODULE_INIT_MSG_ARRAY_MODE" global variable to '--mode-log-full', in order to print every initialization messages, and not only the essential initialization messages.
						'--mode-log-full')
							__BU_MODULE_INIT_MSG_ARRAY_MODE="$module_args";

							# Displaying the initialization messages already appened in the "$__BU_MODULE_INIT_MSG_ARRAY" global variable.
							BU::ModuleInit::DisplayInitGlobalVarsInfos__DisplayInitializedGlobalVarsInfos;;

						# Setting the "$__BU_MODULE_INIT_MSG_ARRAY_MODE" global variable to '--mode-log-partial', in order to print the essential initialization messages only (already set by default).
						'--mode-log-partial')
							__BU_MODULE_INIT_MSG_ARRAY_MODE="$module_args";;

						# An unsupported mode argument is passed.
						*)
                            local v_unsupported_log_param;
                                v_unsupported_log_param="$(printf "%s" "$module_args" | sed "s/^[^ ]* //")";

							BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE" "${FUNCNAME[0]}" "$module_args")" "$(( LINENO - 3))";

							echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))" "$v_unsupported_log_param" >&2;
							echo >&2; echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__ADVICE\n" "$p_count" >&2;

							BU::ModuleInit::Usage;

							BU::ModuleInit::MsgAbort;

							BU::ModuleInit::AskPrintLog >&2; exit 1;;
					esac

                # -----------------------------------------------

                ## MODULE : HANDLING UNSUPPORTED ARGUMENTS

                # Else, if the "module" value's argument is not a supported one.
                else
                    local v_unsupported_log_param;
                        v_unsupported_log_param="$(printf "%s" "$module_args" | sed "s/^[^ ]* //")";

                    BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__CALL_PLE" "${FUNCNAME[0]}")" "$(( LINENO - 3 ))";

                    echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))" "$v_unsupported_log_param" >&2;
                    echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__ADVICE\n" "$p_count" >&2;

                    BU::ModuleInit::Usage;

                    BU::ModuleInit::MsgAbort;

                    BU::ModuleInit::AskPrintLog >&2; exit 1;
                fi
            done

            # Creating a global variable to store a value which proves that the 'module --*' value was passed as first argument, for the condition which checks if the 'main' module is passed as second argument.
            __BU_MODULE_INIT_MODULE_FIRST_ARG='true';

        fi

    # -----------------------------------------------

    ## MISSING 'main' MODULE AFTER THE 'module' VALUE

    # Else, if the the "module --" value is passed as first argument, but the "main" module is missing.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 1 ] && [ -z "$__BU_MODULE_INIT_MODULE_FIRST_ARG" ] && [[ "${p_module,,}" != 'main' ]] || [[ "${p_module,,}" != [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then
        BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__CALL_PLE" "${FUNCNAME[0]}")" "$LINENO";

        echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))" >&2;
        echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__ADVICE\n" "$v_module_name" "${FUNCNAME[0]}" >&2;

        BU::ModuleInit::MsgAbort;

        BU::ModuleInit::AskPrintLog >&2; exit 1;

    # -----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE AND THE 'main' MODULE PASSING

    # Else, if the "main" module is passed as second argument, after the "module" value.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 1 ] && [[ "${p_module,,}" == 'main' ]] || [[ "$p_module" == [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;

    # -----------------------------------------------

    ## 'module' VALUE NOT PASSED, BUT 'main' MODULE PASSED AS FIRST ARGUMENT

    # Else, if the "module --*" value is not passed as first argument.

    # Checking if the "main" module is passed as first argument, in order to avoid unexpected bugs during the other modules' initialization process.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 0 ] && [[ "${p_module,,}" == 'main' ]] || [[ "$p_module" == [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;

	# -----------------------------------------------

    ## 'Main' MODULE PASSED AS FIRST ARGUMENT, BUT BEFORE THE 'module' VALUE

	# Else, if the "main" module is passed as first argument, BUT before the "module --*" value.

	elif [ "$p_count" -ge 1 ] && [[ "${p_module,,}" == "module --"* ]]; then
		BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__CALL_PLE" "${FUNCNAME[0]}")" "$LINENO";

		echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
		echo >&2; echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__ADVICE" >&2;

        BU::ModuleInit::MsgAbort;

        BU::ModuleInit::AskPrintLog >&2; exit 1;

    # -----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE OR THE 'main' MODULE PASSING

    # Else, if the count is superior to 0 or 1, then the function'e execution is stopped.
    elif [ "$p_count" -ge 1 ]; then

        return 0;

    # -----------------------------------------------

    ## NO 'module' AND 'main' PASSED AS FIRST, THEN AS SECOND ARGUMENTS

    else
        BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__CALL_PLE\n" "${FUNCNAME[0]}")" "$LINENO";

        echo >&2; printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
        echo >&2; echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__ADVICE" >&2;

        BU::ModuleInit::MsgAbort;

        echo >&2; BU::ModuleInit::AskPrintLog >&2; return 1;
    fi

    return 0;
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BEGIN INITIALIZATION PROCESS

## CHECKING IF THE CURRENT SHELL IS BASH

if ! ps -a | grep -E "$$" | grep "bash" > /dev/null; then
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'de' ] && echo "BASH-UTILS ERROR : Ihr aktueller Shell-Interpreter ist nicht der « Bash » Interpreter, sondern der « ${SHELL##*/} » Interpreter" >&2 && echo >&2;
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'en' ] && echo "BASH-UTILS ERROR : Your current shell interpreter is not the « Bash » interpretor, but the « ${SHELL##*/} » interpretor" >&2 && echo >&2;
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'es' ] && echo "ERROR BASH-UTILS : Su intérprete de shell actual no es el intérprete « Bash », sino el intérprete « ${SHELL##*/} »" && echo >&2;

    [ "$(echo "$LANG" | cut -d _ -f1)" = 'fr' ] && echo "ERREUR DE BASH-UTILS : Votre interpréteur shell actuel n'est pas l'interpréteur « Bash », mais l'interpréteur « ${SHELL##*/} »" >&2 echo >&2;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
    exit 1;
fi

# -----------------------------------------------

## DEFINING GLOBAL VARIABLES

__BU_MODULE_INIT_PROJECT_PID="$$";  __bu_module_init_project_pid_lineno="$LINENO";

__BU_MODULE_INIT_ROOT_HOME="$HOME"; __bu_module_init_root_home_lineno="$LINENO";

if [ -d "$__BU_MODULE_INIT_ROOT_HOME/.Bash-utils" ]; then
    __BU_MODULE_INIT_ROOT="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_ROOT_HOME" ".Bash-utils")";                                    __bu_module_init_root_lineno="$LINENO";

    # shellcheck disable=SC2034
    __BU_MODULE_INIT_INITIALIZER_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_ROOT_HOME" "$(basename "${BASH_SOURCE[0]}")")";    __bu_module_init_initializer_path_lineno="$LINENO";

    # Configurations directories
    __BU_MODULE_INIT_CONFIG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_ROOT" "config")";                        __bu_module_init_config_dir_lineno="$LINENO";
    __BU_MODULE_INIT_CONFIG_INIT_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CONFIG_DIR" "initializer")";        __bu_module_init_config_init_dir_lineno="$LINENO",
    __BU_MODULE_INIT_CONFIG_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CONFIG_DIR" "modules")";         __bu_module_init_config_modules_dir_lineno="$LINENO";

    __BU_MODULE_INIT_CONFIG_INIT_LANG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CONFIG_INIT_DIR" "locale")";   __bu_module_init_config_init_lang_dir_lineno="$LINENO";

    # Modules directories
    __BU_MODULE_INIT_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_ROOT" "modules")"; __bu_module_init_modules_dir_lineno="$LINENO";

    # Files
    __BU_MODULE_INIT_LIB_ROOT_DIR_FILE_NAME="Bash-utils-root-val.path";                                                                 __bu_module_init_lib_root_dir_file_name_lineno="$LINENO";
    __BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PARENT_DIR="$__BU_MODULE_INIT_ROOT";                                                             __bu_module_init_lib_root_dir_file_parent_dir_lineno="$LINENO";
    __BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PATH="$__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_PARENT_DIR/$__BU_MODULE_INIT_LIB_ROOT_DIR_FILE_NAME";  __bu_module_init_lib_root_dir_file_path_lineno="$LINENO";

	__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_NAME="Bash-utils-root-val-ROOT.path";                                                                      __bu_module_init_lib_root_dir_root_file_name_lineno="$LINENO";
	__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="$__BU_MODULE_INIT_ROOT";                                                                       __bu_module_init_lib_root_dir_root_file_parent_dir_lineno="$LINENO";
	__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PATH="$__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR/$__BU_MODULE_INIT_LIB_ROOT_DIR_ROOT_FILE_NAME";  __bu_module_init_lib_root_dir_root_file_path_lineno="$LINENO";

	# Misc
	__BU_MODULE_INIT_CSV_TRANSLATION_FILE_DELIM='˥';               __bu_module_init_csv_translation_file_delim_lineno="$LINENO";
	__BU_MODULE_INIT_DATE_LOG="[ $(date +"%Y-%m-%d %H:%M:%S") ]";  __bu_module_init_date_log_lineno="$LINENO";
	__BU_MODULE_INIT_USER_LANG="$(echo "$LANG" | cut -d _ -f1)";   __bu_module_init_user_lang_lineno="$LINENO";
else
    # Setting the whole project's language by getting and sourcing the "gettext.sh" file.
    BU::ModuleInit::GetModuleInitLanguage "$__BU_MODULE_INIT_USER_LANG";

	echo >&2; printf "$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_ERROR\n" >&2; echo >&2;

	echo "$__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER" >&2; echo >&2;
	echo "$__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER__ADVICE" >&2; echo >&2;

	BU::ModuleInit::MsgAbort;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
	exit 1;
fi

# -----------------------------------------------

## CALLING THE NEEDED FUNCTIONS (DEFINED IN THIS FILE) THAT MUST BE CALLED BEFORE INITIALIZING THE FIRST GLOBAL VARIABLES

# THIS FUNCTION (BU::ModuleInit::GetModuleInitLanguage()) MUST BE THE FIRST FUNCTION TO BE CALLED !!!!

# Since this function gets the language currently used by the system, if you want to change the language, you just have to define
# a new value to the "$LANG" environment variable before calling the "BashUtils_InitModules()" function in your main script file.

# Setting the whole project's language by getting and sourcing the "gettext.sh" file.
BU::ModuleInit::GetModuleInitLanguage "$__BU_MODULE_INIT_USER_LANG";

# Checking the currently used Bash language's version.
BU::ModuleInit::CheckBashMinimalVersion;

# -----------------------------------------------

## DEFINING NEW GLOBAL VARIABLES TO STORE THE INITIALIZATION LOGS AND DISPLAY THEM OR NO

# NOTE : The redirections are processed by the "BU::ModuleInit::Msg" function.

# This global variable stores the log messages.
declare __BU_MODULE_INIT_MSG_ARRAY=();

# This global variables stores a random text. It's enough to determine if the messages can be printed and / or stored in the "$__BU_MODULE_INIT_MSG_ARRAY" array with the "BU::ModuleInit::Msg" function.
declare __BU_MODULE_INIT_MSG_ARRAY_EXISTS="$((RANDOM % 255))";

# This global variable stores the processing mode (partial or full).

# By default, it stores the '--mode-log-partial' value, in order to avoid the initialization process being too much verbose.
declare __BU_MODULE_INIT_MSG_ARRAY_MODE='--mode-log-partial'

# This global variable stores the value (given in the "BashUtils_InitModules()" function's main loop)
# which authorizes the displaying of the logs messages on the screen.

# By default, it stores no value, so that the messages are redirected to the "$__BU_MODULE_INIT_MSG_ARRAY" only,
# without being redirected to the screen too (these instructions are processed in the "BU::ModuleInit::Msg" function).
declare __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='';

# -----------------------------------------------

## CALLING THE OTHER FUNCTIONS FOR INITIALIZATION

# Writing the initialization content into the messages array. It will be displayed later on the screen if the « --log-init-display » argument is passed with the « module » argument.
__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MSG_INITIALIZING_THE_MODULES")");
__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SOURCING THE MODULES

## INCLUSION OF LIBRARY FILES ACCORDING TO THE INCLUDED MODULE

# Parsing each module's translation CSV file.

# CSV delimiter : ˥ (Unicode symbol U+02E5).

# The "BU::ModuleInit::ParseCSVLang" function MUST be called in the current module's initialization script.

# IMPORTANT : It MUST be called AFTER the "BU::Main::Initializer::SourceLibrary" and BEFORE the "BU::Main::Initializer::SourceConfig"
# functions in the main module's initialization file, in the "STEP THREE" sub-section, in order to get the main module's functions and
# to translate the global variables descriptions written with the "BU::ModuleInit::DisplayInitGlobalVarsInfos" function.
function BU::ModuleInit::ParseCSVLang()
{
    #**** Parameters ****
    local p_path=$1;                                    # String    - Default : NULL                            - Path of the translations CSV file to parse.
    local p_lang=${2:-$__BU_MODULE_INIT_USER_LANG};     # String    - Default : $__BU_MODULE_INIT_USER_LANG     - Language to fetch.
    local p_delim=$3;                                   # Char      - Default : NULL                            - CSV file's delimiter.

    #**** Variables ****
    local v_filename="$__BU_MODULE_INIT_MODULE_NAME-$__BU_MODULE_INIT_USER_LANG.csv";
    local v_CSVFirstColRow="$(BU::Main::Text::GetSubStringBeforeDelim "$(awk 'NR == 1 {print $1}' "$p_path")" "$p_delim")"

    # Getting the total number of columns.
    local x;

    #**** Code ****
    # Note : if the file cannot be obtained, or if there is another error during the parsing of the current module's translations CSV file,
    # then the script's execution MUST be stopped, or else no messages will be printed on the screen while the script is executed.

    # If no path to the module's translation CSV file is given.
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Errors::HandleErrors '1' "NO PATH TO THE $__BU_MODULE_INIT_MODULE_NAME MODULE'S TRANSLATION FILE WAS GIVEN" \
            "Please give a valid path to the current module's translations CSV file" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; exit 1;
    fi

    # If a path to the module's translation CSV was given, but doesn't matches to a valid file path.
    if [ -n "$p_path" ] && [[ "$p_path" != *"/$v_filename" ]]; then local lineno="$LINENO";
        BU::Main::Errors::HandleErrors '1' "THE GIVEN PATH TO $__BU_MODULE_INIT_MODULE_NAME THE TRANSLATION FILE IS NOT VALID" \
            "Please give a valid path to the current module's translations CSV file" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; exit 1;
    fi

    # If no language is specified, the system's language or the redefined "$LANG" environment variable's ISO 639-1 language code will be used.
    if [ -z "$p_lang" ]; then
        p_lang="$__BU_MODULE_INIT_USER_LANG";
    fi

    # If no delimiter is given.
    if [ -z "$p_delim" ]; then local lineno="$LINENO";
        BU::Main::Errors::HandleErrors '1' "NO DELIMITER WAS GIVEN FOR THE CSV FILE" \
            "Please give a single unicode character as CSV delimiter in order to get each wanted cell" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; exit 1;
    fi

    if [ -n "$p_delim" ] && [ "${#p_delim}" -gt 1 ]; then
        BU::Main::Errors::HandleErrors '1' "THE GIVEN DELIMITER MUST BE A SINGLE UNICODE CHARACTER" \
            "Please give a single unicode character as valid CSV delimiter in order to get each wanted cell" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; exit 1;
    fi

    # Begin parsing the CSV file.
    BU::HeaderBlue "PARSING THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") PROJECT'S $(BU::DechoHighlight "$p_path") TRANSLATIONS CSV FILE";

    BU::EchoNewstep "Finding the variables list column";
    BU::Newline;

    if [ "$v_CSVFirstColRow" != "VARIABLE" ]; then
        BU::Main::Errors::HandleErrors '1' "NO $(BU::DechoHighlight "VARIABLE") VALUE FOUND AT THE FIRST COLUMNN AND FIRST ROW OF THE $(BU::DechoHighlightPath "$p_path")" \
            "Make sure the current module's CSV translations file is correctly formatted [/|\] You can check the main module's CSV file to check how the formatting should be done" \
            "$v_CSVFirstColRow" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; exit 1;
    else
        BU::EchoNewstep "Parsing the $(BU::DechoHighlightPath "$p_path") translations file";
        BU::Newline;

        BU::EchoNewstep "Getting the chosen language's row (current language : $(BU::DechoHighlight "$__BU_MODULE_INIT_USER_LANG"))";
        BU::Newline;

        # Getting the total number of columns.
        x="$(awk -F, '{ print NF; exit }' "$p_path")";

        # Getting the langage ISO 639-1 code from the first row.
        awk -v col="${x}" '
            function BU::ModuleInit::GetCSVRowWithAWK(col)
            {

            }
        '
    fi


    return 0;
}

# Please call immediately this function once this file is sourced, and pass it each module you need as arguments, and their supported options.
function BashUtils_InitModules()
{
    if [ -n "$__BU_MODULE_INIT_IS_SOURCED" ] && [ "sourced" = "$__BU_MODULE_INIT_IS_SOURCED" ]; then
        BU::HeaderWarning "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED\n" "$(BU::DechoHighlightFunction "${FUNCNAME[0]}")")"; return 1;
    fi

    #**** Parameters ****
    local p_modules_list=("$@");    # List of all the modules to include passed as arguments

	#**** Variables (global) ****

	#**** Variables (local) ****
    local v_index=0;        # Index of the currently processed module (incremented at each loop's iteration). ALWAYS BEGIN WITH THE '0' VALUE !!!

	#**** Code ****
	# Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then
		printf "$__BU_MODULE_INIT_MSG__BU_IM__MUST_PASS_A_MODULE_NAME\n\n" "${FUNCNAME[0]}" >&2; return 1
	fi

    # Writing the list of the installed modules.
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG")");
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");

    # Listing the included modules.
	for module_args in "${p_modules_list[@]}"; do
        i=0; # Module's array index incrementer.

        if [[ "${module_args,,}" == 'module --'* ]]; then
            __BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_MODULE_PARAM" "$i" "$module_args")")");
        else
            i="$(( i+1 ))" # Incrementing the module's array index

            # Name and arguments of the module stored as the nth index of the module list array.
            __BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_NOT_MODULE_PARAM" "$i" "$module_args")")");
        fi
	done

	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");

	# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
	for module in "${p_modules_list[@]}"; do

		# -----------------------------------------------

		## INITIALIZER'S FIRST ARGUMENTS PROCESSING ("module --*" AND "main --*" VALUES)

		# Calling the function which processes the « module » argument and its parameters, along with the « main » module.
        BU::ModuleInit::ProcessFirstModuleParameters "$module" "$v_index";

		# -----------------------------------------------

		## DEFINING LOCAL VARIABLES FOR EACH MODULE TO BE INITIALIZED

		# Defining variables for each iteration.
		local v_module_name;
            v_module_name="$(echo "$module" | cut -d' ' -f1)";

		# -----------------------------------------------

		## DEFINING GLOBAL VARIABLES FOR EACH MODULE TO BE INITIALIZED

		__BU_MODULE_INIT_MODULE_NAME="$v_module_name";

		# Getting the current module's configurations directory AND its initialization directory (the "module --"* value is NOT a module).
		if [[ "$module" != 'module --'* ]]; then

            # Getting the current module's configurations directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CONFIG_MODULES_DIR" "$v_module_name")";

            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH' "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH" 'Dirpath' \
                "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__CONF_PATH__DIGVI" "$v_module_name" "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH")" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";


            # Getting the current module's initialization directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_MODULES_DIR" "$v_module_name")";

            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH' "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH" 'Dirpath' \
                "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INIT_PATH__DIGVI" "$v_module_name" "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH")" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
        fi

		# Storing the module's name with it's arguments, in order to transform it in an array of strings to be processed in this loop (for each module, in their "initializer.sh" file).
		if [[ "${p_modules_list[i]}" == "$v_module_name --"* ]]; then

            # shellcheck disable=SC2034
			__BU_MODULE_INIT_MODULE_AND_ARGS_STRING="$module";

			BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_MODULE_AND_ARGS_STRING' "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING" 'String' \
				"$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__NAME_WITH_ARGS" "${FUNCNAME[0]}" "${#p_modules_list}" "$module")" \
				"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
		fi

        # Checking for each module's files if the currently processed "BashUtils_InitModules" argument is not "module" (already processed in the "BU::ModuleInit::ProcessFirstModuleParameters()" function).
        if [[ "$module" != 'module --'* ]]; then

            # -----------------------------------------------

            # MODULES' CONFIGURATION FILES SOURCING

            # Checking if the module's configuration directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH"; then
                BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__CALL_PLE" "$v_module_name")" "$LINENO";

                printf '\n' >&2;

                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND\n\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "$v_module_name" >&2;

                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__ADVICE" >&2; BU::ModuleInit::CheckPath "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH" 'f' >&2;
                printf '\n\n';

                # Listing all the installed modules in the user's hard drive.
                # No need to call the function "BU::ModuleInit::AskPrintLog" function, it's already called in the function "BU::ModuleInit::ListInstalledModules".
                BU::ModuleInit::ListInstalledModules;

                return 1;
            else
                BU::ModuleInit::Msg;
                BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__SOURCE" "$v_module_name")" '#' 'msg'; BU::ModuleInit::Msg;

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH" "module.conf")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH/module.conf" "$v_module_name"; exit 1; }
            fi

            # -----------------------------------------------

            # MODULES' INITIALIZATION FILES SOURCING

            # Checking if the module's initialization directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH"; then
                BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__CALL_PLE" "$v_module_name")" "$LINENO";

                printf '\n' >&2;

                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND\n\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "$v_module_name" >&2;

                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__ADVICE"; BU::ModuleInit::CheckPath "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH" 'f' >&2;
                printf '\n\n' >&2;

                BU::ModuleInit::MsgAbort;

                return 1;
            else
                BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__SOURCE" "$v_module_name")" '-' 'msg';

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH" "Initializer.sh")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH/Initializer.sh" "$v_module_name"; exit 1; }

                BU::HeaderGreen "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__END_OF_MODULE_INIT" "$(BU::DechoHighlight "$v_module_name")")";
            fi
        fi

        # Incrementing the modules array index variable.
        v_index="$(( v_index+1 ))";

	done;

	echo "RETURN STATUS : $?";

	# /////////////////////////////////////////////////////////////////////////////////////////////// #

	#### ENDING THE WHOLE INITIALIZATION PROCESS

	BU::HeaderGreen "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__END_OF_FRAMEWORK_INIT" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_FILE_PATH" "$__BU_MAIN_COLOR_TXT_PATH")")";

	# This is the ONLY line where the "$__BU_MAIN_STAT_INITIALIZING" global status variable's value can be modified.
	# DO NOT set it anymore to "true", or else your script can be prone to bugs.
    if  BU::Main::Status::CheckStatIsInitializing; then
        BU::Main:Status::ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
	fi

	# Note : the "$__BU_MODULE_INIT_MSG_ARRAY" variable is purged from the logged messages after writing its content in the project's log file.

	# Setting a global variable that prevent a new call of this function.
	__BU_MODULE_INIT_IS_SOURCED='sourced';

	return 0;
}
