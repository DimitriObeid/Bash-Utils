#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

# shellcheck disable=SC1090
source "$HOME/.bash_profile" || { echo >&2; echo "Unable to source the \"$HOME/.bash_profile\" file" >&2; echo >&2; exit 1; }

# shellcheck disable=SC1090
source "$__BASH_UTILS/Initializer.sh" || { echo >&2; echo "Unable to source the \"$__BASH_UTILS/Initializer.sh\" file" >&2; echo >&2; exit 1; }



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

## FUNCTIONS DEFINITION


# ----------------------------------------------

## VARIABLES DEFINITION



# -----------------------------------------------

## STATUS VARIABLES MODIFICATION

# shellcheck disable=SC2034
__STAT_ERROR="fatal"; CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## CODE