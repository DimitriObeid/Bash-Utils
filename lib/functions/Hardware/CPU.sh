#!/usr/bin/env bash

# ---------------------
# SCRIPT'S INFORMATIONS

# Name          : CPU.lib
# Module        : Hardware
# Description   : Functions used to process information about the CPU.
# Author(s)     : Dimitri Obeid
# Version       :

# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC2154

# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

    exit 1;
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### PROCCESSING THE CPU INFORMATIONS

## GET CPU INFORMATIONS

# Getting the number of cores.
function BU::Hardware::CPU::GetCoresNumber() { EchoMsg "$(nproc)" '-n'; }

# Getting the CPU architecture.
function BU::Hardware::CPU::GetArch() { EchoMsg "$(uname -m)" '-n'; }

# Getting the CPU vendor
function BU::Hardware::CPU::GetVendor() { EchoMsg "$(lshw -class processor | grep )" '-n'; }
