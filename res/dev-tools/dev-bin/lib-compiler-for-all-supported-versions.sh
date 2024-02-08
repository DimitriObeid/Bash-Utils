#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : lib-compiler-for-all-supported-versions.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0

# ----------------------
# SCRIPT'S DESCRIPTION :

# This script calls the "lib-compilerV4.sh" script (which compiles the needed framework ressources and the main module in a single file)
# for every types of needed compiled files : a copy for each supported language, and a copy with every supported languages shipped in.

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

## "lib-compilerV3.sh" LIST OF OPTIONAL ARGUMENTS

# ARG TYPE : String
# REQUIRED
# DEFAULT VAL : NULL

# DESC : This array of argument stores the list of the supported optional arguments for the "lib-compilerV4.sh" script, the mandatory ones are already managed by this script.
declare -rg __BU__LIB_COMPILER_V4__ARGS__LANG_ARRAY_FOR_THE_COMPILER=( "${@}" );

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

# Absolute path to the "Bash-utils" directory, where the "lib" and the "res" folders are located.
declare -rg __BU__LIB_COMPILER_V4__GLOBVARS__PATH_TO_BU;
    __BU__LIB_COMPILER_V4__GLOBVARS__PATH_TO_BU="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path" || { echo "Unable to get the \"Bash-utils/bin\" folder location" >&2; exit 1; })";

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

# Debug
# for argg in "${__BU__LIB_COMPILER_V4__ARGS__LANG_ARRAY_FOR_THE_COMPILER[@]}"; do echo "${argg}"; done

# source "${__BU__LIB_COMPILER_V4__GLOBVARS__PATH_TO_BU}/bin/lib-compilerV4.sh";

# For a COMPLETELY UNKONWN reason, if the "| tee -a "/dev/null"" redirection is removed, the script stops after the second compilation, thus the second "exec" command is not called.
exec "${__BU__LIB_COMPILER_V4__GLOBVARS__PATH_TO_BU}/bin/lib-compilerV4.sh" --lang=supported "${__BU__LIB_COMPILER_V4__ARGS__LANG_ARRAY_FOR_THE_COMPILER[@]}" | tee -a "/dev/null" || { exit 1; };

exec "${__BU__LIB_COMPILER_V4__GLOBVARS__PATH_TO_BU}/bin/lib-compilerV4.sh" --lang-include=supported --keep-raw-document-layout "${__BU__LIB_COMPILER_V4__ARGS__LANG_ARRAY_FOR_THE_COMPILER[@]}" || { exit 1; };

exit 0;