#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : init-locale-file-mk.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# This script creates one or more locale file(s) used for the modules initialization process script.

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

##

# Feel free to define positional arguments here.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARRAY OF ARGUMENTS

## ARRAY OF FILES TO CREATE

# List of ISO 639-1 codes.
__ARG_LIST=( "$@" );

# Checking if a value was passed as argument in the ISO 639-1 codes list when this script was executed.
if (( ${#__ARG_LIST[@]} == 0 )); then
	echo "This script takes at least one mandatory argument : the name(s) of the new locale file(s) to create"; exit 1;
fi

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## PROJECT'S GLOBAL VARIABLES DEFINITIONS #######################################

#### ARRAYS DEFINITIONS

##

# Feel free to define arrays here if needed.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITIONS

##

# Feel free to define variables here if needed.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### FUNCTIONS DEFINITION

##

# ·············································
# Feel free to define functions here if needed.



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Bash Utils library root path from this script's path.
__D_BU_LIB_ROOT_PATH="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path")";

__D_BU_MAKE_INIT_LOCALE_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/config/initializer/locale";

for locale_file in "${__ARG_LIST[@]}"; do
    __F_BU_MAKE_INIT_LOCALE_PATH="${__D_BU_MAKE_INIT_LOCALE_PATH}/${locale_file}.locale";

    printf "Creating the %s file... " "${__F_BU_MAKE_INIT_LOCALE_PATH}";

    if [ ! -f "${__F_BU_MAKE_INIT_LOCALE_PATH}" ]; then
        touch "${__F_BU_MAKE_INIT_LOCALE_PATH}" || {
            printf "Failed %s❌%s\n\n" "$(tput setaf 9)" "$(tput sgr0)" >&2;

            echo "ERROR : FAILED TO CREATE THE ${__F_BU_MAKE_INIT_LOCALE_PATH} FILE" >&2;
            echo >&2;

            echo "Ending the script's execution" >&2;
            echo >&2;

            exit 1;
        }

        printf "Success %s✓%s\n" "$(tput setaf 2)" "$(tput sgr0)";
    else
        printf "Already exists %s✓%s\n" "$(tput setaf 2)" "$(tput sgr0)";
    fi
done

exit 0;
