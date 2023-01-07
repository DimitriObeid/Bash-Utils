#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : module-mk.sh
# Author(s)     : Dimitri Obeid
# Version       : Beta 1.0

# -----------------
# FILE DESCRIPTION :

# This script creates the bases of each new module you want to create :
#   - their configuration directory,
#   - their initialization directory,
#   - Their library directory

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### GLOBAL VARIABLES (RE)DEFINITION ###########################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# List of modules to create.
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

# Check if the required files for the modules initialization exists in their right folder, or else create them.
function check_mandatory_file_exists()
{
    #**** Parameters ****
    local p_path=${1:-$'\0'};

    #**** Code ****
    if [ ! -f "${p_path}" ]; then
        touch "${p_path}" || { echo "Unable to create this required file ''${p_path}''"; echo; echo "Please create this file manually."; }
    fi
}

# ----------------------------------------------



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
        echo "You must run this script from its directory";
        echo "Aborting module creation";

        exit 1;
    fi

    # Checking if the whole module exists.
    if [ -d "${__D_BU_INST_MODULE_CONF_PATH}" ] && [ -d "${__D_BU_INST_MODULE_INIT_PATH}" ] && [ -d "${__D_BU_LIB_MODULE_FUNCTS_PATH}" ]; then
	    echo "The $module_name module's directories already exist"; exit 0;

	    # Checking if the mandatory files exist.
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
