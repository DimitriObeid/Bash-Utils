#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : mr-clean.sh
# Author(s)     : Dimitri OBEID
# Version       : Beta 1.0

# -----------------
# FILE DESCRIPTION :

# This script

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

source "~/.bash_profile" || { echo >&2; echo -e "BASH-UTILS ERROR : Unable to source the '${HOME}/.bash_profile' file." >&2; echo >&2; exit 1; }

source "${__BU_MAIN_LIB_FILE_INITIALIZER}" || { echo >&2; echo -e "BASH-UTILS ERROR : Unable to source the Bash-utils initializer file." >&2; echo >&2; exit 1; }




# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### GLOBAL VARIABLES (RE)DEFINITION ###########################################

## ARGUMENTS DEFINITION

__ARG_EXTENSION=${1:-$'\0'}

# ----------------------------------------------

## VARIABLES DEFINITION

# Please define any needed variable here.

# -----------------------------------------------

## STATUS VARIABLES EDITION

# Please edit any needed status variable here.

# ----------------------------------------------

## FUNCTIONS DEFINITION

# Please define any needed function here.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################


find . -name "*.bak" -type f -print0 | xargs -0 /bin/rm -f
