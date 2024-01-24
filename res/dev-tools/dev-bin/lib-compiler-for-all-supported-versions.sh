#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : lib-compiler-for-all-supported-versions.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0

# ----------------------
# SCRIPT'S DESCRIPTION :

# This script calls the "lib-compilerV3.sh" script (which compiles the needed framework ressources and the main module in a single file)
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

# DESC : This array of argument stores the list of the supported optional arguments for the "lib-compilerV3.sh" script, the mandatory ones are already managed by this script.
declare __BU_ARGS_ARRAY=( "${@}" );

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
declare -r __PATH_TO_BU="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path" || { echo "Unable to get the \"Bash-utils/bin\" folder location" >&2; exit 1; })";

# Avoiding exiting the current script when the "lib-compilerV3.sh" file has done the execution.
declare -r __LIB_COMPILER_FOR_ALL_SUPPORTED_VERSIONS__NO_EXIT='true';

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

# Including the "lib-compilerV3.sh" file in order to avoid exiting the current script when the "exit 0" from the included script is reached,
# by using the "${__LIB_COMPILER_FOR_ALL_SUPPORTED_VERSIONS__NO_EXIT}" global variable at this moment into a condition.
source "${__PATH_TO_BU}/bin/lib-compilerV3.sh" --lang=supported "${__BU_ARGS_ARRAY[@]}" || { exit 1; };

# Because if the "lib-compiler.sh" script is not sourced, the "${__LIB_COMPILER_FOR_ALL_SUPPORTED_VERSIONS__NO_EXIT}" global variable's value
# is not recognized (anymore) by the compiler's script after its execution, so the "$(source)" command must be called once again in case the 
# compiler must be executed another time after this line.

# You can replace the "$(source)" command by the "$(exec)" command if you don't need to compile another version of the Bash-utils framework, 
# since the compiler will only be executed once, so you would not need to include the compiler's code again into this file's code.

source "${__PATH_TO_BU}/bin/lib-compilerV3.sh" --lang-include=supported "${__BU_ARGS_ARRAY[@]}" || { exit 1; };

exit 0;