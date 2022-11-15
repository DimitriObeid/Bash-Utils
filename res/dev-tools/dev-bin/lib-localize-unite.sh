#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL VARIABLES DEFINITION #############################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# Authorization to delete the generated file.
__BU_ARG_RM="$1";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

## PATHS

# Getting the path of the library's root path from the path file.
if [ -d '/usr/local/lib/Bash-utils' ]; then __BU_ROOT_PATH='/usr/local/lib/Bash-utils';

elif [ -d "$HOME/.Bash-utils/Bash-utils" ]; then __BU_ROOT_PATH="$HOME/.Bash-utils/Bash-utils";

else __BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")";

fi

# Path of the modules initializer file.
__BU_MAIN_FULL_FILE_PATH="$__BU_ROOT_PATH/Bash-utils.sh";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_CONFIGS_PATH="$__BU_ROOT_PATH/install/.Bash-utils/config/initializer";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_TRANSLATIONS_PATH="$__BU_MODULE_INIT_CONFIGS_PATH/locale";

# -----------------------------------------------

## COLORS

# Defining some colors for the text decoration.
__CYAN="$(tput setaf 51)";

__GREEN=$(tput setaf 2);

__ORANGE=$(tput setaf 166);

__RED=$(tput setaf 9);

__RESET=$(tput sgr0);

__YELLOW=$(tput setaf 11);

# -----------------------------------------------

## MESSAGE TRANSLATIONS

# FRENCH - FRANÇAIS
if [[ "$LANG" = fr_* ]]; then
    __BU_COMPILE__SHELLCHECK_MISSING="${__RED}LA COMMANDE ${__CYAN}SHELLCHECK${__RED} N'EST PAS INSTALLÉE SUR VOTRE SYSTÈME !${__RESET}";
    __BU_COMPILE__SHELLCHECK__VERIFICATION="${__ORANGE}Vérification d'erreurs de programmation dans le fichier ${__CYAN}%s${__ORANGE}${__RESET}";
    __BU_COMPILE__SHELLCHECK__FAIL="${__RED}Une ou plusieurs erreurs de programmation ont été détectées dans le fichier ${__CYAN}%s${__RED} !${__RESET}";
    __BU_COMPILE__SHELLCHECK__SUCCESS="${__GREEN}Le fichier ${__CYAN}%s${__GREEN} ne contient aucune erreur de programmation";

    __BU_COMPILE__BAD_LANGUAGE_PASSED="${__RED}Un code de langue ISO 639-1 non-supporté a été passé en premier argument de la fonction ${__CYAN}CompileInSingleFile()${__RED} !${__RESET}";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de traduction du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's translations files content first into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__CYAN}%s${__ORANGE} DANS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__CYAN}%s${__RED} DANS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__CYAN}%s${__GREEN} DANS LE FICHIER ${__CYAN}%s${__GREEN}";

    #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichier de librairie du module principal dans le fichier à générer [-----] Writing the main module's library files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE LIBRAIRIE DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE LIBRAIRIE DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE LIBRAIRIE DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__GREEN}";

    # ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de configuration du module principal dans le fichier à générer [-----] Writing the main module's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__GREEN}";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu du script d'initialisation du module principal dans le fichier à générer [-----] Writing the main module's initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT="COPIE DU CONTENU DU SCRIPT D'INITIALISATION DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DU MODULE PRINCIPAL DANS LE FICHIER ${__CYAN}%s${__GREEN}";

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de configuration du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__CYAN}%s${__GREEN}";

    # ----------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT="COPIE DU CONTENU DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__CYAN}%s${__GREEN}";

# -------------------------------------------------------------------------------
# SINCE NO OTHER LANGUAGES ARE SUPPORTED, ENGLISH IS SET AS THE DEFAULT LANGUAGE.
# -------------------------------------------------------------------------------
else
    __BU_COMPILE__SHELLCHECK_MISSING="${__RED}THE ${__CYAN}SHELLCHECK${__RED} COMMAND IS NOT INSTALLED ON YOUR SYSTEM!${__RESET}";
    __BU_COMPILE__SHELLCHECK__VERIFICATION="${__ORANGE}Verifying the programming errors in the ${__CYAN}%s${__ORANGE} file${__RESET}";
    __BU_COMPILE__SHELLCHECK__FAIL="${__RED}One or more programming errors were detected in the ${__CYAN}%s${__RED} file!${__RESET}";
    __BU_COMPILE__SHELLCHECK__SUCCESS="${__GREEN}The ${__CYAN}%s${__GREEN} file doen't contain any programming errors${__RESET}";

    __BU_COMPILE__BAD_LANGUAGE_PASSED="${__RED}An unsupported language ISO 639-1 code was passed as ${__CYAN}CompileInSingleFile()${__RED} function's first argument ${__RESET}";

    # --------------------------------------------------------------------------------------------
    # Writing the initializer script's translations files content first into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT="COPYING THE INITIALIZER SCRIPT'S TRANSLATIONS FILES CONTENT FROM THE ${__CYAN}%s${__ORANGE} LANGUAGE INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S TRANSLATIONS FILES FROM THE ${__CYAN}%s${__RED} LANGUAGE INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S TRANSLATIONS FILES FROM THE ${__CYAN}%s${__GREEN} LANGUAGE INTO THE ${__CYAN}%s${__GREEN} FILE";

    # --------------------------------------------------------------------------
    # Writing the main module's library files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT="COPYING THE MAIN MODULE'S LIBRARY FILES CONTENT INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR="FAILED TO COPY THE MAIN MODULE'S LIBRARY FILES CONTENT INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE MAIN MODULE'S LIBRARY FILES CONTENT INTO THE ${__CYAN}%s${__GREEN} FILE";

    # --------------------------------------------------------------------------------
    # Writing the main module's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT="COPYING THE MAIN MODULE'S CONFIGURATION FILES CONTENT INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR="FAILED TO COPY THE MAIN MODULE'S CONFIGURATION FILES CONTENT INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE MAIN MODULE'S CONFIGURATION FILES CONTENT INTO THE ${__CYAN}%s${__GREEN} FILE";

    # ---------------------------------------------------------------------------------
    # Writing the main module's initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT="COPYING THE MAIN MODULE'S INITIALIZER SCRIPT'S CONTENT INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR="FAILED TO COPY THE MAIN MODULE'S INITIALIZER SCRIPT'S CONTENT INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE MAIN MODULE'S INITIALIZER SCRIPT'S CONTENT INTO THE ${__CYAN}%s${__GREEN} FILE";

    # ---------------------------------------------------------------------------------------
    # Writing the initializer script's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT="COPYING THE INITIALIZER SCRIPT'S CONFIGURATION files CONTENT INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S CONFIGURATION files CONTENT INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S CONFIGURATION files CONTENT INTO THE ${__CYAN}%s${__GREEN} FILE";

    # -------------------------------------------------------------------
    # Writing the initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT="COPYING THE INITIALIZER SCRIPT'S CONTENT INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S CONTENT INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S CONTENT INTO THE ${__CYAN}%s${__GREEN} FILE";
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINITION

# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)"

	for _ in $(eval echo -e "{1..$__cols}"); do
            printf '-';
    done; printf "\n";
}

# Printing an error line.
function PrintErrorLine()   { echo >&2; printf "%s" "$__RED"; PrintLine; printf "%s" "$__RESET"; echo "${__RED}$1${__RESET}"; printf "%s" "$__RED"; PrintLine; printf "%s" "$__RESET"; echo >&2; }

# Printing a newstep line.
function PrintNewstepLine() { echo; printf "%s" "$__ORANGE"; PrintLine; printf "%s" "$__RESET"; echo "${__ORANGE}$1${__RESET}"; printf "%s" "$__ORANGE"; PrintLine; printf "%s" "$__RESET"; echo; }

# Printing a success line.
function PrintSuccessLine   { echo; printf "%s" "$__GREEN"; PrintLine; printf "%s" "$__RESET"; echo "${__GREEN}$1${__RESET}"; printf "%s" "$__GREEN"; PrintLine; printf "%s" "$__RESET"; echo; }

# Converts a byte count to a human readable format in IEC binary notation (base-1024 (eg : GiB)), rounded to two
# decimal places for anything larger than a byte. Switchable to padded format and base-1000 (eg : MB) if desired.

# Initial source of this AWK script (since it's not mine and I added more informations as comments) :
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BytesToHuman()
{
    #**** Parameters ****
    local L_BYTES="${1:-0}";    # Int       - Default : 0       - Raw size in bytes.
    local L_PAD="${2:-no}";     # String    - Default : "no"    - Allow result display padding.
    local L_BASE="${3:-1024}";  # Int       - Default : 1024    - Base (1000 (metric) or 1024 (binary notation))

    #**** Code ****
    # Creating a command substitution to calculate the byte count according to the values passed as arguments, with an AWK script.
    local BYTESTOHUMAN_RESULT; BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" 'function human(x, pad, base) {

        # If the desired base format is not the binary prefix, then the base format used will be the metric one.
         if(base!=1024)base=1000

        # Ternary condition : if the base format uses the binary prefix, then the "iB" ([prefix]bibyte) unit is displayed after the value. Else the "[prefix]byte" unit is displayed after the value.
         basesuf=(base==1024)?"iB":"B"

        # Setting the prefixes list (K = kilo, M = mega, G = giga, T = tera, P = peta, E = exa, Z = zeta, Y = yotta), and corrected the inversion of the Exa with Peta, and Zeta with Yotta.
         s="BKMGTPEZY"

        # While the "x" ("human" function first parameter value) is superior or equal to the "base" (human function third parameter value) AND
         while (x>=base && length(s)>1)
               {x/=base; s=substr(s,2)}
         s=substr(s,1,1)

         xf=(pad=="yes") ? ((s=="B")?"%5d   ":"%8.2f") : ((s=="B")?"%d":"%.2f")
         s=(s!="B") ? (s basesuf) : ((pad=="no") ? s : ((basesuf=="iB")?(s "  "):(s " ")))

         return sprintf( (xf " %s\n"), x, s)
      }
      BEGIN{print human(bytes, pad, base)}')

    printf "%s" "$BYTESTOHUMAN_RESULT";

    return 0;
}

# Verifying the list of every ISO 639-1 language codes.
function CheckISO639_1_LangCode()
{
    #**** Parameters ****
    local p_code=${1:-NULL};    # String    - Default : NULL    - Language in which the file must be translated.

    #**** Variables ****
    local va_langArray=('ab' 'aa' 'af' 'ak' 'sq' 'am' 'ar' 'an' 'hy' 'as' 'av' 'ae' 'ay' 'az' 'bm' 'ba' 'eu' 'be' 'bn' 'bi' 'bs' 'br' 'bg' 'my' 'ca' 'ch' \
                        'ce' 'ny' 'zh' 'cu' 'cv' 'kw' 'co' 'cr' 'hr' 'cs' 'da' 'dv' 'nl' 'dz' 'en' 'eo' 'et' 'ee' 'fo' 'fj' 'fi' 'fr' 'fy' 'ff' 'gd' 'gl' \
                        'lg' 'ka' 'de' 'el' 'kl' 'gn' 'gu' 'ht' 'ha' 'he' 'hz' 'hi' 'ho' 'hu' 'is' 'io' 'ig' 'id' 'ia' 'ie' 'iu' 'ik' 'ga' 'it' 'ja' 'jv' \
                        'kn' 'kr' 'ks' 'kk' 'km' 'ki' 'rw' 'ky' 'kv' 'kg' 'ko' 'kj' 'ku' 'lo' 'la' 'lv' 'li' 'ln' 'lt' 'lu' 'lb' 'mk' 'mg' 'ms' 'ml' 'mt' \
                        'gv' 'mi' 'mr' 'mh' 'mn' 'na' 'nv' 'nd' 'nr' 'ng' 'ne' 'no' 'nb' 'nn' 'ii' 'oc' 'oj' 'or' 'om' 'os' 'pi' 'ps' 'fa' 'pl' 'pt' 'pa' \
                        'qu' 'ro' 'rm' 'rn' 'ru' 'se' 'sm' 'sg' 'sa' 'sc' 'sr' 'sn' 'sd' 'si' 'sk' 'sl' 'so' 'st' 'es' 'su' 'sw' 'ss' 'sv' 'tl' 'ty' 'tg' \
                        'ta' 'tt' 'te' 'th' 'bo' 'ti' 'to' 'ts' 'tn' 'tr' 'tk' 'tw' 'ug' 'uk' 'ur' 'uz' 've' 'vi' 'vo' 'wa' 'cy' 'wo' 'xh' 'yi' 'yo' 'za' 'zu')

    #**** Code ****
    [[ ${va_langArray[*]} =~ ${p_code,,} ]] && return 0; return 1;
}

# Writing the error message if a Shellcheck verification failed.
function ShellcheckError()
{
    #**** Parameters ****
    local p_path=${1};  # String    - Default : NULL    - Path of the file whose Shellcheck verification failed.

    #**** Code ****
    echo >&2;

    # shellcheck disable=SC2059
    "$(printf "$__BU_COMPILE__SHELLCHECK__FAIL" "$p_path")"; echo >&2; return 0;
}

# Verifying any programming errors with the Shellcheck command.
function ShellcheckVerif()
{
    #**** Parameters ****
    local p_path=${1};  # String    - Default : NULL    - Path of the file to verify.

    #**** Code ****
    # shellcheck disable=SC2059
    printf "$__BU_COMPILE__SHELLCHECK__VERIFICATION" "$p_path"; echo;

    if ! shellcheck "$p_path"; then ShellcheckError "$p_path"; return 1; fi

    # shellcheck disable=SC2059
    printf "$__BU_COMPILE__SHELLCHECK__SUCCESS" "$p_path"; echo;

    echo;

    return 0;
}

# Writing the target file's content into the file to generate.
function WriteBU()
{
    #**** Parameters ****
    local p_content=${1:-\$'0'} # String    - Default : NULL    -
    local p_display=${2:-no};   # String    - Default : no      - Display the content of each file when it is read and written into the file to generate.

    #**** Code ****
    if      [ "${p_display,,}" == 'yes' ]; then echo -e "# $p_content" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { PrintErrorLine "UNABLE TO WRITE THE FILE'S CONTENT IN THE FILE TO GENERATE ! Please check its path and if it exists."; return 1; };
    else                                        echo -e "# $p_content" >>       "$__BU_MAIN_FULL_FILE_PATH" || { PrintErrorLine "UNABLE TO WRITE THE FILE'S CONTENT IN THE FILE TO GENERATE ! Please check its path and if it exists."; return 1; };
    fi
}

# ----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Checking first if Shellcheck is installed in order to check for code errors.
if ! command -v shellcheck; then PrintErrorLine "$__BU_COMPILE__SHELLCHECK_MISSING" >&2; exit 1; fi

# Files compilation function.
# shellcheck disable=SC2059
function CompileInSingleFile()
{
    #**** Parameters ****
    local p_locale=${1:-NULL};  # String    - Default : NULL    - Language in which the file must be translated.
    local p_display=${2:-no};   # String    - Default : no      - Display the content of each file when it is read and written into the file to generate.

    #**** Variables ****
    local __locale_file_path="$__BU_MODULE_INIT_TRANSLATIONS_PATH/${p_locale}.locale"

    #**** Code ****
    # Checking if the "$p_locale" variable is a valid ISO 639-1 language code.
    if ! CheckISO639_1_LangCode "$p_locale"; then PrintErrorLine "$__BU_COMPILE__BAD_LANGUAGE_PASSED"; return 1; fi

    # --------------------------------------------------------------------------------------------
    # Writing the initializer script's translations files content first into the file to generate.

    PrintNewstepLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT" "$p_locale" "$__locale_file_path")";

    if  [ ! -f "$__locale_file_path" ]; then PrintErrorLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR" "$p_locale" "$__locale_file_path")" >&2; return 1;
    else
        ShellcheckVerif "$__locale_file_path" || local __err="error";

        WriteBU "$__locale_file_path" "$p_display" || local ____err="error";
    fi

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR" "$p_locale" "$__locale_file_path")";

    PrintSuccessLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS" "$p_locale" "$__locale_file_path")";

    # --------------------------------------------------------------------------
    # Writing the main module's library files content into the file to generate.
    PrintNewstepLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT" "$__locale_file_path")";

    for i in "$__BU_ROOT_PATH/lib/functions/main/"*.lib; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR" "$__locale_file_path")"; return 1;

    PrintSuccessLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS" "$__locale_file_path")";

    # --------------------------------------------------------------------------------
    # Writing the main module's configuration files content into the file to generate.
    PrintNewstepLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT" "$__locale_file_path")";

    for i in "$HOME/.Bash-utils/config/modules/main/"*.conf; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "[ LOCALE : ${p_locale^^} ] $(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR" "$__locale_file_path")";

    PrintSuccessLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS" "$__locale_file_path")";

    # ---------------------------------------------------------------------------------
    # Writing the main module's initializer script's content into the file to generate.
    PrintNewstepLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT" "$__locale_file_path")";

    for i in "$HOME/.Bash-utils/modules/main/"*; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__locale_file_path")";

    PrintSuccessLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS" "$__locale_file_path")";

    # ---------------------------------------------------------------------------------------
    # Writing the initializer script's configuration files content into the file to generate.
    PrintNewstepLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT" "$__locale_file_path")";

    for i in "$__BU_MODULE_INIT_CONFIGS_PATH/"*.conf; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR" "$__locale_file_path")";

    PrintSuccessLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS" "$__locale_file_path")";

    # -------------------------------------------------------------------
    # Writing the initializer script's content into the file to generate.
    PrintNewstepLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT" "$__locale_file_path")";

    if [ ! -f "$__BU_MAIN_FULL_FILE_PATH" ]; then PrintErrorLine ""; return 1;
    else
        ShellcheckVerif "$__BU_MAIN_FULL_FILE_PATH" || local __err="error";

        WriteBU "$__BU_MAIN_FULL_FILE_PATH" "$p_display";
    fi

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__locale_file_path")";

    PrintSuccessLine "$(printf "[ LOCALE : ${p_locale^^} ] $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS" "$__locale_file_path")";

    return 0;
}


CompileInSingleFile "en" "no" || { PrintErrorLine "IMPOSSIBLE TO CREATE AN ENGLISH VERSION CONTAINING THE MAIN RESOURCES OF THE FRAMEWORK ENCAPSULATED IN A SINGLE FILE!!!"; exit 1; };
PrintSuccessLine "SUCCESSFULLY CREATED AN ENGLISH VERSION CONTAINING THE MAIN RESOURCES OF THE FRAMEWORK ENCAPSULATED IN A SINGLE FILE";

CompileInSingleFile "fr" "yes" || { PrintErrorLine "IMPOSSIBLE DE CRÉER UNE VERSION FRANÇAISE CONTENANT LES PRINCIPALES RESSOURCES DU FRAMEWORK ENCAPSULÉES EN UN SIMPLE FICHIER !!!"; exit 1; };
PrintSuccessLine "CRÉATION D'UNE VERSION FRANÇAISE CONTENANT LES PRINCIPALES RESSOURCES DU FRAMEWORK ENCAPSULÉES DANS UN SEUL FICHIER RÉUSSIE AVEC SUCCÈS";
