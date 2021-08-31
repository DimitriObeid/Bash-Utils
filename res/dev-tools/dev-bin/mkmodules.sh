#!/usr/bin/env bash

# Check if the module's name was passed as argument when this script was executed.
if [ -z "$1" ]; then
	echo "This script takes a mandatory argument : the new module's name"; exit 1
elif [ "$#" -ne 1 ]; then
	echo "This script takes only one mandatory argument : the new module's name"; exit 1
fi

# ----------

## VARIABLES

# Bash Utils library root path from this script's path.
__D_BU_LIB_ROOT_PATH="../../.."

__D_BU_INST_MODULE_CONF_PATH="$__D_BU_LIB_ROOT_PATH/install/.Bash-utils/config/modules/$1"

__D_BU_INST_MODULE_INIT_PATH="$__D_BU_LIB_ROOT_PATH/install/.Bash-utils/modules/$1"

__D_BU_LIB_MODULE_FUNCTS_PATH="$__D_BU_LIB_ROOT_PATH/lib/functions/$1"


if [ -d "$__D_BU_INST_MODULE_CONF_PATH" ] && [ -d "$__D_BU_INST_MODULE_INIT_PATH" ] && [ -d "$__D_BU_LIB_MODULE_FUNCTS_PATH" ]; then
	echo "The $1 module already exists"; exit 0
fi

if [ -d "$__D_BU_INST_MODULE_CONF_PATH" ]; then
	echo "This module already exists in the $__D_BU_INST_MODULE_CONF_PATH directory"
else
	mkdir -pv "$__D_BU_INST_MODULE_CONF_PATH" || { echo "Unable to create the $__D_BU_INST_MODULE_CONF_PATH directory"; exit 1; }
fi

if [ -d "$__D_BU_INST_MODULE_INIT_PATH" ]; then
	echo "This module already exists in the $__D_BU_INST_MODULE_INIT_PATH directory"
else
	mkdir -pv "$__D_BU_INST_MODULE_INIT_PATH" || { echo "Unable to create the $__D_BU_INST_MODULE_INIT_PATH directory"; exit 1; }
fi

if [ -d "$__D_BU_LIB_MODULE_FUNCTS_PATH" ]; then
	echo "This module already exists in the $__D_BU_LIB_MODULE_FUNCTS_PATH directory"
else
	mkdir -pv "$__D_BU_LIB_MODULE_FUNCTS_PATH" || { echo "Unable to create the $__D_BU_LIB_MODULE_FUNCTS_PATH directory"; exit 1; }
fi
