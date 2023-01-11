#!/usr/bin/env bash

# ------------------------
## SCRIPT'S INFORMATIONS :

# Name          : Virtualization.sh
# Module        : Software
# Description   : Installation of virtualization softwares (like VMware).
# Author(s)     : Dimitri Obeid
# Version       : beta

# ----------------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!

# shellcheck disable=SC2154,SC1090

# ---------------------
# NOTE ABOUT SHELLCHECK

# To display the content of a variable in a translated string, the use of the printf command is mandatory in order to interpret each "%s" pattern as the value of a variable.

# This means that the Shellcheck warning code SC2059 will be triggered anyway, since we have no choice but to store the entire translated string in a variable.

# If you add new messages to translate, you must call the directive "shellcheck disable=SC2059" before the line where you call the
# command "printf" to display the translated message, otherwise Shellcheck will display many warnings during the debugging procedure.

# --------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in your main script file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then if [[ "${LANG}" == en_* ]]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

elif [[ "${LANG}" == fr_* ]]; then
    echo -e "ATTENTION !" >&2; echo >&2;
    echo -e "Ce script shell (${BASH_SOURCE[0]}) n'est pas conçu pour être directement exécuté !" >&2;
    echo -e "Utilisez seulement ce script en l'incluant dans votre projet." >&2; echo >&2;

else
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

fi; exit 1; fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### INSTALLATION OF VIRTUALIZATION SOFTWARES

## LINUX VIRTUALIZATION SOFTWARES

# Installation of Qemu for Linux.
function BU.Software.Virtualization.InstallQemu.Linux()
{
    #**** Code ****
    BU.Main.OS.IsLinux || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}

# Installation of VMware Workstation for Linux.
function BU.Software.Virtualization.InstallVMwareWorkstation.Linux()
{
    #**** Code ****
    BU.Main.OS.IsLinux || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}


# Installation of Virtualbox for Linux.
function BU.Software.Virtualization.InstallVirtualbox.Linux()
{
    #**** Code ****
    BU.Main.OS.IsLinux || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}

# -----------------------------------------------

## OSX VIRTUALIZATION SOFTWARES

# Installation of Qemu for OSX.
function BU.Software.Virtualization.InstallQemu.OSX()
{
    #**** Code ****
    BU.Main.OS.IsOSX || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}

# Installation of VMware Fusion (OSX software only).
function BU.Software.Virtualization.InstallVMwareFusion()
{
    #**** Code ****
    BU.Main.OS.IsOSX || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}

# Installation of Virtualbox for OSX.
function BU.Software.Virtualization.InstallVirtualbox.OSX()
{
    #**** Code ****
    BU.Main.OS.IsOSX || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}


# -----------------------------------------------

## WINDOWS VIRTUALIZATION SOFTWARES

# Installation of Qemu for Windows.
function BU.Software.Virtualization.InstallQemu.Windows()
{
    #**** Code ****
    BU.Main.OS.IsWindows || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}

# Installation of Virtualbox for Windows.
function BU.Software.Virtualization.InstallVirtualbox.Windows()
{
    #**** Code ****
    BU.Main.OS.IsWindows || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}

# Installation of VMware Workstation for Windows.
function BU.Software.Virtualization.InstallVMwareWorkstation.Windows()
{
    #**** Code ****
    BU.Main.OS.IsWindows || { BU.Main.Echo.Warning ""; BU.Main.Echo.Newline >&2; return 1; };

    return 0;
}


# -----------------------------------------------

## MULTI-PLATFORM INSTALLATION

# Installation of Qemu.
function BU.Software.Virtualization.InstallQemu()
{
    BU.Main.OS.IsLinux          && BU.Software.Virtualization.InstallQemu.Linux                 &&  return 0;
    BU.Main.OS.IsOSX            && BU.Software.Virtualization.InstallQemu.OSX                   &&  return 0;
    BU.Main.OS.IsWindows        && BU.Software.Virtualization.InstallQemuW.indows               &&  return 0;

    BU.Software.PackageManagers.SoftwareNotAvailableForThisOS;                                        return 1;
}

# Installation of Virtualbox.
function BU.Software.Virtualization.InstallVirtualbox()
{
    BU.Main.OS.IsLinux          && BU.Software.Virtualization.InstallVirtualbox.Linux           &&  return 0;
    BU.Main.OS.IsOSX            && BU.Software.Virtualization.InstallVirtualbox.OSX             &&  return 0;
    BU.Main.OS.IsWindows        && BU.Software.Virtualization.InstallVirtualbox.Windows         &&  return 0;

    BU.Software.PackageManagers.SoftwareNotAvailableForThisOS;                                        return 1;
}

# Installation of VMware.
function BU.Software.Virtualization.InstallVMware()
{
    BU.Main.OS.IsLinux          && BU.Software.Virtualization.InstallVMwareWorkstation.Linux    &&  return 0;
    BU.Main.OS.IsOSX            && BU.Software.Virtualization.InstallVMwareFusion               &&  return 0;
    BU.Main.OS.IsWindows        && BU.Software.Virtualization.InstallVMwareWorkstation.Windows  &&  return 0;

    BU.Software.PackageManagers.SoftwareNotAvailableForThisOS;                                        return 1;
}
