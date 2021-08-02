#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

source "~/.bash_profile" || { echo >&2; echo -e "BASH-UTILS ERROR : Unable to source the '$HOME/.bash_profile' file." >&2; echo >&2; exit 1; }

source "$__BASH_UTILS_LIB_FILE_INITIALIZER" || { echo >&2; echo -e "BASH-UTILS ERROR : Unable to source the Bash-utils initializer file." >&2; echo >&2; exit 1; }



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

## ARGUMENTS DEFINITION

__ARG_EXTENSION=$1

# ----------------------------------------------

## VARIABLES DEFINITION

# Please define any needed CheckTxtFmt here.

# -----------------------------------------------

## STATUS VARIABLES EDITION

# Please edit any needed status CheckTxtFmt here.

# ----------------------------------------------

## FUNCTIONS DEFINITION

# Please define any needed function here.

# ----------------------------------------------

## CODE


find . -name "*.bak" -type f -print0 | xargs -0 /bin/rm -f
