#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : latex-unite.sh
# Author(s)     : Dimitri OBEID
# Version       : Beta 1.0


# ------------------
# FILE DESCRIPTION :

# This script unites every LaTeX source files (each files ending with the ".tex" extension) in a single file,
# in order to get the total size of the documentation in bytes, number of characters, of words, of columns and lines.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### BASH DEPENDENCIES

## BASH UTILS

# Feel free to source any dependencies here if needed.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL RESOURCES DEFINITION #############################################

########################################### PROJECT'S ARGUMENTS DEFINITIONS ###########################################

#### POSITIONAL ARGUMENTS

##

# Feel free to define positional arguments here.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAY OF ARGUMENTS

## ARGUMENTS DEFINITION

# ARG TYPE : Array
# REQUIRED
# DEFAULT VAL : NULL

# DESC : Languages processing with argument
__BU_ARGS=("${@}");

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## PROJECT'S GLOBAL VARIABLES DEFINITIONS #######################################

#### ARRAYS DEFINITIONS

## SUB-CATEGORY NAME

# Feel free to define arrays here if needed.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITIONS

## PATHS

__BU_ROOT_PATH="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path")";

__BU_MAIN_FULL_FILE_PATH="${__BU_ROOT_PATH}/Bash-utils.tex";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

####

##

# Feel free to define functions here if needed.

# ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### FUNCTIONS DEFINITION

##

# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)";

        for _ in $(eval echo -e "{1..${__cols}}"); do
            printf '-';
    done; printf "\n";
}

# function BU.Main.Echo.Newline { local iterations="${1}"; for ((i=0; i<iterations; i++)); do echo -e "" | tee -a "${__BU_MAIN_FULL_FILE_PATH}"; done; }
function CatBU { cat "${1}" | tee -a "${__BU_MAIN_FULL_FILE_PATH}" || { echo "UNABLE TO DISPLAY THE ${1} FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }
function EchoBU { echo -e "# ${1}" | tee -a "${__BU_MAIN_FULL_FILE_PATH}" || { echo "UNABLE TO WRITE THE ${1} FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }


if [ ! -f "${__BU_MAIN_FULL_FILE_PATH}" ]; then
        touch "${__BU_MAIN_FULL_FILE_PATH}";
fi

if [ -s "${__BU_MAIN_FULL_FILE_PATH}" ]; then
        true > "${__BU_MAIN_FULL_FILE_PATH}";
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

####

##

# Processing the English documentation
