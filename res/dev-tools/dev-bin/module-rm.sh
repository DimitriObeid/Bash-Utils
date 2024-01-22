#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : module-rm.sh
# Author(s)     : Dimitri OBEID
# Version       : Beta 1.0


# -----------------
# FILE DESCRIPTION :

# This Bourne Again Shell script was made to help you removing every modules you don't want anymore.

# WARNING : it will not erase the scripts which has these modules as dependencies, so expect bugs if you try to execute them.

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

## AARRAY OF MODULES TO DELETE

# List of modules to delete from the user's hard drive.
__ARG_LIST=( "${@}" );

# Checking if the module's name was passed as argument when this script was executed.
if (( ${#__ARG_LIST[@]} == 0 )); then
    echo "This script takes at least one mandatory argument : the name of the existing module(s) to delete"; exit 1;
fi

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

## SUB-CATEGORY NAME

# Feel free to define variables here if needed.

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### PROJECT'S FUNCTIONS DEFINITIONS ###########################################

#### FILES PROCESSING

## PATH DELETION

# ·································································································
# Checking if the folders of the targeted module(s) exist in their right folder, and deleting them.

# shellcheck disable=
function check_folder_exists()
{
    #**** Parameters ****
    local p_path=${1:-$'\0'};

    #**** Code ****
    if [ -d "${p_path}" ]; then
        rm -rf "${p_path}" || {
            echo "Unable to delete this folder ''${p_path}''" >&2;
            echo >&2;

            echo "Please delete this folder manually." >&2;

            return 1;
        }
    fi

    return 0;
}

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Bash Utils library root path from this script's path.
__D_BU_LIB_ROOT_PATH="$(cat "${HOME}/.Bash-utils/Bash-utils-root-val.path")";

for module_name in "${__ARG_LIST[@]}"; do
    __D_BU_DEL_MODULE_CONF_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/config/modules/${module_name}";

    __D_BU_DEL_MODULE_INIT_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/modules/${module_name}";

    __D_BU_DEL_LIB_MODULE_FUNCTS_PATH="${__D_BU_LIB_ROOT_PATH}/lib/functions/${module_name}";

    if [ ! -d "${__D_BU_LIB_ROOT_PATH}/install" ] || [ ! -d "${__D_BU_LIB_ROOT_PATH}/lib" ]; then
        echo "You must run this script from its directory" >&2;
        echo >&2;

        echo "Terminating module creation" >&2;

        exit 1;
    fi

    # Checking if the whole module exists.
    if [ ! -d "${__D_BU_DEL_MODULE_CONF_PATH}" ] && [ ! -d "${__D_BU_DEL_MODULE_INIT_PATH}" ] && [ ! -d "${__D_BU_DEL_LIB_MODULE_FUNCTS_PATH}" ]; then
	    echo "The ${module_name} module does not exists anymore in the framework's data folders";

	    exit 0;
    fi

    # Checking if the module's configuration path exists, and then deleting its directory.
    if [ -d "${__D_BU_DEL_MODULE_CONF_PATH}" ]; then
	    echo "Deleting the ${module_name} module's configurations directory : ${__D_BU_DEL_MODULE_CONF_PATH}";

	   	check_folder_exists "${__D_BU_DEL_MODULE_CONF_PATH}";
    fi

    # Checking if the module's initializer path exists, and then deleting its directory.
    if [ -d "${__D_BU_DEL_MODULE_INIT_PATH}" ]; then
	    echo "Deleting the ${module_name} module's initializer directory    : ${__D_BU_DEL_MODULE_INIT_PATH}";

	    check_folder_exists "${__D_BU_DEL_MODULE_INIT_PATH}";
    fi

    # Checking if the module's library path exists, and then deleting its directory.
    if [ -d "${__D_BU_DEL_LIB_MODULE_FUNCTS_PATH}" ]; then
	    echo "Deleting the ${module_name} module's library directory        : ${__D_BU_DEL_LIB_MODULE_FUNCTS_PATH}";

        check_folder_exists "${__D_BU_DEL_LIB_MODULE_FUNCTS_PATH}";
    fi

    echo;
done

# Printing that the targeted modules were successfully removed from the Bash Utils framework's data folders.
if [ "${#__ARG_LIST[@]}" -lt 2 ]; then
    echo "The ${__ARG_LIST[0]} module was successfully removed";
else
    echo "The following modules were successfully removed :";

    for module in "${__ARG_LIST[@]}"; do
        echo "    - ${module}";
    done
fi

echo;

exit 0;
