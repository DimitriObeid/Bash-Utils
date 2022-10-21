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
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then if [[ "${LANG}" = en_* ]]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

elif [[ "${LANG}" == fr_* ]]; then
    echo -e "ATTENTION !" >&2; echo >&2;
    echo -e "Ce script shell (${BASH_SOURCE[0]}) n'est pas conçu pour être directement exécuté !" >&2;
    echo -e "Utilisez seulement ce script only en l'incluant dans votre projet." >&2; echo >&2;

    exit 1;
fi; fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### PROCCESSING THE CPU INFORMATIONS

## GET CPU INFORMATIONS

# Getting the CPU architecture.
function BU.Hardware.CPU.GetArch()                  { if BU.Main.CMDS.GetCommandPath 'uname'; then BU.Main.Echo.Msg "$(uname -m)" '-n'; return 0; else return 1; fi; }

# Getting the clock frequency.
function BU.Hardware.CPU.GetClockFrequency()        { if BU.Main.CMDS.GetCommandPath 'lshw'; then if BU.Main.Checkings.CheckRootEUID; then BU.Main.Echo.Msg "$(lshw -class processor | awk 'FNR == 13 {print $2}' )" '-n'; return 0; else return 1; fi; else return 1; fi; }

# Getting the summary of the CPU's informations.
function BU.Hardware.CPU.GetInfos()                 { if BU.Main.CMDS.GetCommandPath 'lscpu'; then lscpu; fi }

# Getting the number of cores.
function BU.Hardware.CPU.GetCoresNumber()           { if BU.Main.CMDS.GetCommandPath 'nproc'; then BU.Main.Echo.Msg "$(nproc)" '-n'; return 0; else return 1; fi; }

# Getting the CPU vendor
function BU.Hardware.CPU.GetVendor()                { if BU.Main.CMDS.GetCommandPath 'lshw'; then BU.Main.Echo.Msg "$(lshw -class processor | grep )" '-n'; return 0; else return 1; fi; }

# -----------------------------------------------

## CHECK CPU INFORMATIONS

# Checking if the CPU architecture is 32 bits.
function BU.Hardware.CPU.Is32bits()
{
    if BU.Main.CMDS.GetCommandPath 'lshw'; then
        if BU.Main.Checkings.IsRoot; then
            if [ "$(BU.Main.Echo.Msg "$(lshw -class processor | awk 'FNR == 12 {print $2}')" '-n')" -eq 32 ]; then return 0; fi
        else
            if [ "$(BU.Main.Echo.Msg "$(sudo lshw -class processor | awk 'FNR == 12 {print $2}')" '-n')" -eq 32 ]; then return 0; fi
        fi;
    else
        return 1;
    fi
}

# Checking if the CPU architecture is 64 bits.
function BU.Hardware.CPU.Is64bits()
{
    if BU.Main.CMDS.GetCommandPath 'lshw'; then
        if BU.Main.Checkings.IsRoot; then
            if [ "$(BU.Main.Echo.Msg "$(lshw -class processor | awk 'FNR == 12 {print $2}')" '-n')" -eq 64 ]; then return 0; fi
        else
            if [ "$(BU.Main.Echo.Msg "$(sudo lshw -class processor | awk 'FNR == 12 {print $2}')" '-n')" -eq 64 ]; then return 0; fi
        fi;
    else
        return 1;
    fi
}

# Checking if the CPU architecture is AArch 32 bits.
function BU.Main.CPU.IsArchAArch32()            { true; }

# Checking if the CPU architecture is AArch 64 bits.
function BU.Main.CPU.IsArchAArch64()            { true; }



# Checking if the CPU architecture is ARM 32 bits.
function BU.Main.CPU.IsArchARM32()              { true; }

# Checking if the CPU architecture is ARM 64 bits.
function BU.Main.CPU.IsArchARM64()              { true; }

# Checking if the CPU architecture is AMD64.
function BU.Main.CPU.IsArchAMD64()              { true; }

# Checking if the CPU architecture is i386.
function BU.Main.CPU.IsArchi386()               { true; }

# Checking if the CPU architecture is PowerPC.
function BU.Main.CPU.IsArchPPC()                { true; }

# Checking if the CPU architecture is MIPS.
function BU.Main.CPU.IsArchMIPS()               { true; }

# Checking if the CPU architecture is RISC-V.
function BU.Main.CPU.IsArchRISCV()              { true; }
