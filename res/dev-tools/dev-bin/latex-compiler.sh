#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : latex-compiler.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# This script recursively compiles EVERY ".tex" files from the project's root folder.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### BASH DEPENDENCIES

## BASH UTILS

# Feel free to source any dependencies here if needed.

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

## FILEPATHS ARRAY

# ARG TYPE : Array
# REQUIRED
# DEFAULT VAL : .

# DESC : This array contains all the paths to the LaTeX files to be compiled into a PDF file.
declare -agr __BU__BIN__LATEX_COMPILER__ARGS__FILEPATHS=();

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## PROJECT'S GLOBAL VARIABLES DEFINITIONS #######################################

#### ARRAYS DEFINITIONS

## SUB-CATEGORY NAME

# Feel free to define arrays here if needed.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITIONS

## COMMANDS

# Storing the name of the "$(latexmk)" command.
__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD='latexmk';

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### FUNCTIONS DEFINITION

## COMPILATION PROCESS

# ··································
# LaTeX to PDF compilation function.

# shellcheck disable=
function BU.DevBin.LatexCompiler.Functions.CompileLatexToPDF()
{
    #**** Parameters ****
    local p_filepath=${1:-$'\0'};   # ARG TYPE : Filepath   - REQUIRED | DEFAULT VAL : NULL     - DESC : Path to the file to compile.

    #**** Code ****
    if [ -z "${p_filepath}" ]; then
        BU.DevBin.LatexCompiler.Functions.HandleErrorInput 'E_MISSING_FILEPATH'; return "${?}";
    
    elif [ ! -f "${p_filepath}" ]; then
        BU.DevBin.LatexCompiler.Functions.HandleErrorInput 'E_INCORRECT_FILE_PATH'; return "${?}";
    fi

    latexmk -pdf "${p_filepath}" || { 
        BU.DevBin.LatexCompiler.Functions.HandleErrorInput 'E_COMPILATION_FAILED'; return "${?}"; 
    }:

    return 0;
}

## ==============================================

## ERRORS MANAGER

# ··············································································
# Handling the eventual errors which could occur during the compilation process.

# shellcheck disable=
function BU.DevBin.LatexCompiler.Functions.HandleErrorInput()
{
    #**** Parameters ****
    local p_code=${1:-$'\0'};   # ARG TYPE : String     - REQUIRED | DEFAULT VAL : NULL     - DESC : Error string.

    #**** Code ****
    if [ "${p_code^^}" == 'E_MISSING_FILEPATH' ]; then
        echo "ERROR : MISSING FILE PATH PASSED INTO THE ${FUNCNAME[1]}() FUNCTION !" >&2;

    elif [ "${p_code^^}" == 'E_INCORRECT_FILE_PATH' ]; then
        echo "ERROR : INCORRECT FILE PATH PASSED INTO THE ${FUNCNAME[1]}() FUNCTION !" >&2;
    
    elif [ "${p_code^^}" == 'E_COMPILATION_FAILED' ]; then
        echo "ERROR : AN ERROR OCCURED DURING THE COMPILATION OF THE PREVIOUS FILE !" >&2;
        echo "Please correct this / these error(s) with the help of your LaTeX editor";
    fi

    echo >&2;

    read -pr "Do you want to continue the compiler's execution ? (Y/N)" __read_handle_error_input;

    case "${__read_handle_error_input^^}" in
        Y?(E?(S))|YS)   return 0;;
        *)              return 1;;
    esac

    return 0;
}

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

if ! command -v "${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD}"; then
    if      [[ "${LANG,,}" == de_* ]]; then echo "Der Befehl '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' wurde auf Ihrem System nicht gefunden. Ausführung des Compilers gestoppt" >&2;
    elif    [[ "${LANG,,}" == en_* ]]; then echo "The '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' command was not found on your system. Terminating the compiler's execution" >&2;
    elif    [[ "${LANG,,}" == es_* ]]; then echo "El comando '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' no fue encontrado en su sistema. Detener la ejecución del compilador" >&2;

    elif    [[ "${LANG,,}" == fr_* ]]; then echo "La commande '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' n'a pas été trouvée sur votre système. Arrêt de l'exécution du compilateur" >&2;
    elif    [[ "${LANG,,}" == id_* ]]; then echo "Perintah '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' tidak ditemukan pada sistem Anda. Menghentikan eksekusi kompiler" >&2;
    elif    [[ "${LANG,,}" == pt_* ]]; then echo "O comando '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' não foi encontrado no seu sistema. Impedir o compilador de funcionar" >&2;

    elif    [[ "${LANG,,}" == ru_* ]]; then echo "Команда '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' не найдена в вашей системе. Остановка работы компилятора" >&2;
    elif    [[ "${LANG,,}" == sv_* ]]; then echo "Kommandot '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' hittades inte på ditt system. Avsluta körningen av kompilatorn" >&2;
    elif    [[ "${LANG,,}" == tr_* ]]; then echo "'\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' komutu sisteminizde bulunamadı. Derleyici yürütmesini sonlandır" >&2;

    elif    [[ "${LANG,,}" == uk_* ]]; then echo "Команду '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})' не знайдено у вашій системі. Зупинка роботи компілятора" >&2;
    elif    [[ "${LANG,,}" == zh_* ]]; then echo "在您的系统中没有找到命令 '\$(${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD})'。终止编译器执行" >&2;

    else
        echo "The '${__BU__BIN__LATEX_COMPILER__GLOBVARS__CMDS__CMD}' command was not found on your system. Terminating the compiler's execution" >&2;
    fi

    echo >&2; exit 1;
fi

# If a single file path was passed as argument.
if [ "${#__BU__BIN__LATEX_COMPILER__ARGS__FILEPATHS[@]}" -eq 1 ]; then
    BU.DevBin.LatexCompiler.Functions.CompileLatexToPDF "${__BU__BIN__LATEX_COMPILER__ARGS__FILEPATHS[0]}" || exit 1;

# Else, if multiple file paths were passed as argument
elif [ "${#__BU__BIN__LATEX_COMPILER__ARGS__FILEPATHS[@]}" -gt 1 ]; then
    for file in "${__BU__BIN__LATEX_COMPILER__ARGS__FILEPATHS[@]}"; do
        BU.DevBin.LatexCompiler.Functions.CompileLatexToPDF "${file}" || exit 1;
    done

# Else, if no file path was passed as argument.
else
    find . -name '*.tex' -execdir latexmk -pdf {} \;
fi

exit 0;