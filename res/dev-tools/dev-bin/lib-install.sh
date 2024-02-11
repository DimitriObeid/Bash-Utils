#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : lib-install.sh
# Author(s)     : Dimitri OBEID
# Version       : 2.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# A very simple script, which copies the "Bash-utils-init.sh" file and the ".Bash-utils" folder in the user's home directory.

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

# Path to the directory containing the compiled stable files in the project's folder.
declare -r __BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_PROJECT_DIR='install/.Bash-utils/compiled/stable';

# Path to the directory containing the compiled stable files in the user's home directory.
declare -r __BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_HOME_DIR="${HOME}/.Bash-utils/compiled/stable";

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

####

##

# ·············································
# Feel free to define functions here if needed.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

cp -r install/.Bash-utils/ ~

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## COMMENTING THE FOLLOWING LINES UNTIL THIS SCRIPT WILL SUPPORT THE OPTIONS TO PROCESS THE READ-ONLY FILES ACCORDING TO THE USER'S DESIRES
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cp "install/Bash-utils-init.sh" ~   || { echo "Unable to copy the initializer script in the ${HOME} directory"; exit 1; };
echo "Successfully copied the initializer script in the ${HOME} directory";
echo;

# If one or more stable files are found in the "install/.Bash-utils/compiled/stable" directory.
if [ -d "${__BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_PROJECT_DIR}" ] && [ -n "$(ls "${__BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_PROJECT_DIR}")" ]; then

    # As it is impossible to copy the read-only files in another directory, those files' read-only mode is unset.
    for file in "${__BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_PROJECT_DIR}/"*.sh; do
        printf "Changing the %s%s%s file right from read-only to rwx... " "$(tput setaf 6)" "${file}" "$(tput sgr0)";

        chmod +wr "${file}" > /dev/null 2>&1 || {
            printf "Failed %s❌%s\n\n" "$(tput setaf 9)" "$(tput sgr0)";

            echo "Unable to unset the read-only mode from the ${file} file";

            exit 1;
        };

        printf "done %s✓%s\n" "$(tput setaf 2)" "$(tput sgr0)";
    done

    echo;
fi

cp -r "install/.Bash-utils" ~       || { echo "Unable to copy the Bash Utils modules directory in the ${HOME} directory"; exit 1; };
echo "Successfully copied the Bash Utils modules directory in the ${HOME} directory";
echo;

# If one or more stable files are found in the "${HOME}/.Bash-utils/compiled/stable" directory.
if [ -n "${__BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_HOME_DIR}" ] && [ -n "$(ls "${__BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_HOME_DIR}")" ]; then

    # Resetting the files in their original read-only mode.
    for file in "${__BU__BIN__LATEX_UNITE__GLOBVARS__PATHS__STABLE_FILES_HOME_DIR}"*.sh; do
        printf "Resetting the read-only mode for this file : %s..." "${file}";

        chmod -wx+r "${file}" > /dev/null 2>&1 || {
            printf "Failed %s❌%s\n\n" "$(tput setaf 9)" "$(tput sgr0)";

            echo "Unable to reset the read-only mode for this file : ${file}";

            exit 1;
        };

        printf "done %s✓%s\n" "$(tput setaf 2)" "$(tput sgr0)";
    done

    echo;
fi

exit 0;
