#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : module-rm.sh
# Author(s)     : Dimitri Obeid
# Version       : Beta 1.0

# -----------------
# FILE DESCRIPTION :

# This Bourne Again Shell script was made to help you removing every modules you don't want anymore.

# WARNING : it will not erase the scripts that has these modules as dependency, so expect bugs if you try to execute them.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### GLOBAL VARIABLES (RE)DEFINITION ###########################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# List of modules to delete from the user's hard drive.
__ARG_LIST=( "${@}" );

# Checking if the module's name was passed as argument when this script was executed.
if (( ${#__ARG_LIST[@]} == 0 )); then
    echo "This script takes at least one mandatory argument : the new module's name"; exit 1;
fi

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

##

# Feel free to define any needed variable here.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINITIONS

# ----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################