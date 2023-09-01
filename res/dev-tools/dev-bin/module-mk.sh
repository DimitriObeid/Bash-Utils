#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : module-mk.sh
# Author(s)     : Dimitri OBEID
# Version       : Beta 1.0


# -----------------
# FILE DESCRIPTION :

# This script creates the bases of each new module you want to create :
#   - their configuration directory,
#   - their initialization directory,
#   - Their library directory

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

## ARRAY OF MODULES TO CREATE

# List of modules to create.
__ARG_LIST=( "${@}" );

# Checking if the module's name was passed as argument when this script was executed.
if (( ${#__ARG_LIST[@]} == 0 )); then
	echo "This script takes at least one mandatory argument : the new module's name"; exit 1;
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

## CHECKING FOR FILES PRESENCE

# ················································································································
# Checking if the required files for the modules initialization exists in their right folder, or else create them.

# shellcheck disable=
function check_mandatory_file_exists()
{
    #**** Parameters ****
    local p_path=${1:-$'\0'};

    #**** Code ****
    if [ ! -f "${p_path}" ]; then
        touch "${p_path}" || {
            echo "Unable to create this required file ''${p_path}''" >&2;
            echo >&2;

            echo "Please create this file manually." >&2;

            return 1;
        }
    fi

    return 0;
}

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Checking if the script is executed in its directory.
for module_name in "${__ARG_LIST[@]}"; do
    # Bash Utils library root path from this script's path.
    __D_BU_LIB_ROOT_PATH="../../..";

    __D_BU_INST_MODULE_CONF_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/config/modules/${module_name}";

    __D_BU_INST_MODULE_INIT_PATH="${__D_BU_LIB_ROOT_PATH}/install/.Bash-utils/modules/${module_name}";

    __D_BU_LIB_MODULE_FUNCTS_PATH="${__D_BU_LIB_ROOT_PATH}/lib/functions/${module_name}";

    if [ ! -d "../../../install" ] || [ ! -d "../../../lib" ]; then
        echo "You must run this script from its directory" >&2;
        echo >&2;

        echo "Terminating module creation" >&2;

        exit 1;
    fi

    # Checking if the whole module exists.
    if [ -d "${__D_BU_INST_MODULE_CONF_PATH}" ] && [ -d "${__D_BU_INST_MODULE_INIT_PATH}" ] && [ -d "${__D_BU_LIB_MODULE_FUNCTS_PATH}" ]; then
	    echo "The ${module_name} module's directories already exist";
        
        exit 0;

	    # WIP : Checking if the mandatory files exist.
	    check_mandatory_file_exists="${__D_BU_INST_MODULE_CONF_PATH}/module.conf";
	    check_mandatory_file_exists="${__D_BU_INST_MODULE_INIT_PATH}/Initializer.sh";

        echo "The ${module_name} module already exists"; echo;

    fi

    # Checking if the module's configuration path exists, or else creating its directory.
    if [ -d "${__D_BU_INST_MODULE_CONF_PATH}" ]; then
	    echo "The ${module_name} module's configurations directory already exists : ${__D_BU_INST_MODULE_CONF_PATH}"

	   	check_mandatory_file_exists "${__D_BU_INST_MODULE_CONF_PATH}/module.conf";
    else
	    mkdir -pv "${__D_BU_INST_MODULE_CONF_PATH}" || { echo "Unable to create the ${__D_BU_INST_MODULE_CONF_PATH} directory"; exit 1; }

	  	check_mandatory_file_exists "${__D_BU_INST_MODULE_CONF_PATH}/module.conf";
    fi

    # Checking if the module's initializer path exists, or else creating its directory.
    if [ -d "${__D_BU_INST_MODULE_INIT_PATH}" ]; then
	    echo "The ${module_name} module's initializer directory already exists : ${__D_BU_INST_MODULE_INIT_PATH}";

	    check_mandatory_file_exists "${__D_BU_INST_MODULE_INIT_PATH}/Initializer.sh";
    else
	    mkdir -pv "${__D_BU_INST_MODULE_INIT_PATH}" || { echo "Unable to create the ${__D_BU_INST_MODULE_INIT_PATH} directory"; exit 1; }

	    check_mandatory_file_exists "${__D_BU_INST_MODULE_INIT_PATH}/Initializer.sh";
    fi

    # Checking if the module's library path exists, or else creating its directory.
    if [ -d "${__D_BU_LIB_MODULE_FUNCTS_PATH}" ]; then
	    echo "The ${module_name} module's library directory already exists : ${__D_BU_LIB_MODULE_FUNCTS_PATH}";

        check_mandatory_file_exists "${__D_BU_LIB_MODULE_FUNCTS_PATH}/${module_name}.lib";
    else
	    mkdir -pv "${__D_BU_LIB_MODULE_FUNCTS_PATH}" || { echo "Unable to create the ${__D_BU_LIB_MODULE_FUNCTS_PATH} directory"; exit 1; }

        check_mandatory_file_exists "${__D_BU_LIB_MODULE_FUNCTS_PATH}/${module_name}.lib";
    fi

    echo;
done

# Printing that the targeted modules were successfully created into the Bash Utils framework's data folders.
if [ "${#__ARG_LIST[@]}" -lt 2 ]; then
    echo "The ${__ARG_LIST[0]} module was successfully created";
else
    echo "The following modules were successfully created :";

    for module in "${__ARG_LIST[@]}"; do
        echo "    - ${module}";
    done
fi

echo;

exit 0;
