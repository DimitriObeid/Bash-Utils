#!/usr/bin/env bash

# --------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS

# Name          : lib-compiler.sh
# Author(s)     : Dimitri OBEID
# Version       : 2.0
# Beta version  : 3.0

# ------------------
# FILE DESCRIPTION :

# This script compiles the needed framework ressources and the main module in a single file.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### BASH DEPENDENCIES

## BASH UTILS

# Temporarily commented, as the feature is not yet implemented . In the future, every dev-tools scripts will use a stable compiled version.
# source "${HOME}/.Bash-utils/compiled/stable/framework-full.sh"

# if ! BashUtils_InitModules \
#    "module --log-shut --mode-log-partial" \
#    "main stat-error=fatal --stat-log=true --stat-log-r=tee --stat-time-txt=1 --stat-txt-fmt=true --stat-devtools=true" \

#    then
#            echo >&2; echo "In $(basename "$0"), line $(( LINENO - 1 )) --> Error : something went wrong while calling the « BashUtils_InitModules() » function" >&2; echo >&2; exit 1;
# fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL RESOURCES DEFINITION #############################################

########################################### PROJECT'S ARGUMENTS DEFINITIONS ###########################################

#### POSITIONAL ARGUMENTS

## LANGUAGE

# ARG TYPE : String
# REQUIRED
# DEFAULT VAL : NULL

# DESC 1 : String containing the list of languages to select as translation for each compiled scripts.
# DESC 2 : This argument must be provided in a single string like that, if you want to compile the project in English, French, Spanish, Swedish, Ukrainian and Chinese : "lang=en,fr,es,sv,uk,zh"
__BU_ARG_LANG=${1:-$'\0'};

shift 1;

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAY OF ARGUMENTS

# COMPILER'S EXTRA ARGUMENTS
# OPTIONAL
# DEFAULT VAL : NULL

# DESC : Fitting the arguments following the "${__BU_ARG_LANG}" parameter in an array, in order to fit more arguments and prevent incompatible arguments to be put together (optional arguments).
__BU_ARGS_ARRAY=("${@}");

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S VARIABLES DEFINITIONS ###########################################

#### ARRAYS DEFINITION

## FILES ARRAYS

# Storing each stable file that cannot be set into read-only mode.
__BU_ARRAY__READ_ONLY_FAILED_FILES=();

# Storing each compiled files path.
__BU_ARRAY__COMPILED_FILES_LIST=();

# Storing each compiled stable files path.
__BU_ARRAY__COMPILED_STABLE_FILES_LIST=();

# -----------------------------------------------

## LANGUAGES ARRAYS

# List of every ISO 639-1 language codes.
# In the far future, when every languages will be used in the Framework, the 'all' argument will be used to compile the Framework in a single file for each of the following languages,
___BU_COMPILER__LANG_ARRAY=('ab' 'aa' 'af' 'ak' 'sq' 'am' 'ar' 'an' 'hy' 'as' 'av' 'ae' 'ay' 'az' 'bm' 'ba' 'eu' 'be' 'bn' 'bi' 'bs' 'br' 'bg' 'my' 'ca' 'ch' \
                            'ce' 'ny' 'zh' 'cu' 'cv' 'kw' 'co' 'cr' 'hr' 'cs' 'da' 'dv' 'nl' 'dz' 'en' 'eo' 'et' 'ee' 'fo' 'fj' 'fi' 'fr' 'fy' 'ff' 'gd' 'gl' \
                            'lg' 'ka' 'de' 'el' 'kl' 'gn' 'gu' 'ht' 'ha' 'he' 'hz' 'hi' 'ho' 'hu' 'is' 'io' 'ig' 'id' 'ia' 'ie' 'iu' 'ik' 'ga' 'it' 'ja' 'jv' \
                            'kn' 'kr' 'ks' 'kk' 'km' 'ki' 'rw' 'ky' 'kv' 'kg' 'ko' 'kj' 'ku' 'lo' 'la' 'lv' 'li' 'ln' 'lt' 'lu' 'lb' 'mk' 'mg' 'ms' 'ml' 'mt' \
                            'gv' 'mi' 'mr' 'mh' 'mn' 'na' 'nv' 'nd' 'nr' 'ng' 'ne' 'no' 'nb' 'nn' 'ii' 'oc' 'oj' 'or' 'om' 'os' 'pi' 'ps' 'fa' 'pl' 'pt' 'pa' \
                            'qu' 'ro' 'rm' 'rn' 'ru' 'se' 'sm' 'sg' 'sa' 'sc' 'sr' 'sn' 'sd' 'si' 'sk' 'sl' 'so' 'st' 'es' 'su' 'sw' 'ss' 'sv' 'tl' 'ty' 'tg' \
                            'ta' 'tt' 'te' 'th' 'bo' 'ti' 'to' 'ts' 'tn' 'tr' 'tk' 'tw' 'ug' 'uk' 'ur' 'uz' 've' 'vi' 'vo' 'wa' 'cy' 'wo' 'xh' 'yi' 'yo' 'za' 'zu')

# List of the currently supported languages in the framework (in the far future, the 'all' argument will be replaced to support the previous array).
__BU_COMPILER__SUPPORTED_LANG_ARRAY=('en' 'fr');

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITIONS

## COLORS

# Defining some colors for the text decoration.
__CYAN="$(tput setaf 51)";

__GREEN="$(tput setaf 2)";

__GREY="$(tput setaf 249)";

__ORANGE="$(tput setaf 166)";

__RED="$(tput setaf 9)";

__RESET="$(tput sgr0)";

__YELLOW="$(tput setaf 11)";

# Defining some colors for specific text decoration.
__CMDS="${__GREY}"

__ERROR="${__RED}";

__HIGHLIGHT="${__CYAN}";

__NEWSTEP="${__ORANGE}";

__SUCCESS="${__GREEN}";

__WARNING="${__YELLOW}";

# -----------------------------------------------

## HIGH PRIORITY PATHS DEFINITION

# Getting the path to the library's root directory from the path file.

if [ -d '/usr/local/lib/Bash-utils' ]; then __BU_ROOT_PATH='/usr/local/lib/Bash-utils';

elif [ -d "${HOME}/.Bash-utils/Bash-utils" ]; then __BU_ROOT_PATH="${HOME}/.Bash-utils/Bash-utils";

else __BU_ROOT_PATH="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path")"; if [ ! -d "${__BU_ROOT_PATH}" ]; then
        # shellcheck disable=SC2059
        printf "${__ERROR}ERROR : THE ${__HIGHLIGHT}%s${__ERROR} FOLDER DOESN'T EXISTS !!!${__RESET}\n"  >&2;
        echo "Please check the existence of the root directory of the Bash Utils library." >&2;
        echo >&2; echo >&2;

        echo "${__ERROR}STOPPING THE EXECUTION OF THE COMPILER, NO FILES FROM THE ${__HIGHLIGHT}BASH UTILS${__ERROR} FRAMEWORK WERE COMPILED !!!${__RESET}" >&2;
        echo >&2;

        exit 1;
    fi
fi

# Path to the locale files.
__BU_LIB_COMPILER_RESOURCES__MSG_PATH="${__BU_ROOT_PATH}/res/dev-tools/dev-res/lib-compiler/msg";

# -----------------------------------------------

## MESSAGE TRANSLATIONS

# FRENCH - FRANÇAIS
if [[ "${LANG}" == fr_* ]]; then
    # shellcheck disable=SC1091
    if ! source "${__BU_LIB_COMPILER_RESOURCES__MSG_PATH}/fr.locale"; then
        echo "${__WARNING}IMPOSSIBLE D'INCLURE LE FICHIER DE TRADUCTIONS EN FRANÇAIS !!!!!${__RESET}" >&2; echo >&2;
        echo "${__WARNING}Le compilateur utilisera les ressources de traduction pour la langue anglaise${__RESET}" >&2;
        echo >&2;

        ____unable_to_include_lang='true';
    else
        ____lang_included='true';
    fi
fi
# -------------------------------------------------------------------------------
# SINCE NO OTHER LANGUAGES ARE SUPPORTED, ENGLISH IS SET AS THE DEFAULT LANGUAGE.
# -------------------------------------------------------------------------------

if [ -n "${____unable_to_include_lang}" ] || [ -z "${____lang_included}" ]; then
    # shellcheck disable=SC1091
    source "${__BU_LIB_COMPILER_RESOURCES__MSG_PATH}/en.locale" || {
        echo >&2; echo >&2;

        echo "${__ERROR}UNABLE TO INCLUDE THE ENGLISH TRANSLATION FILES !!!!!${__RESET}" >&2; echo >&2;
        echo "${__WARNING}Without the inclusion of any translation file, no messages can be returned, thus you cannot know the current compilation step or if an error occured and you must react by typing an input${__RESET}" >&2;
        echo >&2; echo >&2;

        echo "${__ERROR}STOPPING THE EXECUTION OF THE COMPILER, NO FILES FROM THE ${__HIGHLIGHT}BASH UTILS${__ERROR} FRAMEWORK WERE COMPILED !!!${__RESET}" >&2;
        echo >&2;

        exit 1;
    };
fi

# Unsetting the "${____unable_to_include_lang}" and the "${____lang_included}" variables.
[ -n "${____unable_to_include_lang}" ]  && unset ____unable_to_include_lang;
[ -n "${____lang_included}" ]           && unset ____lang_included;

# -----------------------------------------------

## LOW PRIORTITY PATHS DEFINITION

# Informations of the file which temporary stores each file's data.
if [ -f "${__BU_ROOT_PATH}/install/Bash-utils-init.sh" ]; then __BU_INITIALIZER_SCRIPT_PATH="${__BU_ROOT_PATH}/install/Bash-utils-init.sh";

else __BU_INITIALIZER_SCRIPT_PATH="${__BU_ROOT_PATH}/Bash-utils-init.sh";

fi

__BU_LIB_COMPILER_RESOURCES__HEREDOC_PATH="${__BU_ROOT_PATH}/res/dev-tools/dev-res/lib-compiler/heredoc";

# Path of the modules initializer file.
__BU_MAIN_FULL_FILE_PATH="${__BU_ROOT_PATH}/Bash-utils.sh";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_CONFIGS_PATH="${__BU_ROOT_PATH}/install/.Bash-utils/config/initializer";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_TRANSLATIONS_PATH="${__BU_MODULE_INIT_CONFIGS_PATH}/locale";

# Sourcing the "DevTools.lib" file in order to use the "BU.Main.DevTools.ShellcheckVerif()" function.
# shellcheck disable=SC1091
source "${__BU_ROOT_PATH}/lib/functions/main/DevTools.lib";

# Sourcing the "Locale.lib" file in order to use the "BU.Main.Locale.PrintLanguageName()" function.
# shellcheck disable=SC1091
source "${__BU_ROOT_PATH}/lib/functions/main/Locale.lib";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### WRITING TEXT

## WRITING LINES

# Function to create and display rows according to the number of columns in the terminal's text area.
function PrintLine()
{
    #**** Parameters ****
    local p_pos=${1:-NULL};         # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Printing a character according to the line's position.
    local p_len=${2:-NULL};         # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Printing a line according to the string's length.

    if [ "${p_len^^}" != 'NULL' ]; then
        local p_str=${3:-\$'0'};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : String whose lenght is to be processed.

        __cols="${#p_str}";
    else
        __cols="$(tput cols)";
    fi

    #**** Variables ****
    local v_line_char  # VAR TYPE : Char    - Desc : Character which is printed at each row's column to draw the line.

    #**** Code ****
    if [ "${p_pos^^}" == 'UPPER' ] || [ "${p_pos^^}" == 'LOWER' ]; then v_line_char='-'; else v_line_char='#'; fi

	for _ in $(eval echo -e "{1..${__cols}}"); do
            printf '%s' "${v_line_char}";
    done; printf "\n";
}

function PrintBaseLine()
{
    #**** Parameters ****
    local p_color=${1:-\$'0'};  # ARG TYPE : CMD        - REQUIRED | DEFAULT VAL : NULL     - DESC : Color of the line AND the text.
    local p_msg=${2:-\$'0'};    # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Message to print.
    local p_pos=${3:-NULL};     # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Position of the line to print.
    local p_len=${4:-NULL};     # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Printing a line according to the string's length.

    # NULL (default)    : no lines are printed
    # UPPER             : only the upper line is printed
    # LOWER             : only the lower line is printed
    # FULL              : both lines are printed

    #**** Code ****
    # Error handling for the value of the "${p_pos}" argument.
    if [ "${p_pos^^}" != 'NULL' ]; then if [[ ("${p_pos^^}" != 'UPPER') && ("${p_pos^^}" != 'LOWER') && ("${p_pos^^}" != 'FULL') ]]; then p_pos='NULL'; fi; fi

    echo;

    [[ ("${p_pos^^}" == 'FULL') || ("${p_pos^^}" == 'UPPER') ]] && { printf "%s" "${p_color}"; if [[ "${p_len,,}" == len?(g?(th)) ]]; then PrintLine "${p_pos}" "${p_len}" "${p_msg}"; else PrintLine "${p_pos}"; fi; printf "%s" "${__RESET}"; };

    echo "${p_color}${p_msg}${__RESET}";

    [[ ("${p_pos^^}" == 'FULL') || ("${p_pos^^}" == 'LOWER') ]] && { printf "%s" "${p_color}"; if [[ "${p_len,,}" == len?(g?(th)) ]]; then PrintLine "${p_pos}" "${p_len}" "${p_msg}"; else PrintLine "${p_pos}"; fi; printf "%s" "${__RESET}"; };

    echo;

    return 0;
}

# Printing an error line.
function PrintErrorLine()   { PrintBaseLine "${__ERROR}" "${1}" "${2}" "${3}" >&2; }

# Printing a newstep line.
function PrintNewstepLine() { PrintBaseLine "${__NEWSTEP}" "${1}" "${2}" "${3}"; }

# Printing a success line.
function PrintSuccessLine() { PrintBaseLine "${__SUCCESS}" "${1}" "${2}" "${3}"; }

# Printing a warning line.
function PrintWarningLine() { PrintBaseLine "${__WARNING}" "${1}" "${2}" "${3}"; }

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FILES PROCESSING

## RIGHTS PROCESSING

# Printing the list the every files whose rights were not modified.
# shellcheck disable=SC2059
function PrintFilesWhichWereNotChmoded()
{
    #**** Parameters ****
    local __compiled_stable_file_parent_dir=${1:-$'\0'}; # ARG TYPE : Dirpath   - REQUIRED | DEFAULT VAL : NULL     - DESC :

    #**** Code ****
    printf "${__BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED}\n" "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" >&2;

    for files in "${__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}"; do
        v_file_line=$(( v_index + 1 ));

        echo "    - ${files}";

        if [ $(( v_file_line % 5 )) -eq 0 ]; then
            echo >&2;
        fi

        v_index=$(( v_index + 1 ));
    done

    echo >&2; printf "${__BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__TIP}\n" "${__compiled_stable_file_parent_dir}/" >&2;
}

# -----------------------------------------------

## FILES EDITION

# Erasing every pieces of code which prevent the direct execution of their host files, since a new one is written in the "WriteCommentCode()" function.
function EraseSafeguardExecLines()
{
    sed -i "/if \[ \"\${0##\/*}\" == \"\${BASH_SOURCE[0]##\/*}\" \]; then/,/fi; exit 1; fi/d" "${__compiled_file_path}";

    return 0;
}

# Writing to the compiled file with a here document : 
#   - the comments containing the informations about the compiled file,
#   - and the pieces of code which prevent the direct execution of their host files.
function WriteCommentCode()
{
    #**** Variables ****
    local v_filename="${__BU_LIB_COMPILER_RESOURCES__HEREDOC_PATH}/${v_curr_locale}.sh";
    local v_filename_tmp="${v_filename}.tmp";

    #**** Code ****
    # shellcheck disable=SC1090
    source "${v_filename}" || {
        printf "${__ERROR}FAILED TO SOURCE THE ${__HIGHLIGHT}%s${__ERROR} FILE${__RESET}" >&2;
        echo "" >&2;

        exit 1;
    }

    WriteCommentCode.Heredoc."${v_curr_locale}";

# Writing the pieces of code which prevent the direct execution of their host files.
cat <<-EOF >> "${v_filename_tmp}"
if [ "\${0##*/}" == "\${BASH_SOURCE[0]##*/}" ]; then if [[ "\${LANG}" == de_* ]]; then
    echo -e "ACHTUNG !" >&2; echo >&2;
    echo -e "Dieses Shell-Skript (\${BASH_SOURCE[0]}) ist nicht dazu gedacht, direkt ausgeführt zu werden !" >&2;
    echo -e "Verwenden Sie nur dieses Skript, indem Sie es in Ihr Projekt aufnehmen." >&2; echo >&2;

elif [[ "\${LANG}" == es_* ]]; then
    echo -e "ATENCIÓN !" >&2; echo >&2;
    echo -e "Este script de shell (\${BASH_SOURCE[0]}) no debe ejecutarse directamente !" >&2;
    echo -e "Utilice sólo este script incluyéndolo en el script de su proyecto." >&2; echo >&2;

elif [[ "\${LANG}" == fr_* ]]; then
    echo -e "ATTENTION !" >&2; echo >&2;
    echo -e "Ce script shell (\${BASH_SOURCE[0]}) n'est pas conçu pour être directement exécuté !" >&2;
    echo -e "Utilisez seulement ce script en l'incluant dans votre projet." >&2; echo >&2;

elif [[ "\${LANG}" == pt_* ]]; then
    echo -e "ATENÇÃO !" >&2; echo >&2;
    echo -e "Este script de shell (\${BASH_SOURCE[0]}) não é para ser executado directamente !" >&2;
    echo -e "Utilize este guião apenas incluindo-o no seu projecto." >&2; echo >&2;

elif [[ "\${LANG}" == ru_* ]]; then
    echo -e "ВНИМАНИЕ !" >&2; echo >&2;
    echo -e "Этот сценарий оболочки (\${BASH_SOURCE[0]}) не предназначен для непосредственного выполнения !" >&2;
    echo -e "Используйте только этот скрипт, включив его в свой проект." >&2; echo >&2;

else
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (\${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use only this script by including it in your project script." >&2; echo >&2;

fi; exit 1; fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #
EOF

    # Cela écrasera le contenu actuel du ficher "${v_filename}" avec la concaténation du contenu du
    # fichier "${__compiled_file_path}" et du contenu du fichier "${v_filename}" à partir de la deuxième ligne.
    echo "$(tail -n +2 "${v_filename_tmp}")$(cat "${__compiled_file_path}")" > "${__compiled_file_path}";

    rm "${v_filename_tmp}";

    return 0;
}

# Erasing the comments from the targeted compiled file.
function EraseComments()
{
    # Erasing every commented lines, except the ones with the "shellcheck" directive.
    sed -i '/^[[:blank:]]*#.*shellcheck/d; /^[[:blank:]]*#/d' "${__compiled_file_path}";

    # Erasing the extra blank lines from the compiled file.
    sed -i '/^$/N;/\n$/D' "${__compiled_file_path}";
}

# Writing the target file's content into the file to generate.
function WriteBU()
{
    #**** Parameters ****
    local p_filepath=${1:-\$'0'}	# ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Path to the file whose content should be written to the "${__BU_MAIN_FULL_FILE_PATH}" file.
    local p_display=${2:-no};   	# ARG TYPE : String     - REQUIRED | DEFAULT VAL : no       - DESC : Display the content of each file when it is read and written into the file to generate.

	#**** Variables ****
	local v_content;				# VAR TYPE : String     - DESC : Content of the "${p_filepath}" file to write in the "${__BU_MAIN_FULL_FILE_PATH}" file.

	v_content="$(cat "${p_filepath}")";

    #**** Code ****
    if      [ "${p_display,,}" == "${_____value_of__display}" ]; then   echo "${v_content}" | tee -a    "${__BU_MAIN_FULL_FILE_PATH}" || { PrintErrorLine "${__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE}"; echo "${__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE__ADVICE}" >&2; return 1; };
    else                                                                echo "${v_content}" >>          "${__BU_MAIN_FULL_FILE_PATH}" || { PrintErrorLine "${__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE}"; echo "${__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE__ADVICE}" >&2; return 1; };
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MATHS

## RAW BYTE SIZE TO HUMAN-READABLE BYTE SIZE

# Converts a byte count to a human readable format in IEC binary notation (base-1024 (eg : GiB)), rounded to two
# decimal places for anything larger than a byte. Switchable to padded format and base-1000 (eg : MB) if desired.

# Initial source of this AWK script (since it's not mine, plus I added more informations as comments and the localization) :
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BytesToHuman()
{
    #**** Parameters ****
    local L_BYTES="${1:-0}";    # ARG TYPE : Int            - REQUIRED | DEFAULT VAL : 0    - DESC : Raw size in bytes.
    local L_PAD="${2:-no}";     # ARG TYPE : String         - REQUIRED | DEFAULT VAL : no   - DESC : Allow result display padding.
    local L_BASE="${3:-1024}";  # ARG TYPE : Int            - REQUIRED | DEFAULT VAL : 1024 - DESC : Base (1000 (metric) or 1024 (binary notation))
    local V_LANG="${4:-en}";    # ARG TYPE : ISO 639-1 code - REQUIRED | DEFAULT VAL : en   - DESC : Language, for localizing the byte count (default language : English).

    #**** Code ****
    if [ "${L_PAD^^}" == 'NULL' ] || [ "${L_PAD^^}" == 'NIL' ]; then L_PAD='no'; fi

    # Creating a command substitution to calculate the byte count according to the values passed as arguments, with an AWK script.
    local BYTESTOHUMAN_RESULT; BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" -v lang="${V_LANG}" 'function human(x, pad, base, lang) {

        # If the desired base format is not the binary prefix, then the base format used will be the metric one.
        if(base!=1024)base=1000

        # Setting the prefixes list (K = kilo, M = mega, G = giga, T = tera, P = peta, E = exa, Z = zeta, Y = yotta), and corrected the inversion of the Exa with Peta, and Zeta with Yotta.
        if (lang == "fr") {
            # Condition ternaire : si le format de base utilise le préfixe binaire, cette unité "io" ([préfixe]bioctet) est affichée après la valeur. Sinon, cette unité "o" ([préfixe]octet) est affichée après la valeur.
            basesuf=(base==1024)?"io":"o"

            s="oKMGTPEZY"
        } else {
            # Ternary condition : if the base format uses the binary prefix, then the "iB" ([prefix]bibyte) unit is displayed after the value. Else the "[prefix]byte" unit is displayed after the value.
            basesuf=(base==1024)?"iB":"B"

            s="BKMGTPEZY"
        }

        # While the "x" ("human" function first parameter value) is superior or equal to the "base" (human function third parameter value) AND
        while (x>=base && length(s)>1)
               {x/=base; s=substr(s,2)}
        s=substr(s,1,1)

        if (lang == "fr") {
            xf=(pad=="yes") ? ((s=="o")?"%5d   ":"%8.2f") : ((s=="o")?"%d":"%.2f")
            s=(s!="o") ? (s basesuf) : ((pad=="no") ? s : ((basesuf=="io")?(s "  "):(s " ")))
        } else {
            xf=(pad=="yes") ? ((s=="B")?"%5d   ":"%8.2f") : ((s=="B")?"%d":"%.2f")
            s=(s!="B") ? (s basesuf) : ((pad=="no") ? s : ((basesuf=="iB")?(s "  "):(s " ")))
        }

        return sprintf( (xf " %s\n"), x, s)
    }

    BEGIN{print human(bytes, pad, base, lang)}')

    printf "%s" "${BYTESTOHUMAN_RESULT}";

    return 0;
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### LANGUAGES

## CHECKINGS

# Verifying the list of every ISO 639-1 language codes.
function CheckISO639_1_LangCode()
{
    #**** Parameters ****
    local p_code=${1:-NULL}; # ARG TYPE : String    - REQUIRED | DEFAULT VAL : NULL     - DESC : Language in which the file must be translated.

    #**** Code ****
    [[ ${___BU_COMPILER__LANG_ARRAY[*]} =~ ${p_code,,} ]] && return 0; return 1;
}

# -----------------------------------------------

## VALUES GETTER

# Getting the delimiter.
function CheckLangArgDelim()
{
    #**** Parameters ****
    local p_string=${1:-\$'0'}; # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : String to process.
    local p_target=${2:-\$'0'}; # ARG TYPE : Char       - REQUIRED | DEFAULT VAL : NULL     - DESC : Targeted character.

    #**** Variables ****
    local v_occurences="${p_string//[^${p_target}]}"; # VAR TYPE :  - DESC :

    #**** Code ****
    if [ -n "${v_occurences:0:1}" ]; then return 0; fi

    return 1;
}

# ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

#### PRE-COMPILATION PROCESSINGS

## PARSING THE ARRAY OF OPTIONAL ARGUMENTS GIVEN BY THE USER

# Defining the values of the arguments, in order to use them in the appropriate information messages.
_____value_of__compile_stable='--compile-stable';
_____value_of__compilation_authors='--compilation-authors';
_____value_of__display='display';
_____value_of__keep_comments='--keep-comments';
_____value_of__keep_exec_safeguards='--keep-exec-safeguards';
_____value_of__keep_raw_document_layout='--keep-raw-document-layout';
_____value_of__no_shellcheck='--no-shellcheck';

# Looping through the array of optional arguments.
for arg in "${__BU_ARGS_ARRAY[@]}"; do
    # If the user decided to create a stable version of the compiled framework.
    if [[ "${arg,,}" == --?(compile?(-))stable ]]; then
        # Declaring a variable to tell to the next program's instructions that this value was passed as argument.
        __vArrayVal_compile_stable="${_____value_of__compile_stable}";

    # Else, if the user passes the 'compile-unstable' value to compile an unstable version of the framework.
    elif [[ "${arg,,}" == --?(compile?(-))unstable ]]; then
        # As the unstable version is the one compiled by default AND before the creation of a stable one, nothing has to be done.
        true;
    
    # Else, if the author(s) of the compilation give their name(s).
    elif [[ "${arg,,}" == --compilation-author?(s)=* ]]; then
        __vArrayVal_compilation_authors="${_____value_of__compilation_authors}";

    # Else, if the user decides to display the content of each compiled file.
    elif [ "${arg,,}" == --display ]; then
        __vArrayVal_display="${_____value_of__display}";

    # Else, if the user decides to remove the comments from the compiled file
    # This option will not remove the file's top shebang, nor its informations commented at its top or the shellcheck directives.
    elif [[ "${arg,,}" == --keep?(-)comments ]]; then
        __vArrayVal_keep_comments="${_____value_of__keep_comments}";

    # Else, if the user decides to keep every pieces of code which prevent the direct execution of their host files.
    elif [[ "${arg,,}" == --keep-exec-safeguards ]]; then
        __vArrayVal_keep_exec_safeguards="${_____value_of__keep_exec_safeguards}";

    # Else, if the user decides to keep the raw layout of the compiled file.
    elif [[ "${arg,,}" == --keep-raw-doc?(ument)-layout ]]; then
        __vArrayVal_keep_raw_document_layout="${_____value_of__keep_raw_document_layout}";

    # Else, if the user decides to prevent the execution of the 'shellcheck' command.
    # WARNING : Do not check for programming errors in the files (not recommended, unless you know what you are doing).
    elif [[ "${arg,,}" == --no?(-)shellcheck ]]; then
        __vArrayVal_no_shellcheck="${_____value_of__no_shellcheck}";

    # --------------------------------------------------------------------------------
    # Else, if an unsupported argument is passed into the array of optional arguments.
    else
        PrintErrorLine "${__BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY}" 'FULL';

        # shellcheck disable=SC2059
        printf "${__BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY__ADVICE}\n" "${arg}" >&2;
        echo >&2;

        PrintErrorLine "${__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG}" 'FULL';

        exit 1;
    fi
done

# -----------------------------------------------

## CHECKING FOR ANY INCOMPATIBLE VALUES

# Verifying if the "${__vArrayVal_no_shellcheck}" and the "${__vArrayVal_compile_stable}" values were passed together.
if [[ (-n "${__vArrayVal_compile_stable}") && (-n "${__vArrayVal_no_shellcheck}") ]]; then
    # shellcheck disable=SC2059
    PrintWarningLine "$(printf "${__BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABLE__WERE_PASSED_TOGETHER}\n\n" "${__vArrayVal_compile_stable}" "${__vArrayVal_no_shellcheck}")" 'FULL' >&2;
    echo "${__BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABLE__WERE_PASSED_TOGETHER__ADVICE}" >&2;
    echo >&2;

    PrintErrorLine "${__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG}" 'FULL';

    exit 1;
fi

# Verifying if the "${__vArrayVal_keep_raw_document_layout}" value was passed with the "${__vArrayVal_keep_exec_safeguards}" or the "${__vArrayVal_keep_comments}" values.
if [[ (-n "${__vArrayVal_keep_raw_document_layout}") && (-n "${__vArrayVal_keep_comments}") ]] || \
    [[ (-n "${__vArrayVal_keep_raw_document_layout}") && (-n "${__vArrayVal_keep_exec_safeguards}") ]]; then
    # shellcheck disable=SC2059
    PrintWarningLine "$(printf "${__BU_COMPILE__KEEP_RAW_DOC_LAYOUT__KEEP_COMMENTS__AND__KEEP_EXEC_SAFEGUARD__WERE_PASSED_TOGETHER}\n\n" "${_____value_of__keep_raw_document_layout}" "${_____value_of__keep_comments}" "${_____value_of__keep_exec_safeguards}")" 'FULL' >&2;

    # shellcheck disable=SC2059
    printf "${__BU_COMPILE__KEEP_RAW_DOC_LAYOUT__KEEP_COMMENTS__AND__KEEP_EXEC_SAFEGUARD__WERE_PASSED_TOGETHER__ADVICE}" "${_____value_of__keep_raw_document_layout}" "${_____value_of__keep_comments}" "${_____value_of__keep_exec_safeguards}" >&2;
    echo >&2;

    PrintErrorLine "${__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG}" 'FULL';

    exit 1;
fi

# -----------------------------------------------

## LAST MODIFICATIONS BEFORE THE COMPILATION PROCESS

# REMEMBER ! It's not recommended to disable the checkings of each file, unless you know what you are doing.

# At this point, declaring this condition is safe, since the presence of the "${_____value_of__compile_stable}" argument value was done before.
if [[ (-n "${__vArrayVal_no_shellcheck}") && (-n "${__vArrayVal_no_shellcheck}") ]]; then
    PrintWarningLine "${__BU_COMPILE__SHELLCHECK__DISABLED}" 'FULL';

    sleep 1;

    __BU_SHELLCHECKED='true';
else
    # Checking first if Shellcheck is installed in order to check for code errors.
    if ! command -v shellcheck; then PrintErrorLine "${__BU_COMPILE__SHELLCHECK__MISSING}" 'FULL'; exit 1; fi

    # To avoid launching Shellcheck each time another file is generated in another language, it's necessary to check if the files were checked.
    __BU_SHELLCHECKED='false';
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### COMPILATION

## COMPILER'S MAIN FUNCTION

# shellcheck disable=SC2059
function CompileInSingleFile()
{
    #**** Parameters ****
    local p_locale=${1:-NULL};  # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Language in which the file must be translated.

    #**** Variables ****
    local v_locale_str;         # VAR TYPE : String     - DESC :
    local v_locale_tmp;         # VAR TYPE : String     - DESC :
    local v_locale_delim;       # VAR TYPE : Char       - DESC :

    # This variable will be used to verify if the "lang=" value is passed as first argument.
    local v_is_check_to_do;     # VAR TYPE : Bool       - DESC :

    # Getting the current system language.
    local ____sys_lang;         # VAR TYPE : CMD        - DESC : This variable stores a ISO 639-1 code, copied from the two first characters of the operating system's ICU locale.

    local __language_array;     # VAR TYPE : ISO 639-1 codes array  - DESC

    #**** Code ****
    ____sys_lang="$(echo "${LANG}" | cut -d _ -f1)";

    # Converting the "${p_locale}" string into an array of ISO 639-1 codes.
    if [[ "${p_locale,,}" == lang=* ]]; then
        # Checking for the delimiter.
        if      CheckLangArgDelim "${p_locale}" ','; then v_locale_delim=',';
        elif    CheckLangArgDelim "${p_locale}" ';'; then v_locale_delim=';';
        elif    CheckLangArgDelim "${p_locale}" '|'; then v_locale_delim='|';
        elif    CheckLangArgDelim "${p_locale}" '~'; then v_locale_delim='~';
        elif    CheckLangArgDelim "${p_locale}" '_'; then v_locale_delim='_';
        elif    CheckLangArgDelim "${p_locale}" '.'; then v_locale_delim='.';
        elif    CheckLangArgDelim "${p_locale}" ':'; then v_locale_delim=':';
        elif    CheckLangArgDelim "${p_locale}" '!'; then v_locale_delim='!';
        elif    CheckLangArgDelim "${p_locale}" '§'; then v_locale_delim='§';
        fi

        # Getting each ISO 639-1 codes after the mandatory '=' sign.
        v_locale_str="$(sed "s/^[^=]*=//" <<< "${p_locale}")";

        # This variable's purpose is to avoid assigning the "${v_locale_str}" variable to itself, because if so, the assignment would have done nothing.
        v_locale_tmp="${v_locale_str}";
        v_locale_str="${v_locale_tmp}";

        if [ "${v_locale_str,,}" != 'all' ] && [[ "${v_locale_str,,}" != ?(all?(-))supported ]]; then
            # Replacing each delimiter with an empty character.
            v_locale_str="${v_locale_str//${v_locale_delim}/" "}";

            # String to word array.
            read -ra __language_array <<< "${v_locale_str}";
        else
            # Reassigning the new value in the "${v_locale_str}" variable to the "${p_locale}" original variable, so that the condition can be written only once.
            p_locale="${v_locale_str}";

            # Assigning a value, so that no extra checkings are done to the first argument's value afterwards.
            v_is_check_to_do='true';
        fi
    else
        # Assigning a value, so that no extra checkings are done to the first argument's value afterwards.
        v_is_check_to_do='true';
    fi

    # Else, if the "all" value is passed as the first argument.
    if [ "${v_is_check_to_do}" == 'true' ]; then
        if [ "${p_locale,,}" == 'all' ]; then
            PrintWarningLine "${__HIGHLIGHT}${p_locale}${__WARNING} | ${__HIGHLIGHT}lang=all${__WARNING} : FEATURE NOT YET FULLY IMPLEMENTED, WATCH OUT FOR THE BUGS" 'FULL'; return 1;

            # for langs in "${___BU_COMPILER__LANG_ARRAY[@]}"; do __language_array+=("${langs}"); done;

        # Else, if the "all-supported" or "supported" value is passed as the first argument.
        elif [[ "${p_locale,,}" == ?(all?(-))supported ]]; then
            for langs in "${__BU_COMPILER__SUPPORTED_LANG_ARRAY[@]}"; do __language_array+=("${langs}"); done;

        else
            PrintErrorLine "${__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ERROR_MSG}" 'FULL';
            echo "${__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_1}" >&2;
            echo "'lang=en fr uk sv tk kl'" >&2;
            echo >&2;

            echo "${__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_2} ${__HIGHLIGHT},;|~_.:!§${__RESET}" >&2;
            echo >&2;

            echo "${__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_3}" >&2;

            PrintErrorLine "${__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG}" 'FULL';

            return 1;
        fi

        unset v_is_check_done;
    fi

    for language in "${__language_array[@]}"; do
        #------------------------
        #**** Loop variables ****
        local v_curr_locale;

        local __locale_file_path;
        local __locale_file_path_en;

        # Compiled file's informations.
        local __compiled_file_path_parent_dir;
        local __compiled_file_path;

        local __locale_print_code;

        local __locale_print_code__error;
        local __locale_print_code__newstep;
        local __locale_print_code__success;
        local __locale_print_code__warning;

        # If the "${_____value_of__compile_stable}" value was passed in the array of optional arguments.
        if [ -n "${__vArrayVal_compile_stable}" ]; then
            local __compiled_stable_file_parent_dir;
            local __compiled_stable_file_path;

            __compiled_stable_file_parent_dir="${__BU_ROOT_PATH}/install/.Bash-utils/compiled/stable";
        fi

        # If the "${_____value_of__no_shellcheck}" value was passed in the array of optional arguments.
        if [ -n "${__vArrayVal_no_shellcheck}" ]; then local __no_shellcheck="${__vArrayVal_no_shellcheck}"; fi

        #-------------------
        #**** Loop code ****
        v_curr_locale="${language}";
        __locale_file_path="${__BU_MODULE_INIT_TRANSLATIONS_PATH}/${v_curr_locale}.locale";
        __locale_file_path_en="${__BU_MODULE_INIT_TRANSLATIONS_PATH}/en.locale";

        __compiled_file_path_parent_dir="${__BU_ROOT_PATH}/install/.Bash-utils/compiled/unstable";
        __compiled_file_name="Bash-utils-${v_curr_locale}.sh"
        __compiled_file_path="${__compiled_file_path_parent_dir}/${__compiled_file_name}";

        __locale_print_code="${__HIGHLIGHT}[ LOCALE : ${v_curr_locale} [$(BU.Main.Locale.PrintLanguageName "${v_curr_locale^^}" 'cod,eng,usr,ori' 'no' 'false' 'false' 'true')]]";

        __locale_print_code__error="${__locale_print_code}${__ERROR}";
        __locale_print_code__newstep="${__locale_print_code}${__NEWSTEP}";
        __locale_print_code__success="${__locale_print_code}${__SUCCESS}";
        __locale_print_code__warning="${__locale_print_code}${__WARNING}";

        # Deleting the existing "Bash-utils.sh" file.
        if [ -f "${__BU_MAIN_FULL_FILE_PATH}" ] && [ -s "${__BU_MAIN_FULL_FILE_PATH}" ]; then true > "${__BU_MAIN_FULL_FILE_PATH}"; fi

        # -----------------------------------------------------------------------------
        # Checking if the "${v_curr_locale}" variable is a valid ISO 639-1 language code.
        if ! CheckISO639_1_LangCode "${v_curr_locale}"; then PrintErrorLine "${__locale_print_code__error} ${__BU_COMPILE__BAD_LANGUAGE_PASSED}" 'FULL'; ____loop_error='error'; break; fi

        # ------------------------------------
        # Framework compilation start message.
        PrintNewstepLine "$(printf "${__locale_print_code__newstep} ${__BU_COMPILE__BEGIN_FRAMEWORK_COMPILATION}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL';

        # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        # Writing the initializer script's english translations files content first into the file to generate (safeguard, as the english translation is the main supported language).

        if [ "${v_curr_locale,,}" != "en" ]; then
            PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT}" "${v_curr_locale}" "${__locale_file_path_en}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

            echo "${__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__EXPLAIN}"; echo;

            if [ ! -f "${__locale_file_path_en}" ]; then PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__ERROR}" "${v_curr_locale}" "${__locale_file_path_en}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break;
            else
                BU.Main.DevTools.ShellcheckVerif "${__locale_file_path_en}" "${__vArrayVal_compile_stable}" || local __err="error";

                WriteBU "${__locale_file_path_en}" "${__vArrayVal_display}" || local ____err="error";
            fi

            [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__ERROR}" "${v_curr_locale}" "${__locale_file_path_en}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

            PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__SUCCESS}" "${v_curr_locale}" "${__locale_file_path_en}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';
        fi

        # ------------------------------------------------------------------------------------------
        # Writing now the initializer script's translations files content into the file to generate.

        PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT}" "${v_curr_locale}" "${__locale_file_path}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

        if  [ ! -f "${__locale_file_path}" ]; then PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT}__ERROR" "${v_curr_locale}" "${__locale_file_path}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break;
        else
            BU.Main.DevTools.ShellcheckVerif "${__locale_file_path}" || local __err="error";

            WriteBU "${__locale_file_path}" "${__vArrayVal_display}" || local ____err="error";
        fi

        [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT}__ERROR" "${v_curr_locale}" "${__locale_file_path}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS}" "${v_curr_locale}" "${__locale_file_path}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';

        # ---------------------------------------------------------------------------------------
        # Writing the initializer script's configuration files content into the file to generate.
        PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

        for i in "${__BU_MODULE_INIT_CONFIGS_PATH}/"*.conf; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "${__vArrayVal_display}" || { local ____err="error"; break; };
        done

        [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';

        # -------------------------------------------------------------------
        # Writing the initializer script's content into the file to generate.
        PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

        if [ ! -f "${__BU_INITIALIZER_SCRIPT_PATH}" ]; then PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break;

        else
            BU.Main.DevTools.ShellcheckVerif "${__BU_INITIALIZER_SCRIPT_PATH}" || local __err="error";

            WriteBU "${__BU_INITIALIZER_SCRIPT_PATH}" "${__vArrayVal_display}";
        fi

        [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';

        # --------------------------------------------------------------------------
        # Writing the main module's library files content into the file to generate.
        PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

        for i in "${__BU_ROOT_PATH}/lib/functions/main/"*.lib; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "${__vArrayVal_display}" || { local ____err="error"; break; };
        done

        [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';

        # --------------------------------------------------------------------------------
        # Writing the main module's configuration files content into the file to generate.
        PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

        for i in "${__BU_ROOT_PATH}/install/.Bash-utils/config/modules/main/"*.conf; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "${__vArrayVal_display}" || { local ____err="error"; break; };
        done

        [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';

        # ---------------------------------------------------------------------------------
        # Writing the main module's initializer script's content into the file to generate.
        PrintNewstepLine "$(printf "${__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT}" "${__BU_MAIN_FULL_FILE_PATH}")" 'UPPER';

        for i in "${__BU_ROOT_PATH}/install/.Bash-utils/modules/main/"*; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "${__vArrayVal_display}" || { local ____err="error"; break; };
        done

        [ -n "${__err}" ] || [ -n "${____err}" ] && { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS}" "${__BU_MAIN_FULL_FILE_PATH}")" 'LOWER';

        # -------------------------------------------------------------------------------------------------------------------------
        # Now that the files were checked by Shellcheck, it's necessary to set the "${__BU_SHELLCHECKED}" variable's value to 'true'.
        # However, in case a stable version is compiled, it is better to check the files that were not checked. This condition is managed in the "BU.Main.DevTools.ShellcheckVerif()" function.
        if [ "${__BU_SHELLCHECKED}" == 'false' ]; then __BU_SHELLCHECKED='true'; fi


        # -----------------------------------------------------------------------------
        # Copying the content of the generated file into the localized language's file.
        PrintNewstepLine "$(printf "${__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE}" "${__BU_MAIN_FULL_FILE_PATH}" "${__compiled_file_path}")" 'UPPER';

        cp "${__BU_MAIN_FULL_FILE_PATH}" "${__compiled_file_path}" || { PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR}" "${__BU_MAIN_FULL_FILE_PATH}" "${__compiled_file_path}")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "${__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS}" "${__BU_MAIN_FULL_FILE_PATH}" "${__compiled_file_path}")" 'LOWER';

        if [ -n "${__vArrayVal_compile_stable}" ]; then
            PrintSuccessLine "$(printf "${__locale_print_code__success} ${__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_SUCCESS}" "${v_curr_locale} ($(BU.Main.Locale.PrintLanguageName "${v_curr_locale}" 'cod,eng,usr,ori' 'no' 'false' 'true' 'true'))")" 'FULL';
        else
            PrintSuccessLine "$(printf "${__locale_print_code__success} ${__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_SUCCESS}" "${v_curr_locale} ($(BU.Main.Locale.PrintLanguageName "${v_curr_locale}" 'cod,eng,usr,ori' 'no' 'false' 'true' 'true'))")" 'FULL';
        fi

        # --------------------------------------------------------------------------------------------------------------------------------
        # If the user did not decided to keep the original layout of the compiled file, optimizations are being done to the compiled file.
        if [ -z "$__vArrayVal_keep_raw_document_layout" ]; then
            # Erasing every pieces of code which prevent the direct execution of their host files
            if [ -z "${__vArrayVal_keep_exec_safeguards}" ]; then EraseSafeguardExecLines; fi

            # Erasing every comments from the newly created compiled file if the "${__vArrayVal_keep_comments}" value was passed for the execution of this compiler.
            if [ -z "${__vArrayVal_keep_comments}" ]; then EraseComments; fi

            # Calling the "()" function in order to write the description of the compiled file at its very beginning.
            # if [ -z "${new value to define}" ]; then WriteCommentCode; fi

            WriteCommentCode;
        fi

        # --------------------------------------------------------------
        # Printing the statistics of the newly generated localized file.

        printf "${__BU_COMPILE__LOCALIZED_FILE__STATS}\n" "${__compiled_file_path}"; echo;

        printf "${__BU_COMPILE__LOCALIZED_FILE__BYTES}\n" "$(BytesToHuman "$(wc -c < "${__compiled_file_path}")" 'NULL' 1000 "${____sys_lang}")";
        printf "${__BU_COMPILE__LOCALIZED_FILE__CHARS}\n" "$(wc -m < "${__compiled_file_path}")";
        printf "${__BU_COMPILE__LOCALIZED_FILE__LINES}\n" "$(wc -l < "${__compiled_file_path}")";
        printf "${__BU_COMPILE__LOCALIZED_FILE__WIDTH}\n" "$(wc -L < "${__compiled_file_path}")";
        printf "${__BU_COMPILE__LOCALIZED_FILE__WORDS}\n" "$(wc -w < "${__compiled_file_path}")";

        # Adding the newly compiled file in the compiled files list.
        __BU_ARRAY__COMPILED_FILES_LIST+=("${__compiled_file_path}");

        if [ -n "${__vArrayVal_compile_stable}" ]; then
            # Assigning values to the "${__compiled_stable_file_path}" variables.
            __compiled_stable_file_path="${__compiled_stable_file_parent_dir}/Bash-utils-stable-${v_curr_locale}.sh";

            # --------------------------------------------------------
            # STABLE FILE COMPILATION ONLY : Checking for any programming error in the compiled file.
            PrintNewstepLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS}" "${__compiled_file_path}")" 'UPPER';

            # Since the compiled file must be as bugless as possible, it is mandatory to check this file for any programming error with the 'shellcheck' command.
            if ! BU.Main.DevTools.ShellcheckVerif "${__compiled_file_path}" "${__vArrayVal_compile_stable}"; then
                PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__ERROR}" "${__compiled_file_path}")" 'FULL';

                ____loop_error='error'; break;
            fi

            PrintSuccessLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__SUCCESS}\n\n" "${__compiled_file_path}")" 'LOWER';

            # ----------------------------------------------------
            # STABLE FILE COMPILATION ONLY : Copying the compiled file into the "stable" directory.
            PrintNewstepLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE}" "${__compiled_file_path}" "${__compiled_stable_file_parent_dir}")" 'UPPER';

            if ! cp --verbose "${__compiled_file_path}" "${__compiled_stable_file_path}" ; then
                PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR}" "${__compiled_file_path}" "${__compiled_stable_file_parent_dir}")" 'FULL';
                echo >&2;

                echo "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_1}" >&2;
                echo >&2;

                echo "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_2}" >&2;
                echo >&2;

                ____loop_error='error'; break;
            else
                PrintSuccessLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__SUCCESS}" "${__compiled_file_path}" "${__compiled_stable_file_parent_dir}")" 'LOWER';
            fi

            # -----------------------------------------------------------------------
            # STABLE FILE COMPILATION ONLY : Setting the compiled file into read-only mode with the "chmod" command.
            PrintNewstepLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD}" "${__compiled_file_path}")" 'UPPER';

            if ! chmod --verbose -xw "${__compiled_stable_file_path}"; then
                PrintWarningLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING}" "${__compiled_stable_file_path}")";

                printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ASK}\n\n" "${__compiled_stable_file_path}" >&2;
                read -rp "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ENTER_YOUR_ANSWER}" __answer_copy_compiled_file_in_stable_dir;
                echo;

                case "${__answer_copy_compiled_file_in_stable_dir,,}" in
                    '1') echo "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_1}";;
                    '2' | *)
                        echo "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_2}" >&2; echo >&2;

                        # If other files were successfully compiled, but failed to be "chmoded".
                        if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -gt 0 ]; then
                            if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -eq 1 ]; then
                                echo "${__BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED}" >&2;

                                for files in "${__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}"; do
                                    echo "    - ${files}";
                                done
                            else
                                PrintFilesWhichWereNotChmoded "${__compiled_stable_file_parent_dir}";
                            fi
                        fi

                        ____loop_error='error';

                        break;;
                esac

                # Adding the failed file into the array of failed files.
                __BU_ARRAY__READ_ONLY_FAILED_FILES+=("${__compiled_stable_file_path}");

                PrintWarningLine "$(printf "${__BU_COMPILE__COMPILED_STABLE_FILE_WAS_NOT_SET_IN_READ_ONLY_MODE}" "${__compiled_stable_file_path}")" 'LOWER';
            else
                PrintSuccessLine "$(printf "${__BU_COMPILE__COMPILED_STABLE_FILE_WAS_SUCCESSFULLY_SET_IN_READ_ONLY_MODE}" "${__compiled_stable_file_path}")" 'LOWER';
            fi

            PrintSuccessLine "$(printf "${__locale_print_code__success} ${__BU_COMPILE__STABLE_COMPILED_FILE_IS_READY_TO_BE_USED}" "${__compiled_stable_file_path}")" 'FULL';

            # Adding the newly compiled stable file in the compiled stable files list.
            __BU_ARRAY__COMPILED_STABLE_FILES_LIST+=("${__compiled_stable_file_path}");
        fi
    done; if [ -n "${____loop_error}" ] && [ "${____loop_error}" = 'error' ]; then PrintErrorLine "$(printf "${__locale_print_code__error} ${__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED}" "${v_curr_locale} ($(BU.Main.Locale.PrintLanguageName "${v_curr_locale}" 'cod,eng,usr,ori' 'no' 'false' 'true' 'true'))")" 'FULL'; return 1; fi

    # If the framework was compiled in a stable version.
    if [ -n "${__vArrayVal_compile_stable}" ]; then
        # If one or more stable files were not successsfully "chmoded".
        if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -gt 0 ]; then
            # If only one file was not "chmoded".
            if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -eq 1 ]; then
                PrintSuccessLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ONE_FILE_NOT_CHMODED}" "${__compiled_stable_file_path}")";

                echo "${__BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED}";

                for files in "${__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}"; do
                    echo "    - ${files}"
                done

                echo >&2; printf "${__BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__ADVICE}\n" "${__compiled_stable_file_path}" >&2;

                # Else, if more than one file were not successfully "chmoded".
            else
                #**** Variables ****
                local v_index=0;
                local v_file_line;

                #**** Code ****
                if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -lt 5 ]; then
                    if [ "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}" == "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" ]; then
                        PrintWarningLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__EVERY_FILES_NOT_CHMODED}" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")";
                    else
                        PrintWarningLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__MULTIPLE_FILES_NOT_CHMODED}" "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")";
                    fi
                else
                    if [ "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}" == "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" ]; then
                        PrintWarningLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__EVERY_FILES_NOT_CHMODED}" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")" 'FULL';
                    else
                        PrintWarningLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__MULTIPLE_FILES_NOT_CHMODED}" "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")" 'FULL';
                    fi
                fi

                PrintFilesWhichWereNotChmoded "${__compiled_stable_file_parent_dir}";
            fi
        else
            PrintSuccessLine "$(printf "${__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__SUCCESS}" "${#__BU_ARRAY__COMPILED_FILES_LIST[@]}")";
        fi
    fi

    PrintSuccessLine "${__BU_COMPILE__END_OF_FRAMEWORK_COMPILATION}" 'FULL';

    return 0;
}

# Support of the arguments when this script is executed with the two awaited arguments.
if      [ -n "${__BU_ARG_LANG}" ]; then CompileInSingleFile "${__BU_ARG_LANG}" "${@}" || { exit 1; };
else
    CompileInSingleFile "lang=en,fr" "${@}" || { exit 1; };
fi

exit 0;
