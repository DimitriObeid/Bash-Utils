#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : latex-create-file-arch-lang.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# This script creates the same file architecture for every wanted languages in their "Bash-utils/docs/${lang}/" folder.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### BASH DEPENDENCIES

## BASH UTILS

# Including the "Bash-utils/lib/functions/main/Text.lib" file in order to use the "BU.Main.Text.ReplaceLettersInString()" function.

# shellcheck disable=SC1091
source "$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path")/lib/functions/main/Text.lib" || {
    echo "Unable to include the \"Bash-utils/lib/functions/main/Text.lib\" file into this script";

    exit 1;
};

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL RESOURCES DEFINITION #############################################

########################################### PROJECT'S ARGUMENTS DEFINITIONS ###########################################

#### POSITIONAL ARGUMENTS

## SUB-CATEGORY NAME

# Feel free to define positional arguments here.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAY OF ARGUMENTS

## LANGUAGE

# ARG TYPE : Array
# REQUIRED
# DEFAULT VAL : NULL

# DESC : Array containing the list of ISO 639-1 languages code to create the same existing LaTeX files in the "devtools" and "modules" folders,
# which are both located into each of the folders, named after the ISO 639-1 languages codes, to process by this script.
__BU__LCFAL__ARGS__LANG_ARRAY=( "${@}" );

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## PROJECT'S GLOBAL VARIABLES DEFINITIONS #######################################

#### VARIABLES DEFINITIONS

## PATHS

# Path to the "Bash-utils" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DIR;
    __BU__LCFAL__PATHS__BASH_UTILS__DIR="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path" || echo "Unable to get the path to the \"Bash-utils\" folder" >&2; exit 1)";

# Path to the "Bash-utils/docs" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DIR}/docs";

# Path to the "Bash-utils/docs/en" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__DIR}/en";

# Path to the "Bash-utils/docs/en/devtools" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DIR}/devtools";

# Path to the "Bash-utils/docs/en/modules" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DIR}/modules";

# Path to the "Bash-utils/docs/en/modules/02) Config" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__DIR}/02) Config";

# Path to the "Bash-utils/docs/en/modules/03) InitModule" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__03_INITMODULE__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__DIR}/03) InitModule";

# Path to the "Bash-utils/docs/en/modules/04) Functions" directory.
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__DIR}/04) Functions";



# Path to the "Bash-utils/docs/${__lang}" directory (DO NOT PASS ANY VALUE HERE, it will be done in the main loop).
declare -g __BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR;

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAYS DEFINITIONS

## LATEX FILES LIST

# List of every English files to recreate into each language folder processed by the "${__BU_ARG_LANG_ARRAY}" argument.
declare -a __BU__LCFAL__PATHS__LATEX_FILES_ARCH=(
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/256-color-palette.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/bin-generation.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/desktop.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/init-locale-file-mk.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/init-locale-file-rm.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/install-dev-env.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/latex-clean.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/latex-compiler.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/latex-convert-to-printable.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/latex-create-document.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/latex-create-file-arch-lang.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/latex-unite.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/lib-compiler-for-all-supported-versions.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/lib-compilerV3.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/lib-compilerV4.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/lib-generator.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/lib-install.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/lib-unite.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/module-add-file-by-OS.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/module-delete-file-by-OS.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/module-install.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/module-mk.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/module-pack.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/module-rm.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__DEVTOOLS__DIR}/mr-clean.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/Hardware/module-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Aliases-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/ColorsBG-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Colors-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/ColorsText-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Exit-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Filesystem-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Locale-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Module-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Project-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Status-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Text-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/main/Time-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__02_CONFIG__DIR}/Software/module-conf.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__03_INITMODULE__DIR}/Hardware/Initializer.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__03_INITMODULE__DIR}/main/Initializer.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__03_INITMODULE__DIR}/Software/Initializer.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Args.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/BasicMaths.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Checkings.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/CMDS.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Decho.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/DevTools.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Directories.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Echo.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Errors.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Files.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Filesystem.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Headers.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Inputs.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Locale.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/OS.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/PosixTerm.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Status.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Text.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/TextFormat.tex"
    "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__EN__MODULES__04_FUNCTIONS__DIR}/main/Time.tex"
)

# Replacement of the values of the previous arrays into another array which will store the same paths, but with each targeted ISO 639-1 languages codes in mind.

# DO NOT PASS ANY VALUE HERE, it will be done in the main loop.
declare -a __BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG=();

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### CATEGORY NAME

## FOLDERS

# ······································
# Creation of the "${__lang}" directory.

# shellcheck disable=
function BU.LCFAL.Function.CreateLangDirectory()
{
    #**** Parameters ****
    p_lang=${1:-$'\0'};    # ARG TYPE : String  # REQUIRED | DEFAULT VAL : NULL     - DESC : ISO 639-1 language code of the folder to create.

    #**** Code ****
    if [ ! -d "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}" ]; then
        echo "CREATION OF THE \"${p_lang}\" DIRECTORY";

        echo -en "\nThe \"${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}\" directory does not exists. ";

        read -r -p "Do you want to create it (type 'Y' ONLY if you are sure that you didn't made a typo error) ? (Y/N) " __read_val;
        echo "${__read_val}" >> /dev/null;

        case "${__read_val}" in
            'Y'|'y')
                echo;

                mkdir -p "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}" || {
                    echo "Unable to create the \"${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}\" folder" >&2;
                    echo "End of the exection" >&2;

                    return 1;
                }

                printf "%s✓%s The following folder was successfully created : %s\n" "$(tput setaf 2)" "$(tput sgr0)" "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}";
                ;;
            'N'|'n'|*)
                false;;
        esac

        return 0;
    else
        return 0;
    fi
}

# ···········································
# Sub-folders checking and creation function.

# shellcheck disable=
function BU.LCFAL.Function.CheckOrCreateSubFolders()
{
    #**** Parameters ****
    local p_dirpath=${1:-$'\0'};    # ARG TYPE : Dirpath    # REQUIRED | DEFAULT VAL : NULL     - DESC : Path to the sub-folder to check its existence and / or to create.

    #**** Code ****
    if [ -z "${p_dirpath}" ]; then
        echo "No directory path provided to the ${FUNCNAME[0]} function" >&2;

        return 1;
    else
        if [ ! -d "${p_dirpath}" ]; then
            mkdir -p "${p_dirpath}" || {
                echo "Unable to create the \"${p_dirpath}\" folder" >&2;

                return 1;
            };

            printf "%s✓%s The following folder was successfully created : %s\n" "$(tput setaf 2)" "$(tput sgr0)" "${p_dirpath}";
        else
            printf "%s✓%s The following folder already exists : %s\n" "$(tput setaf 2)" "$(tput sgr0)" "${p_dirpath}";

            return 0;
        fi
    fi
}

## ==============================================

## CHECKINGS

# ··········································································································
# Checking if the script file which runs the Bash code is the "latex-create-file-arch-lang.sh" shell script.

# shellcheck disable=
function BU.LCFAL.Function.IsShellScriptLCFAL()
{
    if [[ "${0##*/}" == latex-create-file-arch-lang.?(ba)sh ]]; then return 0; else return 1; fi
}

# ·······························································································································································
# Bypassing the "command not found" error from the absence of the "BU.ModuleInit.IsCompiler()" function into the "BU.Main.Text.ReplaceLettersInString()" function
# from the "Text.lib" file by simply returning 0, since, in the "BU.Main.Text.ReplaceLettersInString()" function, the functions from the "Echo.lib" file won't be
# called if the "BU.ModuleInit.IsCompiler()" function return 0.

# shellcheck disable=
function BU.ModuleInit.IsCompiler() { return 0; }

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Processing each ISO 639-1 codes passed as arguments.
for __lang in "${__BU__LCFAL__ARGS__LANG_ARRAY[@]}"; do
    #**** Variables ****
    __BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR="${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__DIR}/${__lang}";

    #**** Code ****

    # Verifying if the language folder exists in the "Bash-utils/docs" directory.
    BU.LCFAL.Function.CreateLangDirectory "${__lang}" || exit 1;

    # Assigning the the "${__BU__LCFAL__PATHS__LATEX_FILES_ARCH[@]}" array's indexes to the "${__BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG[@]}" array.
    __BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG+=("${__BU__LCFAL__PATHS__LATEX_FILES_ARCH[@]}");

    # Replacing every "Bash-utils/docs/en/" occurences by "Bash-utils/docs/${__lang}/"
    for ((i=0; i<"${#__BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG[@]}"; i++)); do
        __BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG["${i}"]="$(BU.Main.Text.ReplaceLettersInString \
                                                                "${__BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG[${i}]}" \
                                                                "Bash-utils/docs/en/" \
                                                                "all" \
                                                                "Bash-utils/docs/${__lang}/" \
                                                                )";
    done

    echo -e "\n";

    # Verifying if every required sub-folder exists in the "Bash-utils/docs/${__lang}" directory.
    echo '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\';
    echo "CHECKING THE EXISTENCE OF THE REQUIRED SUB-FOLDERS, OR CREATING THEM IF THEY DO NOT EXIST";
    echo;


    # Since the "$(mkdir -p)" command is used in the "BU.LCFAL.Function.CheckOrCreateSubFolders()" function, it is possible to directly create the last sub-directories.
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/devtools"                         || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/01) InitScript"           || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/02) Config/Hardware"      || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/02) Config/main"          || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/02) Config/Software"      || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/03) InitModule/Hardware"  || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/03) InitModule/main"      || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/03) InitModule/Software"  || exit 1;
    BU.LCFAL.Function.CheckOrCreateSubFolders "${__BU__LCFAL__PATHS__BASH_UTILS__DOCS__CURRLANG__DIR}/modules/04) Functions/main"       || exit 1;

    # Creating each LaTeX file into their right sub-folder.
    echo -e "\n";

    echo '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\';
    echo "CHECKING THE EXISTENCE OF THE LATEX FILES, OR CREATING THEM IF THEY DO NOT EXIST";

    for file in "${__BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG[@]}"; do
        if [ ! -f "${file}" ]; then
            touch "${file}" || {
                echo "Unable to create the \"${file}\" file" >&2;
                echo "End of the exection" >&2;

                exit 1;
            }

            printf "%s✓%s The following file was successfully created : %s\n" "$(tput setaf 2)" "$(tput sgr0)" "${file}";
        else
            printf "%s✓%s The following path already exists : %s\n" "$(tput setaf 2)" "$(tput sgr0)" "${file}";
        fi
    done


    # Emptying the "${__BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG[@]}" array in case the loop has to be iterated another time.
    unset __BU__LCFAL__PATHS__LATEX_FILES_ARCH__LANG;
done
