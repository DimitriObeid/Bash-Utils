#!/usr/bin/env bash

# --------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS

# Name          : lib-compiler.sh
# Description   : This script compiles the needed framework ressources and the main module in a single file.
# Author(s)     : Dimitri Obeid
# Version       : 2.0
# Beta version  : NONE

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################################ DEPENDENCES INCLUSION ################################################

#### SOURCING DEPENDENCES

## BASH DEPENDENCES

# Temporarily commented, as the feature is not yet implemented . In the future, every dev-tools scripts will use a stable compiled version.
# source "$HOME/.Bash-utils/compiled/stable/framework-full.sh"

# if ! BashUtils_InitModules \
#    "module --log-shut --mode-log-partial" \
#    "main stat-error=fatal --stat-log=true --stat-log-r=tee --stat-time-txt=1 --stat-txt-fmt=true --stat-devtools=true" \

#    then
#            echo >&2; echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : something went wrong while calling the « BashUtils_InitModules() » function" >&2; echo >&2; exit 1;
# fi


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL VARIABLES DEFINITION #############################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# Language (mandatory argument).

# Usage : this argument must be provided in a single string like that, if you want to compile the project in English, French, Spanish, Swedish, Ukrainian and Chinese : "lang=en,fr,es,sv,uk,zh"
__BU_ARG_LANG=$1;

shift 1;

# Fitting the arguments following the "$__BU_ARG_DISP" in an array, in order to fit more arguments and prevent incompatible arguments to be put together (optional arguments).
__BU_ARG_ARRAY=("$@");

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

## ARRAYS

# Storing each stable file that cannot be set into read-only mode.
__BU_ARRAY__READ_ONLY_FAILED_FILES=();

# Storing each compiled files path.
__BU_ARRAY__COMPILED_FILES_LIST=();

# Storing each compiled stable files path.
__BU_ARRAY__COMPILED_STABLE_FILES_LIST=();

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
__ERROR="${__RED}";

__HIGHLIGHT="${__CYAN}";

__NEWSTEP="${__ORANGE}";

__SUCCESS="${__GREEN}";

__WARNING="${__YELLOW}";

# -----------------------------------------------

## MESSAGE TRANSLATIONS

# FRENCH - FRANÇAIS
if [[ "$LANG" == fr_* ]]; then
    # ----------------------------------------------------------------------------------------------------
    # Si le dossier "$__BU_ROOT_PATH" n'existe pas [-----] If the "$__BU_ROOT_PATH" folder doesn't exists.
    __BU_COMPILE__BU_ROOT_PATH_DOESNT_EXISTS="${__RED}ERREUR : LE DOSSIER ${__HIGHLIGHT}%s${__ERROR} N'EXISTE PAS !!!${__RESET}";
    __BU_COMPILE__BU_ROOT_PATH_DOESNT_EXISTS__EXPLAIN="Veuillez vérifier l'existence du répertoire racine de la librairie Bash Utils.";

    # -----------------------------------------------------------------------------------------------------------------------------------------
    # [-----] If an unsupported argument is passed into the array of optional arguments.
    __BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY="UN ARGUMENT NON-SUPPORTÉ À ÉTÉ PASSÉ DANS LE TABLEAU DES ARGUMENT OPTIONNELS";
    __BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY__ADVICE="${__ERROR}La valeur ${__HIGHLIGHT}%s${__ERROR} n'est pas supportée. Veuillez la retirer du tableau d'arguments suivant le premier argument obligatoire (lang=*)${__RESET}";

    __BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG="ARRÊT DE L'EXÉCUTION DU COMPILATEUR, AUCUN FICHIER DU FRAMEWORK ${__HIGHLIGHT}BASH UTILS${__ERROR} N'A ÉTÉ COMPILÉ !!!"

    # -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Vérification de la présence des valeurs "no-shell-check" et "compile-stable" passées ensemble [-----] Verifying if the "no-shell-check" and "compile-stable" values were passed together.
    __BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABE__WERE_PASSED_TOGETHER="${__WARNING}ATTENTION : LES VALEURS ${__HIGHLIGHT}%s${__WARNING} ET ${__HIGHLIGHT}%s${__WARNING} NE DOIVENT PAS ÊTRE UTILISÉES ENSEMBLES${__RESET}",
    __BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABE__WERE_PASSED_TOGETHER__ADVICE="${__WARNING}Pour compiler un fichier stable, la commande ${__HIGHLIGHT}shellcheck${__WARNING} DOIT être exécutée pour pouvoir vérifier toute erreur de programmation dans chaque fichier à inclure${__RESET}";

    # ----------------------------------------------------------------------------------
    # Vérifications avec la commande Shellcheck [-----] Shellcheck command verification.
    __BU_COMPILE__SHELLCHECK__DISABLED="AVERTISSEMENT : IL N'EST PAS RECOMMANDÉ D'EXÉCUTER CE SCRIPT SANS LA COMMANDE SHELLCHECK, À MOINS QUE VOUS NE SACHIEZ EXACTEMENT CE QUE VOUS FAITES !";
    __BU_COMPILE__SHELLCHECK__MISSING="${__RED}LA COMMANDE ${__CYAN}SHELLCHECK${__RED} N'EST PAS INSTALLÉE SUR VOTRE SYSTÈME !${__RESET}";

    # ---------------------------------------------------------------------------------------------------------
    # Si une mauvaise valeur est passée en premier argument [-----] If a bad value is passed as first argument.
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ERROR_MSG="ERREUR : LE PREMIER ARGUMENT DU COMPILATEUR N'EST PAS CORRECTEMENT FORMATÉ !!!";
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_1="${__WARNING}Veuillez exécuter ce script en passant le(s) code(s) ISO 639-1 souhaité(s) comme fait dans la chaîne de caractères suivante, qui peut être utilisée pour compiler le framework dans ces langues : anglais, français, ukrainien, suédois, turkmène or groenlandais :${__RESET}";
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_2="${__WARNING}Ou bien utilisez SEULEMENT un de ces délimiteurs (aucun autre n'est supporté) entre chaque code ISO 639-1 au lieu d'un espace :";
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_3="${__WARNING}Ou bien passez l'une de ces valeurs : \"${__HIGHLIGHT}all-supported${__WARNING}\", \"${__HIGHLIGHT}supported${__WARNING}\", \"${__HIGHLIGHT}lang=all-supported${__WARNING}\" OU \"${__HIGHLIGHT}lang=supported${__WARNING}\" uniquement si vous voulez compiler le framework avec chacune de ses langes supportées${__RESET}";

    # -------------------------------------------------------------------------
    # Exécution de la commande Shellcheck [-----] Shellcheck command execution.
    __BU_COMPILE__SHELLCHECK__VERIFICATION="${__ORANGE}Vérification d'erreurs de programmation dans le fichier ${__HIGHLIGHT}%s${__NEWSTEP}${__RESET}";
    __BU_COMPILE__SHELLCHECK__FAIL="${__RED}Une ou plusieurs erreurs de programmation ont été détectées dans le fichier ${__HIGHLIGHT}%s${__ERROR} !${__RESET}";
    __BU_COMPILE__SHELLCHECK__SUCCESS="${__GREEN}Le fichier ${__HIGHLIGHT}%s${__SUCCESS} ne contient aucune erreur de programmation";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Vérification de la validité du code ISO 639-1 enregistré dans la variable "$v_curr_locale" [-----] Checking if the "$v_curr_locale" variable is a valid ISO 639-1 language code.
    __BU_COMPILE__BAD_LANGUAGE_PASSED="${__RED}Un code de langue ISO 639-1 non-supporté a été passé en premier argument de la fonction ${__CYAN}CompileInSingleFile()${__RED} !${__RESET}";

    # -----------------------------------------------------------------------------------------
    # Message de début de compilation du framework [-----] Framework compilation start message.
    __BU_COMPILE__BEGIN_FRAMEWORK_COMPILATION="DÉBUT DE LA COMPILATION DU FRAMEWORK BASH UTILS DANS LE FICHIER ${__HIGHLIGHT}%s${__RESET}";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # (Fonction "WriteBU()") Écriture du contenu du fichier cible dans le fichier à générer [-----] "(WriteBU()" function) Writing the target file's content into the file to generate.
    __BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE="IMPOSSIBLE D'ÉCRIRE LE CONTENU DU FICHIER DANS LE FICHIER À GÉNÉRER!";
    __BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE__ADVICE="Veuillez vérifier son chemin, ses droits et s'il existe.";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de traduction en anglais du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's english translations files content first into the file to generate (safeguard, as the english translation is the main supported language).
    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE TRADUCTION DE SECOURS EN ANGLAIS POUR LA LANGUE ${__HIGHLIGHT}%s${__NEWSTEP} DU FICHIER ${__HIGHLIGHT}%s${__NEWSTEP} VERS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__EXPLAIN="Il s'agit d'une mesure de sauvegarde au cas où les fichiers de paramètres régionaux seraient mis à jour après une mise à jour du script d'initialisation, puisque l'anglais est la principale langue prise en charge, afin qu'un message ne soit pas renvoyé sous la forme d'une chaîne vide.";

    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION DE SECOURS EN ANGLAIS DU FICHIER ${__HIGHLIGHT}%s${__ERROR} VERS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION DE SECOURS EN ANGLAIS POUR LA LANGUE ${__HIGHLIGHT}%s${__SUCCESS} DU FICHIER ${__HIGHLIGHT}%s${__SUCCESS} VERS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de traduction du script d'initialisation dans le fichier à générer [-----] Writing now the initializer script's translations files content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__HIGHLIGHT}%s${__NEWSTEP} DU FICHIER ${__HIGHLIGHT}%s${__NEWSTEP} VERS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__HIGHLIGHT}%s${__ERROR} DU FICHIER ${__HIGHLIGHT}%s${__ERROR} VERS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE TRADUCTION POUR LA LANGUE ${__HIGHLIGHT}%s${__SUCCESS} DU FICHIER ${__HIGHLIGHT}%s${__SUCCESS} VERS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichier de librairie du module principal dans le fichier à générer [-----] Writing the main module's library files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE LIBRAIRIE DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE LIBRAIRIE DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE LIBRAIRIE DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de configuration du module principal dans le fichier à générer [-----] Writing the main module's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu du script d'initialisation du module principal dans le fichier à générer [-----] Writing the main module's initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT="COPIE DU CONTENU DU SCRIPT D'INITIALISATION DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DU MODULE PRINCIPAL DANS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu des fichiers de configuration du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT="COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DES FICHIERS DE CONFIGURATION DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # ----------------------------------------------------------------------------------------------------------------------------------------------------
    # Écriture du contenu du script d'initialisation dans le fichier à générer [-----] Writing the initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT="COPIE DU CONTENU DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR="ÉCHEC DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DU SCRIPT D'INITIALISATION DANS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # -------------------------------------------------------------------------------------------------------------------------------------------------
    # Copie du contenu du fichier généré dans le fichier localisé [-----] Copying the content of the generated file into the localized language's file.
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE="COPIE DU CONTENU DU FICHIER ${__HIGHLIGHT}%s${__NEWSTEP} VERS LE FICHIER ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR="ÉCHEC DE LA COPIE DU CONTENU DU FICHIER ${__HIGHLIGHT}%s${__ERROR} VERS LE FICHIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS="SUCCÈS DE LA COPIE DU CONTENU DU FICHIER ${__HIGHLIGHT}%s${__SUCCESS} VERS LE FICHIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # -----------------------------------------------------------------------------------------------------------------------------------------
    # Affichage des statistiques du fichier localisé nouvellement généré [-----] Printing the statistics of the newly generated localized file.
    __BU_COMPILE__LOCALIZED_FILE__STATS="Statistiques du fichier ${__HIGHLIGHT}%s${__RESET} :";
    __BU_COMPILE__LOCALIZED_FILE__BYTES="Taille en octets               : %s";
    __BU_COMPILE__LOCALIZED_FILE__CHARS="Nombre de caractères           : %s caractères";
    __BU_COMPILE__LOCALIZED_FILE__LINES="Nombre le lignes               : %s lignes";
    __BU_COMPILE__LOCALIZED_FILE__WIDTH="Largeur d'affichage maximale   : %s colonnes";
    __BU_COMPILE__LOCALIZED_FILE__WORDS="Nombre de mots                 : %s mots";

    __BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED="IMPOSSIBLE DE COMPILER UNE VERSION DU FRAMEWORK CONTENANT LES PRINCIPALES RESSOURCES ENCAPSULÉES EN UN SIMPLE FICHIER DANS CETTE LANGUE : ${__HIGHLIGHT}%s${__ERROR} !!!${__RESET}";
    __BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_SUCCESS="LE FRAMEWORK BASH UTILS A ÉTÉ COMPILÉ AVEC SUCCÈS VERS CETTE LANGUE : ${__HIGHLIGHT}%s${__RESET}";

    # -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # COMPILATION DU FICHIER EN MODE STABLE UNIQUEMENT : Vérification d'ereurs de programmation dans le fichier compilé [-----] STABLE FILE COMPILATION ONLY : Checking for any programming error in the compiled file.
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS="VÉRIFICATION D'ERREURS DE PROGRAMMATION DANS LE FICHIER COMPILÉ ${__HIGHLIGHT}%s${__NEWSTEP}";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__ERROR="LE FICHIER COMPILÉ ${__HIGHLIGHT}%s${__ERROR} CONTIENT AU MOINS UNE ERROR DE PROGRAMMATION";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__SUCCESS="LE FICHIER COMPILÉ ${__HIGHLIGHT}%s${__SUCCESS} NE CONTIENT AUCUNE ERREUR DE PROGRAMMATION";

    # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # COMPILATION DU FICHIER EN MODE STABLE UNIQUEMENT : Copie du fichier compilé dand le dossier "stable" [-----] STABLE FILE COMPILATION ONLY : Copying the compiled file into the "stable" directory.
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE="COPIE DU FICHIER ${__HIGHLIGHT}%s${__NEWSTEP} VERS LE DOSSIER ${__HIGHLIGHT}%s${__NEWSTEP}";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR="ÉCHEC DE LA COPIE DU FICHIER ${__HIGHLIGHT}%s${__ERROR} VERS LE DOSSIER ${__HIGHLIGHT}%s${__ERROR}";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_1="Veuillez vérifier les permissions du dossier cible";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_2="Si le fichier que vous essayez de compiler existe déjà EST n'est accessible qu'en lecture seule, veuillez le supprimer manuellement";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ENTER_YOUR_ANSWER="Entrez votre réponse (1 : oui | 2 : non | autres entrées : non) : ";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__SUCCESS="SUCCÈS DE LA COPIE DU FICHIER ${__HIGHLIGHT}%s${__SUCCESS} VERS LE DOSSIER ${__HIGHLIGHT}%s${__SUCCESS}";

    # ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # COMPILATION DU FICHIER EN MODE STABLE UNIQUEMENT : Mise à jour des droits du fichier compilé en mode lecture seule avec la commande "chmod" [-----] STABLE FILE COMPILATION ONLY : Setting the compiled file into read-only mode with the "chmod" command.
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD="MISE À JOUR DES DROITS DU FICHIER COMPILÉ ${__HIGHLIGHT}%s${__NEWSTEP} EN MODE LECTURE SEULE POUR DES RAISONS DE SÉCURITÉ";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING="ATTENTION : LE FICHIER ${__HIGHLIGHT}%s${__WARNING} NE PEUT PAS ÊTRE MIS EN MODE LECTURE SEULE";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ASK="${__WARNING}Voulez-vous quitter l'exécution du script ? Si ce n'est pas le cas, veuillez exécuter la commande '${__GREY}chmod ${__HIGHLIGHT}%s${__WARNING}' après la compilation de ce fichier${__RESET}";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_1="${__WARNING}Poursuite de la compilation du framework ${__CYAN}Bash Utils${__RESET}";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_2="${__ERROR}Arrêt de la compilation du framework ${__CYAN}Bash Utils${__RESET}";


    __BU_COMPILE__COMPILED_STABLE_FILE_WAS_NOT_SET_IN_READ_ONLY_MODE="LE FICHIER STABLE COMPILÉ ${__HIGHLIGHT}%s${__WARNING} N'A PAS ÉTÉ MIS EN MODE LECTURE SEULE, VEUILLEZ LE FAIRE MANUELLEMENT APRÈS LE PROCESSUS DE COMPILATION";
    __BU_COMPILE__COMPILED_STABLE_FILE_WAS_SUCCESSFULLY_SET_IN_READ_ONLY_MODE="LE FICHIER STABLE COMPILÉ ${__HIGHLIGHT}%s${__SUCCESS} A BIEN ÉTÉ MIS EN MODE LECTURE SEULE";


    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ONE_FILE_NOT_CHMODED="UN FICHIER COMPILÉ N'A PAS ÉTÉ MIS EN MODE LECTURE SEULE (${__HIGHLIGHT}%s${__WARNING})";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__EVERY_FILES_NOT_CHMODED="AUCUN DES ${__HIGHLIGHT}%s${__WARNING} FICHIERS STABLES COMPILÉS N'ONT ÉTÉ MIS EN MODE LECTURE SEULE";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__MULTIPLE_FILES_NOT_CHMODED="${__HIGHLIGHT}%s${__WARNING} DES ${__HIGHLIGHT}%s${__WARNING} FICHIERS COMPILÉS N'ONT PAS ÉTÉ MIS EN MODE LECTURE SEULE";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__SUCCESS="SUCCÈS DE LA MISE À JOUR DES DROITS EN MODE LECTURE SEULE DE CHACUN DES ${__HIGHLIGHT}%s${__SUCCESS} FICHIERS STABLES COMPILÉS";

    __BU_COMPILE__STABLE_COMPILED_FILE_IS_READY_TO_BE_USED="LE FICHIER STABLE ${__HIGHLIGHT}%s${__SUCCESS} A ÉTÉ COMPILÉ AVEC SUCCÈSS ET EST PRÊT À ÊTRE UTILISÉ";

    # ----------------------------------------------------------------------------------------------------------------
    # Si le framework a été compilé dans une version stable [-----] If the framework was compiled in a stable version.
    __BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED="${__WARNING}Voici le fichier compilé existant dont les droits n'ont pas été modifiés :${__RESET}";
    __BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__ADVICE="${__WARNING}Veuillez exécuter la commande '${__GREY}chmod ${__GREEN}-xw ${__HIGHLIGHT}%s${__WARNING}' pour rendre ce fichier accessible en lecture seule${__RESET}";

    __BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED="${__WARNING}Voici la liste des ${__HIGHLIGHT}%s${__WARNING} fichiers compilés existants dont les droits n'ont pas été modifiés :${__RESET}";
    __BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__TIP="${__WARNING}Astuce : vous pouvez appeler la commande \"${__GREY}chmod ${__GREEN}-xw ${__HIGHLIGHT}%s*${__WARNING}\" pour changer d'un seul coup les droits de chaque fichier.${__RESET}";


    __BU_COMPILE__END_OF_FRAMEWORK_COMPILATION="LA COMPILATION DU FRAMEWORK EST TERMINÉE";

# -------------------------------------------------------------------------------
# SINCE NO OTHER LANGUAGES ARE SUPPORTED, ENGLISH IS SET AS THE DEFAULT LANGUAGE.
# -------------------------------------------------------------------------------
else
    # -----------------------------------------------
    # If the "$__BU_ROOT_PATH" folder doesn't exists.
    __BU_COMPILE__BU_ROOT_PATH_DOESNT_EXISTS="${__RED}ERROR : THE ${__HIGHLIGHT}%s${__ERROR} FOLDER DOESN'T EXISTS !!!${__RESET}";
    __BU_COMPILE__BU_ROOT_PATH_DOESNT_EXISTS__EXPLAIN="Please check the existence of the root directory of the Bash Utils library.";

    # --------------------------------------------------------------------------
    # If an unsupported argument is passed into the array of optional arguments.
    __BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY="AN UNSUPPORTED ARGUMENT WAS PASSED INTO THE ARRAY OF OPTIONAL ARGUMENT";
    __BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY__ADVICE="${__ERROR}The ${__HIGHLIGHT}%s${__ERROR} value is not supported. Please remove it from the array of arguments following the mandatory first argument (lang=*)${__RESET}";

    __BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG="STOPPING THE EXECUTION OF THE COMPILER, NO FILES FROM THE ${__HIGHLIGHT}BASH UTILS${__ERROR} FRAMEWORK WERE COMPILED !!!";

    # -----------------------------------------------------------------------------------
    # Verifying if the "no-shell-check" and "compile-stable" values were passed together.
    __BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABE__WERE_PASSED_TOGETHER="${__WARNING}WARNING : THE ${__HIGHLIGHT}%s${__WARNING} AND ${__HIGHLIGHT}%s${__WARNING} VALUES MUST NOT BE USED TOGETHER${__RESET}",
    __BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABE__WERE_PASSED_TOGETHER__ADVICE="${__WARNING}In order to compile a stable file, the ${__HIGHLIGHT}shellcheck${__WARNING} command MUST be executed in order to check for any programming error in every files to be included${__RESET}";

    # --------------------------------
    # Shellcheck command verification.
    __BU_COMPILE__SHELLCHECK__DISABLED="WARNING: IT IS NOT RECOMMENDED TO RUN THIS SCRIPT WITHOUT THE SHELLCHECK COMMAND, UNLESS YOU KNOW EXACTLY WHAT YOU ARE DOING!";
    __BU_COMPILE__SHELLCHECK__MISSING="${__RED}THE ${__CYAN}SHELLCHECK${__RED} COMMAND IS NOT INSTALLED ON YOUR SYSTEM!${__RESET}";

    # -------------------------------------------
    # If a bad value is passed as first argument.
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ERROR_MSG="ERROR : THE COMPILER'S FIRST ARGUMENT IS NOT CORRECTLY FORMATTED !!!";
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_1="${__WARNING}Please execute this script by passing the wanted ISO 639-1 code(s) like it is done in the following string, which can be used to compile the framework in these languages : English, French, Ukrainian, Swedish, Turkmen or Greenlandic :${__RESET}";
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_2="${__WARNING}Or use ONLY one of these delimiters (no others are supported) between each ISO 639-1 codes instead of a space :";
    __BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_3="${__WARNING}Or pass the \"${__HIGHLIGHT}all-supported${__WARNING}\", \"${__HIGHLIGHT}supported${__WARNING}\", \"${__HIGHLIGHT}lang=all-supported${__WARNING}\" OR \"${__HIGHLIGHT}lang=supported${__WARNING}\" strings only if you want to compile the framework with each of its supported languages${__RESET}";

    # -----------------------------
    # Shellcheck command execution.
    __BU_COMPILE__SHELLCHECK__VERIFICATION="${__ORANGE}Verifying the programming errors in the ${__HIGHLIGHT}%s${__NEWSTEP} file${__RESET}";
    __BU_COMPILE__SHELLCHECK__FAIL="${__RED}One or more programming errors were detected in the ${__HIGHLIGHT}%s${__ERROR} file!${__RESET}";
    __BU_COMPILE__SHELLCHECK__SUCCESS="${__GREEN}The ${__HIGHLIGHT}%s${__SUCCESS} file does not contain any programming errors${__RESET}";

    # -----------------------------------------------------------------------------
    # Checking if the "$v_curr_locale" variable is a valid ISO 639-1 language code.
    __BU_COMPILE__BAD_LANGUAGE_PASSED="${__RED}An unsupported language ISO 639-1 code was passed as ${__CYAN}CompileInSingleFile()${__RED} function's first argument ${__RESET}";

    # ------------------------------------
    # Framework compilation start message.
    __BU_COMPILE__BEGIN_FRAMEWORK_COMPILATION="STARTING THE COMPILATION OF THE BASH UTILS FRAMEWORK IN THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE${__RESET}";

    # ---------------------------------------------------------------------------------
    # ("WriteBU" function) Writing the target file's content into the file to generate.
    __BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE="UNABLE TO WRITE THE FILE'S CONTENT IN THE FILE TO GENERATE !";
    __BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE__ADVICE="Please check its path, its rights and if it exists.";

    # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Writing the initializer script's english translations files content first into the file to generate (safeguard, as the english translation is the main supported language).
    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT="COPYING THE INITIALIZER SCRIPT'S ENGLISH BACKUP TRANSLATION FILES CONTENT OF THE ${__HIGHLIGHT}%s${__NEWSTEP} LANGUAGE FROM THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__EXPLAIN="This is a safeguard measure in case the locale files are updated after an update of the initialization script, since English is the primary supported language, so that a message is not returned as an empty string";

    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S ENGLISH BACKUP TRANSLATION FILES OF THE ${__HIGHLIGHT}%s${__ERROR} LANGUAGE, FROM THE ${__HIGHLIGHT}%s${__ERROR} FILE INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S ENGLISH BACKUP TRANSLATION FILES FOR THE ${__HIGHLIGHT}%s${__SUCCESS} LANGUAGE, FROM THE ${__HIGHLIGHT}%s${__SUCCESS} FILE INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # ------------------------------------------------------------------------------------------
    # Writing now the initializer script's translations files content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT="COPYING THE INITIALIZER SCRIPT'S TRANSLATION FILES CONTENT OF THE ${__HIGHLIGHT}%s${__NEWSTEP} LANGUAGE FROM THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S TRANSLATION FILES OF THE ${__HIGHLIGHT}%s${__ERROR} LANGUAGE FROM THE ${__HIGHLIGHT}%s${__ERROR} FILE INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S TRANSLATION FILES OF THE ${__HIGHLIGHT}%s${__SUCCESS} LANGUAGE FROM THE ${__HIGHLIGHT}%s${__SUCCESS} FILE INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # --------------------------------------------------------------------------
    # Writing the main module's library files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT="COPYING THE MAIN MODULE'S LIBRARY FILES CONTENT INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR="FAILED TO COPY THE MAIN MODULE'S LIBRARY FILES CONTENT INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE MAIN MODULE'S LIBRARY FILES CONTENT INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # --------------------------------------------------------------------------------
    # Writing the main module's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT="COPYING THE MAIN MODULE'S CONFIGURATION FILES CONTENT INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR="FAILED TO COPY THE MAIN MODULE'S CONFIGURATION FILES CONTENT INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE MAIN MODULE'S CONFIGURATION FILES CONTENT INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # ---------------------------------------------------------------------------------
    # Writing the main module's initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT="COPYING THE MAIN MODULE'S INITIALIZER SCRIPT'S CONTENT INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR="FAILED TO COPY THE MAIN MODULE'S INITIALIZER SCRIPT'S CONTENT INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE MAIN MODULE'S INITIALIZER SCRIPT'S CONTENT INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # ---------------------------------------------------------------------------------------
    # Writing the initializer script's configuration files content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT="COPYING THE INITIALIZER SCRIPT'S CONFIGURATION files CONTENT INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S CONFIGURATION files CONTENT INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S CONFIGURATION files CONTENT INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # -------------------------------------------------------------------
    # Writing the initializer script's content into the file to generate.
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT="COPYING THE INITIALIZER SCRIPT'S CONTENT INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR="FAILED TO COPY THE INITIALIZER SCRIPT'S CONTENT INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS="SUCCESSFULLY COPIED THE INITIALIZER SCRIPT'S CONTENT INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # -----------------------------------------------------------------------------
    # Copying the content of the generated file into the localized language's file.
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE="COPYING THE CONTENT OF THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE INTO THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR="FAILED TO COPY THE CONTENT OF THE ${__HIGHLIGHT}%s${__ERROR} FILE INTO THE ${__HIGHLIGHT}%s${__ERROR} FILE";
    __BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS="SUCCESSFULLY COPIED THE CONTENT OF THE ${__HIGHLIGHT}%s${__SUCCESS} FILE INTO THE ${__HIGHLIGHT}%s${__SUCCESS} FILE";

    # --------------------------------------------------------------
    # Printing the statistics of the newly generated localized file.
    __BU_COMPILE__LOCALIZED_FILE__STATS="${__HIGHLIGHT}%s${__RESET} file statistics :";
    __BU_COMPILE__LOCALIZED_FILE__BYTES="Size in bytes           : %s";
    __BU_COMPILE__LOCALIZED_FILE__CHARS="Number of characters    : %s characters";
    __BU_COMPILE__LOCALIZED_FILE__LINES="Number of lines         : %s lines";
    __BU_COMPILE__LOCALIZED_FILE__WIDTH="Maximum display width   : %s columns";
    __BU_COMPILE__LOCALIZED_FILE__WORDS="Number of words         : %s words";

    __BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED="FAILED TO COMPILE A VERSION OF THE FRAMEWORK CONTAINING THE MAIN RESOURCES ENCAPSULATED IN A SINGLE FILE IN THIS LANGUAGE : ${__HIGHLIGHT}%s${__ERROR} !!!${__RESET}";
    __BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_SUCCESS="THE BASH UTILS FRAMEWORK HAS BEEN SUCCESSFULLY COMPILED TO THIS LANGUAGE : ${__HIGHLIGHT}%s${__RESET}";

    # ---------------------------------------------------------------------------------------
    # STABLE FILE COMPILATION ONLY : Checking for any programming error in the compiled file.
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS="CHECKING FOR PROGRAMMING ERRORS IN THE COMPILED ${__HIGHLIGHT}%s${__NEWSTEP} FILE";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__ERROR="THE COMPILED ${__HIGHLIGHT}%s${__ERROR} FILE CONTAINS ONE OR MORE PROGRAMMING ERRORS";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__SUCCESS="THE COMPILED ${__HIGHLIGHT}%s${__SUCCESS} FILE DOES NOT CONTAINS ANY PROGRAMMING ERROR";

    # -----------------------------------------------------------------------------------
    # STABLE FILE COMPILATION ONLY : Copying the compiled file into the "stable" directory.
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE="COPYING THE ${__HIGHLIGHT}%s${__NEWSTEP} FILE TO THE ${__HIGHLIGHT}%s${__NEWSTEP} DIRECTORY";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR="FAILED TO COPY THE COMPILED ${__HIGHLIGHT}%s${__ERROR} FILE TO THE ${__HIGHLIGHT}%s${__ERROR} DIRECTORY";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_1="Please check the permissions of the target directory";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_2="If the file you try to compile already exists AND is read-only, please delete it manually";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ENTER_YOUR_ANSWER="Enter your answer (1 : yes | 2 : no | other entries : no) : ";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__SUCCESS="SUCCESSFULLY COPIED THE COMPILED ${__HIGHLIGHT}%s${__SUCCESS} FILE TO THE ${__HIGHLIGHT}%s${__SUCCESS} DIRECTORY";

    # ------------------------------------------------------------------------------------------------------
    # STABLE FILE COMPILATION ONLY : Setting the compiled file into read-only mode with the "cmhod" command.
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD="SETTING THE COMPILED ${__HIGHLIGHT}%s${__NEWSTEP} STABLE FILE IN READ-ONLY MODE FOR SAFETY REASONS";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING="WARNING : THE COMPILED ${__HIGHLIGHT}%s${__WARNING} STABLE FILE CANNOT BE SET IN READ ONLY MODE";

    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ASK="${__WARNING}Do you want to quit the script's execution ? If not, please execute the '${__GREY}chmod ${__GREEN}-xw ${__HIGHLIGHT}%s${__YELLOW}' command after the compilation of this file${__RESET}";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_1="${__WARNING}Continuing the compilation of the ${__CYAN}Bash Utils${__WARNING} framework${__RESET}";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_2="${__ERROR}Ending the compilation of the ${__CYAN}Bash Utils${__ERROR} framework${__RESET}";


    __BU_COMPILE__COMPILED_STABLE_FILE_WAS_NOT_SET_IN_READ_ONLY_MODE="THE COMPILED ${__HIGHLIGHT}%s${__WARNING} STABLE FILE WAS NOT SET IN READ-ONLY MODE, PLEASE DO SO MANUALLY AFTER THE COMPILATION PROCESS";
    __BU_COMPILE__COMPILED_STABLE_FILE_WAS_SUCCESSFULLY_SET_IN_READ_ONLY_MODE="THE COMPILED ${__HIGHLIGHT}%s${__SUCCESS} STABLE FILE WAS SUCCESSFULLY SET IN READ-ONLY MODE";


    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ONE_FILE_NOT_CHMODED="A COMPILED FILE WAS NOT SET IN READ-ONLY MODE (${__HIGHLIGHT}%s${__WARNING})";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__EVERY_FILES_NOT_CHMODED="NONE OF THE ${__HIGHLIGHT}%s${__WARNING} COMPILED STABLE FILES WERE SET TO READ-ONLY MODE";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__MULTIPLE_FILES_NOT_CHMODED="${__HIGHLIGHT}%s${__WARNING} OF THE ${__HIGHLIGHT}%s${__WARNING} COMPILED FILES WERE NOT SET IN READ-ONLY MODE";
    __BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__SUCCESS="SUCCESSFULLY SET EACH OF THE ${__HIGHLIGHT}%s${__SUCCESS} COMPILED STABLE FILES IN READ-ONLY MODE";

    __BU_COMPILE__STABLE_COMPILED_FILE_IS_READY_TO_BE_USED="THE COMPILED ${__HIGHLIGHT}%s${__SUCCESS} STABLE FILE WAS SUCCESSFULLY COMPILED AND IS READY TO BE USED";

    # --------------------------------------------------
    # If the framework was compiled in a stable version.
    __BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED="${__WARNING}Here is the existing compiled file whose rights have not been modified :${__RESET}";
    __BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__ADVICE="${__WARNING}Please execute the '${__GREY}chmod ${__GREEN}-xw ${__HIGHLIGHT}%s${__WARNING}' command in order to set this file in read-only mode";

    __BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED="${__WARNING}Here is the list of the ${__HIGHLIGHT}%s${__WARNING} existing compiled files whose rights have not been modified :${__RESET}";
    __BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__TIP="${__WARNING}Tip, you can type the \"${__GREY}chmod ${__GREEN}-xw ${__HIGHLIGHT}%s*${__WARNING}\" command to change the rights of each file at once.${__RESET}";


    __BU_COMPILE__END_OF_FRAMEWORK_COMPILATION="THE COMPILATION OF THE FRAMEWORK IS DONE";
fi

# -----------------------------------------------

## PATHS

# Getting the path to the library's root directory from the path file.
if [ -d '/usr/local/lib/Bash-utils' ]; then __BU_ROOT_PATH='/usr/local/lib/Bash-utils';

elif [ -d "$HOME/.Bash-utils/Bash-utils" ]; then __BU_ROOT_PATH="$HOME/.Bash-utils/Bash-utils";

else __BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")"; if [ ! -d "$__BU_ROOT_PATH" ]; then
        # shellcheck disable=SC2059
        printf "${__ERROR}$__BU_COMPILE__BU_ROOT_PATH_DOESNT_EXISTS${__RESET}\n" "$__BU_ROOT_PATH" >&2;
        echo "$__BU_COMPILE__BU_ROOT_PATH_DOESNT_EXISTS__EXPLAIN" >&2;
        echo >&2;

        PrintErrorLine "$__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG";

        exit 1;
    fi
fi

# Informations of the file which temporary stores each file's data.
if [ -f "$__BU_ROOT_PATH/install/Bash-utils-init.sh" ]; then __BU_INITIALIZER_SCRIPT_PATH="$__BU_ROOT_PATH/install/Bash-utils-init.sh";

else __BU_INITIALIZER_SCRIPT_PATH="$__BU_ROOT_PATH/Bash-utils-init.sh";

fi

# Path of the modules initializer file.
__BU_MAIN_FULL_FILE_PATH="$__BU_ROOT_PATH/Bash-utils.sh";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_CONFIGS_PATH="$__BU_ROOT_PATH/install/.Bash-utils/config/initializer";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_TRANSLATIONS_PATH="$__BU_MODULE_INIT_CONFIGS_PATH/locale";

# Sourcing the "Locale.lib" file in order to use the "BU.Main.Locale.PrintLanguageName()" function.
# shellcheck disable=SC1091
source "$__BU_ROOT_PATH/lib/functions/main/DevTools.lib";

# shellcheck disable=SC1091
source "$__BU_ROOT_PATH/lib/functions/main/Locale.lib";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINITION

# Function to create and display rows according to the number of columns in the terminal's text area.
function PrintLine()
{
    #**** Parameters ****
    local p_pos=${1:-NULL};             # String    - Default : NULL    - Printing a character according to the line's position.
    local p_len=${2:-NULL};             # String    - Default : NULL    - Printing a line according to the string's length.

    if [ "${p_len^^}" != 'NULL' ]; then
        local p_str=${3:-\$'0'};        # String    - Default : NULL    - String whose lenght is to be processed.

        __cols="${#p_str}";
    else
        __cols="$(tput cols)";
    fi

    #**** Variables ****
    local v_line_char

    #**** Code ****
    if [ "${p_pos^^}" == 'UPPER' ] || [ "${p_pos^^}" == 'LOWER' ]; then v_line_char='-'; else v_line_char='#'; fi

	for _ in $(eval echo -e "{1..$__cols}"); do
            printf '%s' "$v_line_char";
    done; printf "\n";
}

function PrintBaseLine()
{
    #**** Parameters ****
    local p_color=$1;       # CMD       - Default : NULL    - Color of the line AND the text.
    local p_msg=$2;         # String    - Default : NULL    - Message to print.
    local p_pos=${3:-NULL}; # String    - Default : NULL    - Position of the line to print.
    local p_len=${4:-NULL}; # String    - Default : NULL    - Printing a line according to the string's length.

    # NULL (default)    : no lines are printed
    # UPPER             : only the upper line is printed
    # LOWER             : only the lower line is printed
    # FULL              : both lines are printed

    #**** Code ****
    # Error handling for the value of the "$p_pos" argument.
    if [ "${p_pos^^}" != 'NULL' ]; then if [[ ("${p_pos^^}" != 'UPPER') && ("${p_pos^^}" != 'LOWER') && ("${p_pos^^}" != 'FULL') ]]; then p_pos='NULL'; fi; fi

    echo;

    [[ ("${p_pos^^}" == 'FULL') || ("${p_pos^^}" == 'UPPER') ]] && { printf "%s" "$p_color"; if [[ "${p_len,,}" == len?(g?(th)) ]]; then PrintLine "$p_pos" "$p_len" "$p_msg"; else PrintLine "$p_pos"; fi; printf "%s" "$__RESET"; };
    echo "$p_color$p_msg${__RESET}";
    [[ ("${p_pos^^}" == 'FULL') || ("${p_pos^^}" == 'LOWER') ]] && { printf "%s" "$p_color"; if [[ "${p_len,,}" == len?(g?(th)) ]]; then PrintLine "$p_pos" "$p_len" "$p_msg"; else PrintLine "$p_pos"; fi; printf "%s" "$__RESET"; };

    echo;

    return 0;
}

# Printing an error line.
function PrintErrorLine()   { PrintBaseLine "$__ERROR" "$1" "$2" "$3" >&2; }

# Printing a newstep line.
function PrintNewstepLine() { PrintBaseLine "$__NEWSTEP" "$1" "$2" "$3"; }

# Printing a success line.
function PrintSuccessLine() { PrintBaseLine "$__SUCCESS" "$1" "$2" "$3"; }

# Printing a warning line.
function PrintWarningLine() { PrintBaseLine "$__WARNING" "$1" "$2" "$3"; }

# Printing the list the every files whose rights were not modified.
# shellcheck disable=SC2059
function PrintFilesWhichWereNotChmoded()
{
    #**** Parameters ****
    local __compiled_stable_file_parent_dir=$1;

    #**** Code ****
    printf "$__BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED\n" "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" >&2;

    for files in "${__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}"; do
        v_file_line=$(( v_index + 1 ));

        echo "    - $files";

        if [ $(( v_file_line % 5 )) -eq 0 ]; then
            echo >&2;
        fi

        v_index=$(( v_index+1 ));
    done

    echo >&2; printf "$__BU_COMPILE__END_OF_COMPILATION__LIST_OF_FILES_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__TIP\n" "$__compiled_stable_file_parent_dir/" >&2;
}

# Converts a byte count to a human readable format in IEC binary notation (base-1024 (eg : GiB)), rounded to two
# decimal places for anything larger than a byte. Switchable to padded format and base-1000 (eg : MB) if desired.

# Initial source of this AWK script (since it's not mine, plus I added more informations as comments and the localization) :
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BytesToHuman()
{
    #**** Parameters ****
    local L_BYTES="${1:-0}";    # Int               - Default : 0       - Raw size in bytes.
    local L_PAD="${2:-no}";     # String            - Default : no      - Allow result display padding.
    local L_BASE="${3:-1024}";  # Int               - Default : 1024    - Base (1000 (metric) or 1024 (binary notation))
    local V_LANG="${4:-en}";    # ISO 639-1 code    - Default : en      - Language, for localizing the byte count (default language : English).

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

    printf "%s" "$BYTESTOHUMAN_RESULT";

    return 0;
}

# Verifying the list of every ISO 639-1 language codes.
function CheckISO639_1_LangCode()
{
    #**** Parameters ****
    local p_code=${1:-NULL};    # String    - Default : NULL    - Language in which the file must be translated.

    #**** Code ****
    [[ ${___BU_COMPILER__LANG_ARRAY[*]} =~ ${p_code,,} ]] && return 0; return 1;
}

# Getting the delimiter.
function CheckLangArgDelim()
{
        #**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
    local p_target=$2;  # Char      - Default : NULL    - Targeted character.

    #**** Variables ****
    local v_occurences="${p_string//[^$p_target]}";

    #**** Code ****
    if [ -n "${v_occurences:0:1}" ]; then return 0; fi

    return 1;
}

# Writing the error message if a Shellcheck verification failed.
function ShellcheckError()
{
    #**** Parameters ****
    local p_path=${1};  # String    - Default : NULL    - Path of the file whose Shellcheck verification failed.

    #**** Code ****
    echo >&2;

    # shellcheck disable=SC2059
    printf "$__BU_COMPILE__SHELLCHECK__FAIL" "$p_path"; echo >&2; return 0;
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
    if      [ "${p_display,,}" == 'yes' ]; then echo "$v_content" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { PrintErrorLine "$__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE"; echo "$__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE__ADVICE" >&2; return 1; };
    else                                        echo "$v_content" >>       "$__BU_MAIN_FULL_FILE_PATH" || { PrintErrorLine "$__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE"; echo "$__BU_COMPILE__UNABLE_TO_WRITE_IN_THE_FILE_TO_GENERATE__ADVICE" >&2; return 1; };
    fi
}

# ----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Parsing the array of optional arguments given by the user.
for arg in "${__BU_ARG_ARRAY[@]}"; do
    # If the user decides to display the content of each compiled file.
    if [ "$arg" == display ]; then
        __vArrayVal_display='display';

    # Else, if the user decided to create a stable version of the wrapped framework.
    elif [[ "$arg" == ?(compile?(-))stable ]]; then
        # Declaring a variable to tell to the next program's instructions that this value was passed as argument.
        __vArrayVal_compile_stable='compile-stable';

    # Else, if the user decides to prevent the execution of the 'shellcheck' command.

    # WARNING : Do not check for programming errors in the files (not recommended, unless you know what you are doing).
    elif [[ "$arg" == no?(?(-)shell)?(-)check ]]; then
        __vArrayVal_no_shellcheck='no-shellcheck';

    # Else, if the user passes the 'compile-unstable' value to compile an unstable version of the framework.
    elif [[ "$arg" == ?(compile?(-))unstable ]]; then
        # As the unstable version is the one compiled by default AND bedore the creation of a stable one, nothing has to be done.
        true;

    # --------------------------------------------------------------------------------
    # Else, if an unsupported argument is passed into the array of optional arguments.
    else
        PrintErrorLine "$__BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY" 'FULL';
        echo "$__BU_COMPILE__UNSUPPORTED_ARGUMENT_PASSED_IN_OPTIONAL_ARGS_ARRAY__ADVICE" >&2;
        echo >&2;

        PrintErrorLine "$__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG" 'FULL';

        exit 1;
    fi
done

# Verifying any incompatible values.

# Verifying if the "no-shell-check" and "compile-stable" values were passed together.
if [[ (-n "$__vArrayVal_no_shellcheck") && ("$__vArrayVal_no_shellcheck" == 'no-shellcheck') ]] && [[ (-n "$__vArrayVal_compile_stable") && ("$__vArrayVal_compile_stable" == 'compile-stable') ]]; then
    # shellcheck disable=SC2059
    PrintWarningLine "$(printf "$__BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABE__WERE_PASSED_TOGETHER\n\n" "$__vArrayVal_compile_stable" "$__vArrayVal_no_shellcheck")" 'FULL' >&2;
    echo "$__BU_COMPILE__NO_SHELLCHECK__AND__COMPILE_STABE__WERE_PASSED_TOGETHER__ADVICE" >&2;
    echo >&2;

    PrintErrorLine "$__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG" 'FULL';

    exit 1;
fi

# WARNING ! It's not recommended to disable the checkings of each file, unless you know what you are doing.

# At this point, declaring this condition is safe, since the presence of the 'compile-stable' argument value was done before.
if [[ (-n "$__vArrayVal_no_shellcheck") && ("$__vArrayVal_no_shellcheck" == 'no-shellcheck') ]]; then
    PrintWarningLine "$__BU_COMPILE__SHELLCHECK__DISABLED" 'FULL';

    sleep 1;

    __BU_SHELLCHECKED='true';
else
    # Checking first if Shellcheck is installed in order to check for code errors.
    if ! command -v shellcheck; then PrintErrorLine "$__BU_COMPILE__SHELLCHECK__MISSING" 'FULL'; exit 1; fi

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
    local v_locale_str;
    local v_locale_tmp;
    local v_locale_delim;

    # This variable will be used to verify if the "lang=" value is passed as first argument.
    local v_is_check_to_do;

    local __language_array;

    # Getting the current system language.
    local ____sys_lang; ____sys_lang="$(echo "${LANG}" | cut -d _ -f1)";

    #**** Code ****
    # Converting the "$p_locale" string into an array of ISO 639-1 codes.
    # If the "$p_locale" has coma delimiters.
    if [[ "${p_locale,,}" == lang=* ]]; then
        # Checking for the delimiter.
        if      CheckLangArgDelim "$p_locale" ','; then v_locale_delim=',';
        elif    CheckLangArgDelim "$p_locale" ';'; then v_locale_delim=';';
        elif    CheckLangArgDelim "$p_locale" '|'; then v_locale_delim='|';
        elif    CheckLangArgDelim "$p_locale" '~'; then v_locale_delim='~';
        elif    CheckLangArgDelim "$p_locale" '_'; then v_locale_delim='_';
        elif    CheckLangArgDelim "$p_locale" '.'; then v_locale_delim='.';
        elif    CheckLangArgDelim "$p_locale" ':'; then v_locale_delim=':';
        elif    CheckLangArgDelim "$p_locale" '!'; then v_locale_delim='!';
        elif    CheckLangArgDelim "$p_locale" '§'; then v_locale_delim='§';
        fi

        # Getting each ISO 639-1 codes after the mandatory '=' sign.
        v_locale_str="$(sed "s/^[^=]*=//" <<< "$p_locale")";

        # This variable's purpose is to avoid assigning the "$v_locale_str" variable to itself, because if so, the assignment would have done nothing.
        v_locale_tmp="$v_locale_str";
        v_locale_str="$v_locale_tmp";

        if [ "${v_locale_str,,}" != 'all' ] && [[ "${v_locale_str,,}" != ?(all?(-))supported ]]; then
            # Replacing each delimiter with an empty character.
            v_locale_str="${v_locale_str//$v_locale_delim/" "}";

            # String to word array.
            read -ra __language_array <<< "$v_locale_str";
        else
            # Reassigning the new value in the "$v_locale_str" variable to the "$p_locale" original variable, so that the condition can be written only once.
            p_locale="$v_locale_str";

            # Assigning a value, so that no extra checkings are done to the first argument's value afterwards.
            v_is_check_to_do='true';
        fi
    else
        # Assigning a value, so that no extra checkings are done to the first argument's value afterwards.
        v_is_check_to_do='true';
    fi

    # Else, if the "all" value is passed as the first argument.
    if [ "$v_is_check_to_do" == 'true' ]; then
        if [ "${p_locale,,}" == 'all' ]; then
            PrintWarningLine "${__HIGHLIGHT}$p_locale${__WARNING} | ${__HIGHLIGHT}lang=all${__WARNING} : FEATURE NOT YET FULLY IMPLEMENTED, WATCH OUT FOR THE BUGS" 'FULL'; return 1;

            for langs in "${___BU_COMPILER__LANG_ARRAY[@]}"; do __language_array+=("$langs"); done;

        # Else, if the "all-supported" or "supported" value is passed as the first argument.
        elif [[ "${p_locale,,}" == ?(all?(-))supported ]]; then
            for langs in "${__BU_COMPILER__SUPPORTED_LANG_ARRAY[@]}"; do __language_array+=("$langs"); done;

        else
            PrintErrorLine "$__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ERROR_MSG" 'FULL';
            echo "$__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_1" >&2;
            echo "'lang=en fr uk sv tk kl'" >&2;
            echo >&2;

            echo "$__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_2 ${__HIGHLIGHT},;|~_.:!§${__RESET}" >&2;
            echo >&2;

            echo "$__BU_COMPILE__BAD_LANG_ARRAY_PASSED__ADVICE_3" >&2;

            PrintErrorLine "$__BU_COMPILE__PRINT_NO_FILES_WERE_COMPILED_ERROR_MSG" 'FULL';

            return 1;
        fi

        unset v_is_check_done;
    fi

    for language in "${__language_array[@]}"; do
        #------------------------
        #**** Loop variables ****
        local v_curr_locale="$language";

        local __locale_file_path="$__BU_MODULE_INIT_TRANSLATIONS_PATH/${v_curr_locale}.locale";
        local __locale_file_path_en="$__BU_MODULE_INIT_TRANSLATIONS_PATH/en.locale";

        # Compiled file's informations.
        local __compiled_file_path_parent_dir="$__BU_ROOT_PATH/install/.Bash-utils/compiled/unstable";
        local __compiled_file_path="$__compiled_file_path_parent_dir/Bash-utils-${v_curr_locale}.sh";

        local __locale_print_code;

        __locale_print_code="${__HIGHLIGHT}[ LOCALE : $v_curr_locale [$(BU.Main.Locale.PrintLanguageName "${v_curr_locale^^}" 'no') ]]";

        __locale_print_code__error="$__locale_print_code${__ERROR}";
        __locale_print_code__newstep="$__locale_print_code${__NEWSTEP}";
        __locale_print_code__success="$__locale_print_code${__SUCCESS}";
        __locale_print_code__warning="$__locale_print_code${__WARNING}";

        # If the 'compile-stable' argument was passed.
        if [ -n "$__vArrayVal_compile_stable" ]; then
            local __compile_stable="$__vArrayVal_compile_stable";
            local __compiled_stable_file_parent_dir="$__BU_ROOT_PATH/install/.Bash-utils/compiled/stable";
            local __compiled_stable_file_path="$__compiled_stable_file_parent_dir/Bash-utils-stable-${v_curr_locale}.sh";
        fi

        # If the 'no-shellcheck' argument was passed.
        if [ -n "$__vArrayVal_no_shellcheck" ]; then local __no_shellcheck="$__vArrayVal_no_shellcheck"; fi

        #-------------------
        #**** Loop code ****
        # Deleting the existing "Bash-utils.sh" file.
        if [ -f "$__BU_MAIN_FULL_FILE_PATH" ] && [ -s "$__BU_MAIN_FULL_FILE_PATH" ]; then true > "$__BU_MAIN_FULL_FILE_PATH"; fi

        # -----------------------------------------------------------------------------
        # Checking if the "$v_curr_locale" variable is a valid ISO 639-1 language code.
        if ! CheckISO639_1_LangCode "$v_curr_locale"; then PrintErrorLine "$__locale_print_code__error $__BU_COMPILE__BAD_LANGUAGE_PASSED" 'FULL'; ____loop_error='error'; break; fi

        # ------------------------------------
        # Framework compilation start message.
        PrintNewstepLine "$(printf "$__locale_print_code__newstep $__BU_COMPILE__BEGIN_FRAMEWORK_COMPILATION" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL';

        # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        # Writing the initializer script's english translations files content first into the file to generate (safeguard, as the english translation is the main supported language).

        if [ "${v_curr_locale,,}" != "en" ]; then
            PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT" "$v_curr_locale" "$__locale_file_path_en" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

            echo "$__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__EXPLAIN"; echo;

            if [ ! -f "$__locale_file_path_en" ]; then PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__ERROR" "$v_curr_locale" "$__locale_file_path_en" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break;
            else
                BU.Main.DevTools.ShellcheckVerif "$__locale_file_path_en" "$__compile_stable" || local __err="error";

                WriteBU "$__locale_file_path_en" "$p_display" || local ____err="error";
            fi

            [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__ERROR" "$v_curr_locale" "$__locale_file_path_en" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

            PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_ENGLISH_TRANSLATION_FILES_CONTENT__SUCCESS" "$v_curr_locale" "$__locale_file_path_en" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';
        fi

        # ------------------------------------------------------------------------------------------
        # Writing now the initializer script's translations files content into the file to generate.

        PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT" "$v_curr_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

        if  [ ! -f "$__locale_file_path" ]; then PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR" "$v_curr_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break;
        else
            BU.Main.DevTools.ShellcheckVerif "$__locale_file_path" || local __err="error";

            WriteBU "$__locale_file_path" "$p_display" || local ____err="error";
        fi

        [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__ERROR" "$v_curr_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_TRANSLATION_FILES_CONTENT__SUCCESS" "$v_curr_locale" "$__locale_file_path" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';

        # ---------------------------------------------------------------------------------------
        # Writing the initializer script's configuration files content into the file to generate.
        PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

        for i in "$__BU_MODULE_INIT_CONFIGS_PATH/"*.conf; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
        done

        [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_CONFIG_FILES_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';

        # -------------------------------------------------------------------
        # Writing the initializer script's content into the file to generate.
        PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

        if [ ! -f "$__BU_INITIALIZER_SCRIPT_PATH" ]; then PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break;

        else
            BU.Main.DevTools.ShellcheckVerif "$__BU_INITIALIZER_SCRIPT_PATH" || local __err="error";

            WriteBU "$__BU_INITIALIZER_SCRIPT_PATH" "$p_display";
        fi

        [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_INIT_SCRIPT_FILE_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';

        # --------------------------------------------------------------------------
        # Writing the main module's library files content into the file to generate.
        PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

        for i in "$__BU_ROOT_PATH/lib/functions/main/"*.lib; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
        done

        [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_LIB_FILES_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';

        # --------------------------------------------------------------------------------
        # Writing the main module's configuration files content into the file to generate.
        PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

        for i in "$__BU_ROOT_PATH/install/.Bash-utils/config/modules/main/"*.conf; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
        done

        [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_CONFIG_FILES_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';

        # ---------------------------------------------------------------------------------
        # Writing the main module's initializer script's content into the file to generate.
        PrintNewstepLine "$(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT" "$__BU_MAIN_FULL_FILE_PATH")" 'UPPER';

        for i in "$__BU_ROOT_PATH/install/.Bash-utils/modules/main/"*; do
            BU.Main.DevTools.ShellcheckVerif "${i}" || { local __err="error"; break; };

            WriteBU "${i}" "$p_display" || { local ____err="error"; break; };
        done

        [ -n "$__err" ] || [ -n "$____err" ] && { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__ERROR" "$__BU_MAIN_FULL_FILE_PATH")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__WRITE_MAIN_MODULE_INIT_SCRIPT_FILE_CONTENT__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH")" 'LOWER';

        # -------------------------------------------------------------------------------------------------------------------------
        # Now that the files were checked by Shellcheck, it's necessary to set the "$__BU_SHELLCHECKED" variable's value to 'true'.
        # However, in case a stable version is compiled, it is better to check the files that were not checked. This condition is managed in the "BU.Main.DevTools.ShellcheckVerif()" function.
        if [ "$__BU_SHELLCHECKED" == 'false' ]; then __BU_SHELLCHECKED='true'; fi


        # -----------------------------------------------------------------------------
        # Copying the content of the generated file into the localized language's file.
        PrintNewstepLine "$(printf "$__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE" "$__BU_MAIN_FULL_FILE_PATH" "$__compiled_file_path")" 'UPPER';

        cp "$__BU_MAIN_FULL_FILE_PATH" "$__compiled_file_path" || { PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__ERROR" "$__BU_MAIN_FULL_FILE_PATH" "$__compiled_file_path")" 'FULL'; ____loop_error='error'; break; };

        PrintSuccessLine "$(printf "$__BU_COMPILE__COPY_FILE_CONTENT_IN_LANG_FILE__SUCCESS" "$__BU_MAIN_FULL_FILE_PATH" "$__compiled_file_path")" 'LOWER';

        if [ -n "$__compile_stable" ]; then
            PrintSuccessLine "$(printf "$__locale_print_code__success $__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_SUCCESS" "$v_curr_locale ($(BU.Main.Locale.PrintLanguageName "$v_curr_locale" 'no'))")" 'FULL';
        else
            PrintSuccessLine "$(printf "$__locale_print_code__success $__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_SUCCESS" "$v_curr_locale ($(BU.Main.Locale.PrintLanguageName "$v_curr_locale" 'no'))")" 'FULL';
        fi

        # --------------------------------------------------------------
        # Printing the statistics of the newly generated localized file.

        printf "$__BU_COMPILE__LOCALIZED_FILE__STATS\n" "$__compiled_file_path"; echo;

        printf "$__BU_COMPILE__LOCALIZED_FILE__BYTES\n" "$(BytesToHuman "$(wc -c < "$__compiled_file_path")" 'NULL' 1000 "$____sys_lang")";
        printf "$__BU_COMPILE__LOCALIZED_FILE__CHARS\n" "$(wc -m < "$__compiled_file_path")";
        printf "$__BU_COMPILE__LOCALIZED_FILE__LINES\n" "$(wc -l < "$__compiled_file_path")";
        printf "$__BU_COMPILE__LOCALIZED_FILE__WIDTH\n" "$(wc -L < "$__compiled_file_path")";
        printf "$__BU_COMPILE__LOCALIZED_FILE__WORDS\n" "$(wc -w < "$__compiled_file_path")";

        # Adding the newly compiled file in the compiled files list.
        __BU_ARRAY__COMPILED_FILES_LIST+=("$__compiled_file_path");

        if [ -n "$__compile_stable" ]; then
            # --------------------------------------------------------
            # STABLE FILE COMPILATION ONLY : Checking for any programming error in the compiled file.
            PrintNewstepLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS" "$__compiled_file_path")" 'UPPER';

            # Since the compiled file must be as bugless as possible, it is mandatory to check this file for any programming error with the 'shellcheck' command.
            if ! BU.Main.DevTools.ShellcheckVerif "$__compiled_file_path" "$__compile_stable"; then
                PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__ERROR" "$__compiled_file_path")" 'FULL';

                ____loop_error='error'; break;
            fi

            PrintSuccessLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHECKING_ERRORS__SUCCESS\n\n" "$__compiled_file_path")" 'LOWER';

            # ----------------------------------------------------
            # STABLE FILE COMPILATION ONLY : Copying the compiled file into the "stable" directory.
            PrintNewstepLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE" "$__compiled_file_path" "$__compiled_stable_file_parent_dir")" 'UPPER';

            if ! cp --verbose "$__compiled_file_path" "$__compiled_stable_file_path" ; then
                PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR" "$__compiled_file_path" "$__compiled_stable_file_parent_dir")" 'FULL';
                echo >&2;

                echo "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_1" >&2;
                echo >&2;

                echo "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ADVICE_2" >&2;
                echo >&2;

                ____loop_error='error'; break;
            else
                PrintSuccessLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__SUCCESS" "$__compiled_file_path" "$__compiled_stable_file_parent_dir")" 'LOWER';
            fi

            # -----------------------------------------------------------------------
            # STABLE FILE COMPILATION ONLY : Setting the compiled file into read-only mode with the "chmod" command.
            PrintNewstepLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD" "$__compiled_file_path")" 'UPPER';

            if ! chmod --verbose -xw "$__compiled_stable_file_path"; then
                PrintWarningLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING" "$__compiled_stable_file_path")";

                printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ASK\n\n" "$__compiled_stable_file_path" >&2;
                read -rp "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__COPYING_FILE__ERROR_ENTER_YOUR_ANSWER" __answer_copy_compiled_file_in_stable_dir;
                echo;

                case "${__answer_copy_compiled_file_in_stable_dir,,}" in
                    '1') echo "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_1";;
                    '2' | *)
                        echo "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ANS_2" >&2; echo >&2;

                        # If other files were successfully compiled, but failed to be "chmoded".
                        if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -gt 0 ]; then
                            if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -eq 1 ]; then
                                echo "$__BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED" >&2;

                                for files in "${__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}"; do
                                    echo "    - $files";
                                done
                            else
                                PrintFilesWhichWereNotChmoded "$__compiled_stable_file_parent_dir";
                            fi
                        fi

                        ____loop_error='error';

                        break;;
                esac

                # Adding the failed file into the array of failed files.
                __BU_ARRAY__READ_ONLY_FAILED_FILES+=("$__compiled_stable_file_path");

                PrintWarningLine "$(printf "$__BU_COMPILE__COMPILED_STABLE_FILE_WAS_NOT_SET_IN_READ_ONLY_MODE" "$__compiled_stable_file_path")" 'LOWER';
            else
                PrintSuccessLine "$(printf "$__BU_COMPILE__COMPILED_STABLE_FILE_WAS_SUCCESSFULLY_SET_IN_READ_ONLY_MODE" "$__compiled_stable_file_path")" 'LOWER';
            fi

            PrintSuccessLine "$(printf "$__locale_print_code__success $__BU_COMPILE__STABLE_COMPILED_FILE_IS_READY_TO_BE_USED" "$__compiled_stable_file_path")" 'FULL';

            # Adding the newly compiled stable file in the compiled stable files list.
            __BU_ARRAY__COMPILED_STABLE_FILES_LIST+=("$__compiled_stable_file_path");
        fi
    done; if [ -n "$____loop_error" ] && [ "$____loop_error" = 'error' ]; then PrintErrorLine "$(printf "$__locale_print_code__error $__BU_COMPILE__CUSTOM_LANGUAGE_COMPILATION_FAILED" "$v_curr_locale ($(BU.Main.Locale.PrintLanguageName "$v_curr_locale" 'no'))")" 'FULL'; return 1; fi

    # If the framework was compiled in a stable version.
    if [ -n "$__compile_stable" ]; then
        # If one or more stable files were not successsfully "chmoded".
        if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -gt 0 ]; then
            # If only one file was not "chmoded".
            if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -eq 1 ]; then
                PrintSuccessLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__ONE_FILE_NOT_CHMODED" "$__compiled_stable_file_path")";

                echo "$__BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED";

                for files in "${__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}"; do
                    echo "    - $files"
                done

                echo >&2; printf "$__BU_COMPILE__END_OF_COMPILATION__FILE_WHOSE_RIGHTS_HAVE_NOT_BEEN_MODIFIED__ADVICE\n" "$__compiled_stable_file_path" >&2;

                # Else, if more than one file were not successfully "chmoded".
            else
                #**** Variables ****
                local v_index=0;
                local v_file_line;

                #**** Code ****
                if [ "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" -lt 5 ]; then
                    if [ "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}" == "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" ]; then
                        PrintWarningLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__EVERY_FILES_NOT_CHMODED" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")";
                    else
                        PrintWarningLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__MULTIPLE_FILES_NOT_CHMODED" "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")";
                    fi
                else
                    if [ "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}" == "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" ]; then
                        PrintWarningLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__EVERY_FILES_NOT_CHMODED" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")" 'FULL';
                    else
                        PrintWarningLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__WARNING__MULTIPLE_FILES_NOT_CHMODED" "${#__BU_ARRAY__READ_ONLY_FAILED_FILES[@]}" "${#__BU_ARRAY__COMPILED_STABLE_FILES_LIST[@]}")" 'FULL';
                    fi
                fi

                PrintFilesWhichWereNotChmoded "$__compiled_stable_file_parent_dir";
            fi
        else
            PrintSuccessLine "$(printf "$__BU_COMPILE__COPY_COMPILED_FILE_IN_STABLE_DIRECTORY__CHMOD__SUCCESS" "${#__BU_ARRAY__COMPILED_FILES_LIST[@]}")";
        fi
    fi

    PrintSuccessLine "$__BU_COMPILE__END_OF_FRAMEWORK_COMPILATION" 'FULL';

    return 0;
}

# Support of the arguments when this script is executed with the two awaited arguments.
if      [ -n "$__BU_ARG_LANG" ]; then CompileInSingleFile "$__BU_ARG_LANG" "$@" || { exit 1; };
else
    CompileInSingleFile "lang=en,fr" "$@" || { exit 1; };
fi

exit 0;
