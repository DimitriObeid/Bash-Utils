#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : latex-convert-to-printable.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# This script creates a printable version of every LaTeX source files.

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

## SUB-CATEGORY NAME

# Feel free to define an array of arguments here if needed.

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

## PATHS

# Path to the "Bash-utils" directory.
declare -g      __BU__BIN__LATEX_CONVERT_TO_PRINTABLE__GLOBVARS__PATHS__BASH_UTILS__DIR;
                __BU__BIN__LATEX_CONVERT_TO_PRINTABLE__GLOBVARS__PATHS__BASH_UTILS__DIR="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path" || echo "Unable to get the path to the \"Bash-utils\" folder" >&2; exit 1)";
    readonly    __BU__BIN__LATEX_CONVERT_TO_PRINTABLE__GLOBVARS__PATHS__BASH_UTILS__DIR;

# Path to the destination folder.
declare -gr __BU__BIN__LATEX_CONVERT_TO_PRINTABLE__GLOBVARS__PATHS__DEST_DIR="${__BU__BIN__LATEX_CONVERT_TO_PRINTABLE__GLOBVARS__PATHS__BASH_UTILS__DIR}/docs/01 PRINTABLE"

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### CATEGORY NAME

## SUB-CATEGORY NAME

# ·············································
# Feel free to define functions here if needed.



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################


