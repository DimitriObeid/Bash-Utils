#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL VARIABLES DEFINITION #############################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# Language
__BU_ARG_LANG=$1;

# Display more informations about the generation of the localized wrapped script.
__BU_ARG_DISP=$2;

# Do not check for programming errors in the files (not recommended, unless you know what you are doing).
__BU_ARG_NO_SHELLCHECK=$3;

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

## PATHS

# Getting the path of the library's root path from the path file.
if [ -d '/usr/local/lib/Bash-utils' ]; then __BU_ROOT_PATH='/usr/local/lib/Bash-utils';

elif [ -d "$HOME/.Bash-utils/Bash-utils" ]; then __BU_ROOT_PATH="$HOME/.Bash-utils/Bash-utils";

else __BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")";

fi

if [ -f "$HOME/Bash-utils-init.sh" ]; then __BU_INITIALIZER_SCRIPT_PATH="$HOME/Bash-utils-init.sh";

else __BU_INITIALIZER_SCRIPT_PATH="$__BU_ROOT_PATH/Bash-utils-init.sh";

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

__GREEN="$(tput setaf 2)";

__ORANGE="$(tput setaf 166)";

__RED="$(tput setaf 9)";

__RESET="$(tput sgr0)";

__YELLOW="$(tput setaf 11)";

# -----------------------------------------------

## MESSAGE TRANSLATIONS

# FRENCH - FRANÇAIS
if [[ "$LANG" = fr_* ]]; then
    __BU_COMPILE__SHELLCHECK__MISSING="${__RED}LA COMMANDE ${__CYAN}SHELLCHECK${__RED} N'EST PAS INSTALLÉE SUR VOTRE SYSTÈME !${__RESET}";
    __BU_COMPILE__SHELLCHECK__DISABLED="AVERTISSEMENT : IL N'EST PAS RECOMMANDÉ D'EXÉCUTER CE SCRIPT SANS LA COMMANDE SHELLCHECK, À MOINS QUE VOUS NE SACHIEZ EXACTEMENT CE QUE VOUS FAITES !";

    __BU_COMPILE__SHELLCHECK__VERIFICATION="${__ORANGE}Vérification d'erreurs de programmation dans le fichier ${__CYAN}%s${__ORANGE}${__RESET}";
    __BU_COMPILE__SHELLCHECK__FAIL="${__RED}Une ou plusieurs erreurs de programmation ont été détectées dans le fichier ${__CYAN}%s${__RED} !${__RESET}";
    __BU_COMPILE__SHELLCHECK__SUCCESS="${__GREEN}Le fichier ${__CYAN}%s${__GREEN} ne contient aucune erreur de programmation";

    __BU_COMPILE__BAD_LANGUAGE_PASSED="${__RED}Un code de langue ISO 639-1 non-supporté a été passé en premier argument de la fonction ${__CYAN}CompileInSingleFile()${__RED} !${__RESET}";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de traduction du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's translations files content first into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__CYAN}%s${__ORANGE} DU FICHIER ${__CYAN}%s${__ORANGE} VERS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__CYAN}%s${__RED} DU FICHIER ${__CYAN}%s${__RED} VERS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__CYAN}%s${__GREEN} DU FICHIER ${__CYAN}%s${__GREEN} VERS LE FICHIER ${__CYAN}%s${__GREEN}";

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

    # -------------------------------------------------------------------------------------------------------------------------------------------------
    # Copie du contenu du fichier généré dans le fichier localisé [-----] Copying the content of the generated file into the localized language's file.
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE="COPIE DU CONTENU DU FICHIER ${__CYAN}%s${__ORANGE} VERS LE FICHIER ${__CYAN}%s${__ORANGE}";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR="ÉCHEC DE LA COPIE DU CONTENU DU FICHIER ${__CYAN}%s${__RED} VERS LE FICHIER ${__CYAN}%s${__RED}";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DU FICHIER ${__CYAN}%s${__GREEN} VERS LE FICHIER ${__CYAN}%s${__GREEN}";

    # -----------------------------------------------------------------------------------------------------------------------------------------
    # Affichage des statistiques du fichier localisé nouvellement généré [-----] Printing the statistics of the newly generated localized file.
    __BU_COMPILE__LOCALIZED_FILE__STATS="Statistiques du fichier ${__CYAN}%s${__RESET} :";
    __BU_COMPILE__LOCALIZED_FILE__BYTES="Taille en octets               : %s";
    __BU_COMPILE__LOCALIZED_FILE__CHARS="Nombre de caractères           : %s caractères";
    __BU_COMPILE__LOCALIZED_FILE__LINES="Nombre le lignes               : %s lignes";
    __BU_COMPILE__LOCALIZED_FILE__WIDTH="Largeur d'affichage maximale   : %s colonnes";
    __BU_COMPILE__LOCALIZED_FILE__WORDS="Nombre de mots                 : %s mots";

    __BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED="IMPOSSIBLE DE CRÉER UNE VERSION DU FRAMEWORK CONTENANT LES PRINCIPALES RESSOURCESENCAPSULÉES EN UN SIMPLE FICHIER DANS CETTE LANGE : $__BU_ARG_LANG !!!";

# -------------------------------------------------------------------------------
# SINCE NO OTHER LANGUAGES ARE SUPPORTED, ENGLISH IS SET AS THE DEFAULT LANGUAGE.
# -------------------------------------------------------------------------------
else
    __BU_COMPILE__SHELLCHECK__MISSING="${__RED}THE ${__CYAN}SHELLCHECK${__RED} COMMAND IS NOT INSTALLED ON YOUR SYSTEM!${__RESET}";
    __BU_COMPILE__SHELLCHECK__DISABLED="WARNING: IT IS NOT RECOMMENDED TO RUN THIS SCRIPT WITHOUT THE SHELLCHECK COMMAND, UNLESS YOU KNOW EXACTLY WHAT YOU ARE DOING!";

    __BU_COMPILE__SHELLCHECK__VERIFICATION="${__ORANGE}Verifying the programming errors in the ${__CYAN}%s${__ORANGE} file${__RESET}";
    __BU_COMPILE__SHELLCHECK__FAIL="${__RED}One or more programming errors were detected in the ${__CYAN}%s${__RED} file!${__RESET}";
    __BU_COMPILE__SHELLCHECK__SUCCESS="${__GREEN}The ${__CYAN}%s${__GREEN} file doen't contain any programming errors${__RESET}";

    __BU_COMPILE__BAD_LANGUAGE_PASSED="${__RED}An unsupported language ISO 639-1 code was passed as ${__CYAN}CompileInSingleFile()${__RED} function's first argument ${__RESET}";

    # --------------------------------------------------------------------------------------------
    # Writing the initializer script's translations files content first into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT="COPYING THE INITIALIZER SCRIPT'S TRANSLATIONS FILES CONTENT FROM THE ${__CYAN}%s${__ORANGE} LANGUAGE FROM THE ${__CYAN}%s${__ORANGE} FILE INTO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S TRANSLATIONS FILES FROM THE ${__CYAN}%s${__RED} LANGUAGE FROM THE ${__CYAN}%s${__RED} FILE INTO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S TRANSLATIONS FILES FROM THE ${__CYAN}%s${__GREEN} LANGUAGE FROM THE ${__CYAN}%s${__GREEN} FILE INTO THE ${__CYAN}%s${__GREEN} FILE";

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

    # -----------------------------------------------------------------------------
    # Copying the content of the generated file into the dedicated language's file.
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE="COPYING THE CONTENT OF THE ${__CYAN}%s${__ORANGE} FILE TO THE ${__CYAN}%s${__ORANGE} FILE";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR="FAILED TO COPY THE CONTENT OF THE ${__CYAN}%s${__RED} FILE TO THE ${__CYAN}%s${__RED} FILE";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS="SUCCESSFULLY COPIED THE CONTENT OF THE ${__CYAN}%s${__GREEN} FILE TO THE ${__CYAN}%s${__GREEN} FILE";

    # --------------------------------------------------------------
    # Printing the statistics of the newly generated localized file.
    __BU_COMPILE__LOCALIZED_FILE__STATS="${__CYAN}%s${__RESET} file statistics :";
    __BU_COMPILE__LOCALIZED_FILE__BYTES="Size in bytes           : %s";
    __BU_COMPILE__LOCALIZED_FILE__CHARS="Number of characters    : %s characters";
    __BU_COMPILE__LOCALIZED_FILE__LINES="Number of lines         : %s lines";
    __BU_COMPILE__LOCALIZED_FILE__WIDTH="Maximum display width   : %s columns";
    __BU_COMPILE__LOCALIZED_FILE__WORDS="Number of words         : %s words";

    __BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED="IMPOSSIBLE TO CREATE A VERSION OF THE FRAMEWORK CONTAINING THE MAIN RESOURCES ENCAPSULATED IN A SINGLE FILE IN THIS LANGUAGE : $__BU_ARG_LANG !!!";
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
function PrintSuccessLine() { echo; printf "%s" "$__GREEN"; PrintLine; printf "%s" "$__RESET"; echo "${__GREEN}$1${__RESET}"; printf "%s" "$__GREEN"; PrintLine; printf "%s" "$__RESET"; echo; }

function PrintWarningLine() { echo; printf "%s" "$__YELLOW"; PrintLine; printf "%s" "$__RESET"; echo "${__YELLOW}$1${__RESET}"; printf "%s" "$__YELLOW"; PrintLine; printf "%s" "$__RESET"; echo; }

# Converts a byte count to a human readable format in IEC binary notation (base-1024 (eg : GiB)), rounded to two
# decimal places for anything larger than a byte. Switchable to padded format and base-1000 (eg : MB) if desired.

# Initial source of this AWK script (since it's not mine and I added more informations as comments) :
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BytesToHuman()
{
    #**** Parameters ****
    local L_BYTES="${1:-0}";    # Int               - Default : 0       - Raw size in bytes.
    local L_PAD="${2:-no}";     # String            - Default : no      - Allow result display padding.
    local L_BASE="${3:-1024}";  # Int               - Default : 1024    - Base (1000 (metric) or 1024 (binary notation))
    local V_LANG="${4:-en}";    # ISO 639-1 code    - Default : en      - Language, for localizing the byte count (default language : English).

    #**** Code ****
    if [ "${L_PAD^^}" == 'NULL' ]; then L_PAD='no'; fi

    # Creating a command substitution to calculate the byte count according to the values passed as arguments, with an AWK script.
    local BYTESTOHUMAN_RESULT; BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" -v lang="${V_LANG}" 'function human(x, pad, base, lang) {

        # If the desired base format is not the binary prefix, then the base format used will be the metric one.
        if(base!=1024)base=1000

        # Setting the prefixes list (K = kilo, M = mega, G = giga, T = tera, P = peta, E = exa, Z = zeta, Y = yotta), and corrected the inversion of the Exa with Peta, and Zeta with Yotta.
        if (lang == "fr") {
            # Ternary condition : si le format de base utilise le préfixe binaire, cette unité "io" ([préfixe]bioctet) est affichée après la valeur. Sinon, cette unité "o" ([préfixe]octet) est affichée après la valeur.
            basesuf=(base==1024)?"io":"o"

            s="oKMGTPEZY"
        } else {
            # Condition ternaire : if the base format uses the binary prefix, then the "iB" ([prefix]bibyte) unit is displayed after the value. Else the "[prefix]byte" unit is displayed after the value.
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

    printf "%s" "$BYTESTOHUMAN_RESULT";

    return 0;
}

# Printing the language name in English and in its own language.
function PrintLanguageName()
{
	#**** Parameters ****
	local p_code=${1:-NULL};    # String    - Default : NULL    - Language in which the file must be translated.

	#**** Code ****
	  if [ "${p_code,,}" == 'aa' ]; then printf "%s : Afar | Afaraf"                                				"${p_code,,}";
	elif [ "${p_code,,}" == 'ab' ]; then printf "%s : Abkhazian | Аҧсуа"                            				"${p_code,,}";
	elif [ "${p_code,,}" == 'ae' ]; then printf "%s : Avestan | Avesta"                             				"${p_code,,}";
	elif [ "${p_code,,}" == 'af' ]; then printf "%s : Afrikaans | Afrikaans"                        				"${p_code,,}";
	elif [ "${p_code,,}" == 'ak' ]; then printf "%s : Akan | Akan"                                  				"${p_code,,}";
	elif [ "${p_code,,}" == 'am' ]; then printf "%s : Amharic | አማርኛ"                       						"${p_code,,}";
	elif [ "${p_code,,}" == 'an' ]; then printf "%s : Aragonese | Aragonés"                         				"${p_code,,}";
	elif [ "${p_code,,}" == 'ar' ]; then printf "%s : Arabic | العربية"                                                "${p_code,,}";
	elif [ "${p_code,,}" == 'as' ]; then printf "%s : Assamese | অসমীয়া"                           					"${p_code,,}";
	elif [ "${p_code,,}" == 'av' ]; then printf "%s : Avaric | авар мацӀ ; магӀарул мацӀ"							"${p_code,,}";
	elif [ "${p_code,,}" == 'ay' ]; then printf "%s : Aymara | Aymar aru" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'az' ]; then printf "%s : Azerbaijani | Azərbaycan dili" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'ba' ]; then printf "%s : Bashkir | башҡорт теле" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'be' ]; then printf "%s : Belarusian | Беларуская" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'bg' ]; then printf "%s : Bulgarian | български език" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'bh' ]; then printf "%s : Bihari | भोजपुरी" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'bi' ]; then printf "%s : Bislama | Bislama" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'bm' ]; then printf "%s : Bambara | Bamanankan" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'bn' ]; then printf "%s : Bengali | বাংলা" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'bo' ]; then printf "%s : Tibetan | བོད་ཡིག" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'br' ]; then printf "%s : Breton | Brezhoneg" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'bs' ]; then printf "%s : Bosnian | Bosanski jezik" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'ca' ]; then printf "%s : Catalan | Català" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ce' ]; then printf "%s : Chechen | нохчийн мотт" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ch' ]; then printf "%s : Chamorro | Chamoru" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'co' ]; then printf "%s : Corsican | Corsu ; lingua corsa" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'cr' ]; then printf "%s : cree | ᓀᐦᐃᔭᐍᐏᐣ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'cs' ]; then printf "%s : Czech | Česky ; čeština" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'cu' ]; then printf "%s : Old Church Slavonic | Словѣньскъ" 							"${p_code,,}";
	elif [ "${p_code,,}" == 'cv' ]; then printf "%s : Chuvash | чӑваш чӗлхи"										"${p_code,,}";
	elif [ "${p_code,,}" == 'cy' ]; then printf "%s : Welsh | Cymraeg" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'da' ]; then printf "%s : Danish | Dansk" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'de' ]; then printf "%s : German | Deutsch" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'dv' ]; then printf "%s : Divehi | ދިވެހި" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'dz' ]; then printf "%s : Dzongkha | རྫོང་ཁ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ee' ]; then printf "%s : Ewe | Ɛʋɛgbɛ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'el' ]; then printf "%s : Greek | Ελληνικά" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'en' ]; then printf "%s : English | English" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'eo' ]; then printf "%s : Esperanto | Esperanto" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'es' ]; then printf "%s : Spanish | Español" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'et' ]; then printf "%s : Estonian | Eesti keel" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'eu' ]; then printf "%s : Basque | Euskara" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'fa' ]; then printf "%s : Persian | فارسی" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ff' ]; then printf "%s : Fulah | Fulfulde"				 								"${p_code,,}";
	elif [ "${p_code,,}" == 'fi' ]; then printf "%s : Finnish | Suomen kieli" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'fj' ]; then printf "%s : Fijian | Vosa Vakaviti" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'fo' ]; then printf "%s : Faroese | Føroyskt" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'fr' ]; then printf "%s : French | Français"			 								"${p_code,,}";
	elif [ "${p_code,,}" == 'fy' ]; then printf "%s : Western Frisian | Frysk" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ga' ]; then printf "%s : Irish | Gaeilge" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'gd' ]; then printf "%s : Scottish Gaelic | Gàidhlig"			 						"${p_code,,}";
	elif [ "${p_code,,}" == 'gl' ]; then printf "%s : Galician | Galego" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'gn' ]; then printf "%s : Guarani | Avañe'ẽ" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'gu' ]; then printf "%s : Gujarati | ગુજરાતી" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'gv' ]; then printf "%s : Manx | Ghaelg"			 									"${p_code,,}";
	elif [ "${p_code,,}" == 'ha' ]; then printf "%s : Hausa | هَوُسَ" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'he' ]; then printf "%s : Hebrew | עברית" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'hi' ]; then printf "%s : Hindi | हिन्दी ; हिंदी" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ho' ]; then printf "%s : Hiri Motu | Hiri Motu" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'hr' ]; then printf "%s : Croatian | Hrvatski" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ht' ]; then printf "%s : Haitian | Kreyòl ayisyen" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'hu' ]; then printf "%s : Hungarian | magyar " 											"${p_code,,}";
	elif [ "${p_code,,}" == 'hy' ]; then printf "%s : Armenian | Հայերեն" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'hz' ]; then printf "%s : Herero | Otjiherero" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ia' ]; then printf "%s : Interlingue | Interlingua" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'id' ]; then printf "%s : Indonesian | Bahasa Indonesia" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'ie' ]; then printf "%s : Interlingue | Interlingue" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'ig' ]; then printf "%s : Igbo | Igbo" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'ii' ]; then printf "%s : Sichuan Yi | ꆇꉙ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ik' ]; then printf "%s : Inupiaq | Iñupiaq ; Iñupiatun" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'io' ]; then printf "%s : Ido | Ido" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'is' ]; then printf "%s : Icelandic | Íslenska" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'it' ]; then printf "%s : Italian | Italiano" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'iu' ]; then printf "%s : Inuktitut | ᐃᓄᒃᑎᑐᑦ" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ja' ]; then printf "%s : Japanese | 日本語 (にほんご)" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'jv' ]; then printf "%s : Javanese | Basa Jawa" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ka' ]; then printf "%s : Georgian | ქართული" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'kg' ]; then printf "%s : Kongo | KiKongo" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ki' ]; then printf "%s : Kikuyu | Gĩkũyũ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'kj' ]; then printf "%s : Kwanyama | Kuanyama" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'kk' ]; then printf "%s : Kazakh | Қазақ тілі" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'kl' ]; then printf "%s : Greenlandic | Kalaallisut ; kalaallit oqaasii" 				"${p_code,,}";
	elif [ "${p_code,,}" == 'km' ]; then printf "%s : Khmer | ភាសាខ្មែរ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'kn' ]; then printf "%s : Kannada | ಕನ್ನಡ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ko' ]; then printf "%s : Korean | 한국어 (韓國語) ; 조선말 (朝鮮語)" 						"${p_code,,}";
	elif [ "${p_code,,}" == 'kr' ]; then printf "%s : Kanuri | Kanuri"												"${p_code,,}";
	elif [ "${p_code,,}" == 'ks' ]; then printf "%s : Kashmiri | कश्मीरी ; كشميري" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ku' ]; then printf "%s : Kurdish | Kurdî ; كوردی" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'kv' ]; then printf "%s : Komi | коми кыв" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'kw' ]; then printf "%s : Cornish | Kernewek" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ky' ]; then printf "%s : Kirghiz | кыргыз тили" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'la' ]; then printf "%s : Latin | Latine ; lingua latina" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'lb' ]; then printf "%s : Luxembourgish | Lëtzebuergesch" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'lg' ]; then printf "%s : Ganda | Luganda" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'li' ]; then printf "%s : Limburgish | Limburgs" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ln' ]; then printf "%s : Lingala | Lingála" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'lo' ]; then printf "%s : Lao | ພາສາລາວ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'lt' ]; then printf "%s : Lithuanian | Lietuvių kalba" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'lu' ]; then printf "%s : Luba | tshiluba" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'lv' ]; then printf "%s : Latvian | Latviešu valoda" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'mg' ]; then printf "%s : Malagasy | Fiteny malagasy" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'mh' ]; then printf "%s : Marshallese | Kajin M̧ajeļ" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'mi' ]; then printf "%s : Māori | Te reo Māori" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'mk' ]; then printf "%s : Macedonian | македонски јазик" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'ml' ]; then printf "%s : Malayalam | മലയാളം" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'mn' ]; then printf "%s : Mongolian | Монгол" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'mo' ]; then printf "%s : Moldavian | лимба молдовеняскэ" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'mr' ]; then printf "%s : Marathi | मराठी" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ms' ]; then printf "%s : Malay | Bahasa Melayu ; بهاس ملايو" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'mt' ]; then printf "%s : Maltese | Malti" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'my' ]; then printf "%s : Burmese | ဗမာစာ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'na' ]; then printf "%s : Nauru | Ekakairũ Naoero" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'nb' ]; then printf "%s : Norwegian Bokmål | Norsk bokmål" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'nd' ]; then printf "%s : North Ndebele | isiNdebele" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'ne' ]; then printf "%s : Nepali | नेपाली" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ng' ]; then printf "%s : Ndonga | Owambo" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'nl' ]; then printf "%s : Dutch | Nederlands" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'nn' ]; then printf "%s : Norwegian Nynorsk | Norsk nynorsk" 							"${p_code,,}";
	elif [ "${p_code,,}" == 'no' ]; then printf "%s : Norwegian | Norsk" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'nr' ]; then printf "%s : South Ndebele | Ndébélé" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'nv' ]; then printf "%s : Navajo | Diné bizaad ; Dinékʼehǰí" 							"${p_code,,}";
	elif [ "${p_code,,}" == 'ny' ]; then printf "%s : Chichewa | ChiCheŵa ; chinyanja" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'oc' ]; then printf "%s : Occitan | Occitan" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'oj' ]; then printf "%s : Ojibwa | ᐊᓂᔑᓈᐯᒧᐎᓐ" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'om' ]; then printf "%s : Oromo | Afaan Oromoo" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'or' ]; then printf "%s : Oriya | ଓଡ଼ିଆ" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'os' ]; then printf "%s : Ossetian | Ирон ӕвзаг" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'pa' ]; then printf "%s : Panjabi | ਪੰਜਾਬੀ ; پنجابی" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'pi' ]; then printf "%s : Pāli | पािऴ" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'pl' ]; then printf "%s : Polish | Polski" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'ps' ]; then printf "%s : Pashto | پښتو" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'pt' ]; then printf "%s : Portuguese | Português" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'qu' ]; then printf "%s : Quechua | Runa Simi ; Kichwa" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'rc' ]; then printf "%s : Reunionese | Kréol Rénioné" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'rm' ]; then printf "%s : Romansh | Rumantsch grischun" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'rn' ]; then printf "%s : Kirundi | kiRundi" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ro' ]; then printf "%s : Romanian | Română" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ru' ]; then printf "%s : Russian | русский язык" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'rw' ]; then printf "%s : Kinyarwanda | Kinyarwanda" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'sa' ]; then printf "%s : Sanskrit | संस्कृतम्" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'sc' ]; then printf "%s : Sardinian | sardu" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'sd' ]; then printf "%s : Sindhi | सिन्धी ; سنڌي، سندھی" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'se' ]; then printf "%s : Northern Sami | Davvisámegiella" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'sg' ]; then printf "%s : Sango | Yângâ tî sängö" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'sh' ]; then printf "%s : Serbo-Croatian | srpskohrvatski jezik ; српскохрватски језик" "${p_code,,}";
	elif [ "${p_code,,}" == 'si' ]; then printf "%s : Sinhalese| සිංහල" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'sk' ]; then printf "%s : Slovak | Slovenčina" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'sl' ]; then printf "%s : Slovenian | Slovenščina" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'sm' ]; then printf "%s : Samoan | Gagana fa'a Samoa"									"${p_code,,}";
	elif [ "${p_code,,}" == 'sn' ]; then printf "%s : Shona | chiShona" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'so' ]; then printf "%s : Somali | Soomaaliga ; af Soomaali"							"${p_code,,}";
	elif [ "${p_code,,}" == 'sq' ]; then printf "%s : Albanian | Shqip " 											"${p_code,,}";
	elif [ "${p_code,,}" == 'sr' ]; then printf "%s : Serbian | српски језик" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ss' ]; then printf "%s : Swati| SiSwati" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'st' ]; then printf "%s : Sotho | seSotho" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'su' ]; then printf "%s : Sundanese | Basa Sunda" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'sv' ]; then printf "%s : Swedish | Svenska" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'sw' ]; then printf "%s : Swahili | Kiswahili" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ta' ]; then printf "%s : Tamil | தமிழ்"													"${p_code,,}";
	elif [ "${p_code,,}" == 'te' ]; then printf "%s : Telugu | తెలుగు" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'tg' ]; then printf "%s : Tajik | тоҷикӣ ; toğikī ; تاجیکی" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'th' ]; then printf "%s : Thai | ไทย" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'ti' ]; then printf "%s : Tigrinya | ትግርኛ" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'tk' ]; then printf "%s : Turkmen | Türkmen ; Түркмен" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'tl' ]; then printf "%s : Tagalog | Tagalog" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'tn' ]; then printf "%s : Tswana | seTswana" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'to' ]; then printf "%s : Tonga | faka Tonga" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'tr' ]; then printf "%s : Turkish | Türkçe" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'ts' ]; then printf "%s : Tsonga | xiTsonga" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'tt' ]; then printf "%s : Tatar | татарча ; tatarça ; تاتارچا"                             "${p_code,,}";
	elif [ "${p_code,,}" == 'tw' ]; then printf "%s : Twi | Twi" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'ty' ]; then printf "%s : Tahitian | Reo Mā\`ohi" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'ug' ]; then printf "%s : Uighur | Uyƣurqə ; ئۇيغۇرچ"										"${p_code,,}";
	elif [ "${p_code,,}" == 'uk' ]; then printf "%s : Ukrainian | українська мова" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'ur' ]; then printf "%s : Urdu | اردو" 													"${p_code,,}";
	elif [ "${p_code,,}" == 'uz' ]; then printf "%s : Uzbek | O'zbek ; Ўзбек ; أۇزبېك"								"${p_code,,}";
	elif [ "${p_code,,}" == 've' ]; then printf "%s : Venda | tshiVenḓa" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'vi' ]; then printf "%s : Vietnamese | Tiếng Việt" 										"${p_code,,}";
	elif [ "${p_code,,}" == 'vo' ]; then printf "%s : Volapük | Volapük" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'wa' ]; then printf "%s : Walon | Walloon" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'wo' ]; then printf "%s : Wolof | Wollof" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'xh' ]; then printf "%s : Xhosa | isiXhosa" 											"${p_code,,}";
	elif [ "${p_code,,}" == 'yi' ]; then printf "%s : Yiddish | ייִדיש" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'yo' ]; then printf "%s : Yoruba | Yorùbá" 												"${p_code,,}";
	elif [ "${p_code,,}" == 'za' ]; then printf "%s : Zhuang | Saɯ cueŋƅ ; Saw cuengh" 								"${p_code,,}";
	elif [ "${p_code,,}" == 'zh' ]; then printf "%s : Chinese | 中文, 汉语, 漢語" 									"${p_code,,}";
	elif [ "${p_code,,}" == 'zu' ]; then printf "%s : Zulu | isiZulu"												"${p_code,,}";
	  fi;

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
    if [ "$__BU_SHELLCHECKED" == 'false' ]; then
        printf "$__BU_COMPILE__SHELLCHECK__VERIFICATION" "$p_path"; echo;

        if ! shellcheck "$p_path"; then ShellcheckError "$p_path"; return 1; fi

        # shellcheck disable=SC2059
        printf "$__BU_COMPILE__SHELLCHECK__SUCCESS" "$p_path"; echo;

        echo;
    fi

    return 0;
}

# Writing the target file's content into the file to generate.
function WriteBU()
{
    #**** Parameters ****
    local p_filepath=${1:-\$'0'}	# String    - Default : NULL    - Path to the file whose content should be written to the "$__BU_MAIN_FULL_FILE_PATH" file.
    local p_display=${2:-no};   	# String    - Default : no      - Display the content of each file when it is read and written into the file to generate.

	#**** Variables ****
	local v_content;				# Content of the "$p_filepath" file to write in the "$__BU_MAIN_FULL_FILE_PATH" file.

	v_content="$(cat "$p_filepath")";

    #**** Code ****
    if      [ "${p_display,,}" == 'yes' ]; then echo -e "# $v_content" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { PrintErrorLine "UNABLE TO WRITE THE FILE'S CONTENT IN THE FILE TO GENERATE ! Please check its path and if it exists."; return 1; };
    else                                        echo -e "# $v_content" >>       "$__BU_MAIN_FULL_FILE_PATH" || { PrintErrorLine "UNABLE TO WRITE THE FILE'S CONTENT IN THE FILE TO GENERATE ! Please check its path and if it exists."; return 1; };
    fi
}

# ----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Checking first if Shellcheck is installed in order to check for code errors.
if ! command -v shellcheck; then PrintErrorLine "$__BU_COMPILE__SHELLCHECK__MISSING" >&2; exit 1; fi

# WARNING ! It's not recommended to disable the checkings of each file, unless you know what you are doing
if [[ "${__BU_ARG_NO_SHELLCHECK,,}" == no?(-)shell?(-)check ]]; then
    PrintWarningLine "$__BU_COMPILE__SHELLCHECK__DISABLED";

    sleep 1;

    __BU_SHELLCHECKED='true';
else
    # To avoid launching Shellcheck each time another file is generated in another language, it's necessary to check if the files were checked.
    __BU_SHELLCHECKED='false';
fi

# Files compilation function.
# shellcheck disable=SC2059
function CompileInSingleFile()
{
    #**** Parameters ****
    local p_locale=${1:-NULL};  # String    - Default : NULL    - Language in which the file must be translated.
    local p_display=${2:-no};   # String    - Default : no      - Display the content of each file when it is read and written into the file to generate.

    #**** Variables ****
    local __locale_file_path="$__BU_MODULE_INIT_TRANSLATIONS_PATH/${p_locale}.locale"
    local __locale_final_file="$__BU_ROOT_PATH/Bash-utils-${p_locale}.sh"
	local __locale_print_code;

	__locale_print_code="[ LOCALE : $(PrintLanguageName "${p_locale^^}") ]";

    #**** Code ****
    # Deleting the existing "Bash-utils.sh" file.
    if [ -f "$__BU_MAIN_FULL_FILE_PATH" ] && [ -s "$__BU_MAIN_FULL_FILE_PATH" ]; then true > "$__BU_MAIN_FULL_FILE_PATH"; fi

    # Checking if the "$p_locale" variable is a valid ISO 639-1 language code.
    if ! CheckISO639_1_LangCode "$p_locale"; then PrintErrorLine "$__BU_COMPILE__BAD_LANGUAGE_PASSED"; return 1; fi

    # --------------------------------------------------------------------------------------------
    # Writing the initializer script's translations files content first into the file to generate.

    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT" "$p_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")";

    if  [ ! -f "$__locale_file_path" ]; then PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR" "$p_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")" >&2; return 1;
    else
        ShellcheckVerif "$__locale_file_path" || local __err="error";

        WriteBU "$__locale_file_path" "$p_display" || local ____err="error";
    fi

    [ -n "$__err" ] || [ -n "$____err" ] && PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR" "$p_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")";

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS" "$p_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")";

    # ---------------------------------------------------------------------------------------
    # Writing the initializer script's configuration files content into the file to generate.
    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")";

    for i in "$__BU_MODULE_INIT_CONFIGS_PATH/"*.conf; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")"; return 1; };

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")";

    # -------------------------------------------------------------------
    # Writing the initializer script's content into the file to generate.
    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")";

    if [ ! -f "$__BU_INITIALIZER_SCRIPT_PATH" ]; then PrintErrorLine ""; return 1;
    else
        ShellcheckVerif "$__BU_INITIALIZER_SCRIPT_PATH" || local __err="error";

        WriteBU "$__BU_INITIALIZER_SCRIPT_PATH" "$p_display";
    fi

    [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")"; return 1; };

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")";

    # --------------------------------------------------------------------------
    # Writing the main module's library files content into the file to generate.
    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")";

    for i in "$__BU_ROOT_PATH/lib/functions/main/"*.lib; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")"; return 1; };

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")";

    # --------------------------------------------------------------------------------
    # Writing the main module's configuration files content into the file to generate.
    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")";

    for i in "$HOME/.Bash-utils/config/modules/main/"*.conf; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$__locale_print_code $(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")"; return 1; };

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")";

    # ---------------------------------------------------------------------------------
    # Writing the main module's initializer script's content into the file to generate.
    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")";

    for i in "$HOME/.Bash-utils/modules/main/"*; do
        ShellcheckVerif "${i}" || { local __err="error"; break; };

        WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
    done

    [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")"; return 1; };

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")";

    # -------------------------------------------------------------------------------------------------------------------------
    # Now that the files were checked by Shellcheck, it's necessary to set the "$__BU_SHELLCHECKED" variable's value to 'true'.
    if [ "$__BU_SHELLCHECKED" == 'false' ]; then __BU_SHELLCHECKED='true'; fi

    # -----------------------------------------------------------------------------
    # Copying the content of the generated file into the localized language's file.
    PrintNewstepLine "$(printf "$__locale_print_code $__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE" "$__BU_MAIN_FULL_FILE_PATH" "$__locale_final_file")";

    cp "$__BU_MAIN_FULL_FILE_PATH" "$__locale_final_file" || { PrintErrorLine "$(printf "$__locale_print_code $__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR" "$__BU_MAIN_FULL_FILE_PATH" "$__locale_final_file")"; return 1; };

    PrintSuccessLine "$(printf "$__locale_print_code $__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH" "$__locale_final_file")";

    # --------------------------------------------------------------
    # Printing the statistics of the newly generated localized file.

    # Getting the current system language.
    local ____sys_lang="$(echo "${LANG}" | cut -d _ -f1)";

    printf "$__BU_COMPILE__LOCALIZED_FILE__STATS\n" "$__locale_final_file"; echo;

    printf "$__BU_COMPILE__LOCALIZED_FILE__BYTES\n" "$(BytesToHuman "$(wc -c < "$__locale_final_file")" 'NULL' 1000 "$____sys_lang")";
    printf "$__BU_COMPILE__LOCALIZED_FILE__CHARS\n" "$(wc -m < "$__locale_final_file")";
    printf "$__BU_COMPILE__LOCALIZED_FILE__LINES\n" "$(wc -l < "$__locale_final_file")";
    printf "$__BU_COMPILE__LOCALIZED_FILE__WIDTH\n" "$(wc -L < "$__locale_final_file")";
    printf "$__BU_COMPILE__LOCALIZED_FILE__WORDS\n" "$(wc -w < "$__locale_final_file")";

    return 0;
}

# Support of the arguments when this script is executed with the two awaited arguments.
if      [ -n "$__BU_ARG_LANG" ]; then CompileInSingleFile "$__BU_ARG_LANG" "$__BU_ARG_DISP" || { PrintErrorLine "$__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED" ; exit 1; };
else
    CompileInSingleFile "en" "no" || { PrintErrorLine "IMPOSSIBLE TO CREATE AN ENGLISH VERSION CONTAINING THE MAIN RESOURCES OF THE FRAMEWORK ENCAPSULATED IN A SINGLE FILE!!!"; exit 1; };
    PrintSuccessLine "SUCCESSFULLY CREATED AN ENGLISH VERSION CONTAINING THE MAIN RESOURCES OF THE FRAMEWORK ENCAPSULATED IN A SINGLE FILE";

    CompileInSingleFile "fr" "no" || { PrintErrorLine "IMPOSSIBLE DE CRÉER UNE VERSION FRANÇAISE CONTENANT LES PRINCIPALES RESSOURCES DU FRAMEWORK ENCAPSULÉES EN UN SIMPLE FICHIER !!!"; exit 1; };
    PrintSuccessLine "CRÉATION D'UNE VERSION FRANÇAISE CONTENANT LES PRINCIPALES RESSOURCES DU FRAMEWORK ENCAPSULÉES DANS UN SEUL FICHIER RÉUSSIE AVEC SUCCÈS";
fi
