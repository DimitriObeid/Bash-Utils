#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : latex-compiler.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ------------------
# FILE DESCRIPTION :

# This script recursively compiles EVERY ".tex" files from the project's root folder.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### BASH DEPENDENCIES

## BASH UTILS

# Feel free to source any dependencies here if needed.

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL RESOURCES DEFINITION #############################################

########################################### PROJECT'S ARGUMENTS DEFINITIONS ###########################################

#### POSITIONAL ARGUMENTS

## SUB-CATEGORY NAME

# Feel free to define positional arguments here.

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAY OF ARGUMENTS

## SUB-CATEGORY NAME

# Feel free to define an array of arguments here if needed.

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## PROJECT'S GLOBAL VARIABLES DEFINITIONS #######################################

#### ARRAYS DEFINITIONS

## SUB-CATEGORY NAME

# Feel free to define arrays here if needed.

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITIONS

## COMMANDS

# Storing the name of the "latexmk" command.
__BU_LATEX_COMPILER__CMD='latexmk';

## ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### FUNCTIONS DEFINITION

## SUB-CATEGORY NAME

# ·············································
# Feel free to define functions here if needed.

# ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################



if ! command -v latexmk; then
    if      [[ "${LANG,,}" == de_* ]]; then echo "Der Befehl '${__BU_LATEX_COMPILER__CMD}' wurde auf Ihrem System nicht gefunden. Ausführung des Compilers gestoppt" >&2;
    elif    [[ "${LANG,,}" == es_* ]]; then echo "El comando '${__BU_LATEX_COMPILER__CMD}' no fue encontrado en su sistema. Detener la ejecución del compilador" >&2;
    elif    [[ "${LANG,,}" == fr_* ]]; then echo "La commande '${__BU_LATEX_COMPILER__CMD}' n'a pas été trouvée sur votre système. Arrêt de l'exécution du compilateur" >&2;

    elif    [[ "${LANG,,}" == pt_* ]]; then echo "O comando '${__BU_LATEX_COMPILER__CMD}' não foi encontrado no seu sistema. Impedir o compilador de funcionar" >&2;
    elif    [[ "${LANG,,}" == ru_* ]]; then echo "Команда '${__BU_LATEX_COMPILER__CMD}' не найдена в вашей системе. Остановка работы компилятора" >&2;
    elif    [[ "${LANG,,}" == uk_* ]]; then echo "Команду '${__BU_LATEX_COMPILER__CMD}' не знайдено у вашій системі. Зупинка роботи компілятора" >&2;

    else echo "The '${__BU_LATEX_COMPILER__CMD}' command was not found on your system. Aborting the compiler's execution" >&2;

    fi

    echo >&2; exit 1;
fi

find . -name '*.tex' -execdir latexmk -pdf {} \;
