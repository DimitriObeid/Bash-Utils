#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : module-pack.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0


# ----------------------
# SCRIPT'S DESCRIPTION :

# Packing the targeted module's files into a folder (and then optionnaly into a compressed file), which can be downloaded and installed by another user.

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

## ARRAY OF MODULES TO PACK

# List of modules to pack.
__ARG_LIST=( "${@}" );

# Checking if the module's name was passed as argument when this script was executed.
if (( ${#__ARG_LIST[@]} == 0 )); then
	echo "This script takes at least one mandatory argument : the name of the existing module(s) to pack separately"; exit 1;
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

#### CATEGORY NAME

## SUB-CATEGORY NAME

# ·············································
# Feel free to define functions here if needed.



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Checking if the script is executed in its directory.
for module_name in "${__ARG_LIST[@]}"; do
    # Bash Utils library root path from this script's path.
    __D_BU_LIB_ROOT_PATH="../../..";

    __D_BU_PACK_MODULE_CONF_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/config/modules/${module_name}";

    __D_BU_PACK_MODULE_INIT_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/modules/${module_name}";

    __D_BU_PACK_MODULE_FUNCTS_PATH="${__D_BU_LIB_ROOT_PATH}/lib/functions/${module_name}";

    if [ ! -d "../../../install" ] || [ ! -d "../../../lib" ]; then
        echo "You must run this script from its directory" >&2;
        echo >&2;

        echo "Terminating module creation" >&2;

        exit 1;
    fi

    # Checking if the whole module exists.
    if [ ! -d "${__D_BU_PACK_MODULE_CONF_PATH}" ] || [ ! -d "${__D_BU_PACK_MODULE_INIT_PATH}" ] || [ ! -d "${__D_BU_PACK_MODULE_FUNCTS_PATH}" ]; then
	    echo "ERROR : At least one of the following ${module_name} module's directories are missing :" >&2;
	    echo "    -${__D_BU_PACK_MODULE_CONF_PATH}" >&2;
	    echo "    -${__D_BU_PACK_MODULE_INIT_PATH}" >&2;
	    echo "    -${__D_BU_PACK_MODULE_FUNCTS_PATH}" >&2;
	    echo >&2;

	    echo "Please check the existence of these directories" >&2;
	    echo >&2;

        exit 1;
    fi
done

# Printing that the targeted modules were successfully packed from the Bash Utils framework's data folders.
if [ "${#__ARG_LIST[@]}" -lt 2 ]; then
    echo "The ${__ARG_LIST[0]} module was successfully packed";
else
    echo "The following modules were successfully packed :";

    for module in "${__ARG_LIST[@]}"; do
        echo "    - ${module}";
    done
fi

echo;

exit 0;
