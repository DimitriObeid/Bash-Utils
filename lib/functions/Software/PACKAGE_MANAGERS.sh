#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name          : PACKAGE_MANAGERS.SH
# Module        : Software
# Description   : Package manager functions for each operating system.
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

# -----------------------------------------------------------------------------
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your main script file.

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

#### LINUX PACKAGE MANAGERS

## PACKAGE MANAGERS INSTALLATION

# Installing the Node package manager for Linux.
function BU.SoftwarePackageManagersInstallNPMLinux()
{
	#**** Code ****
	BU.IsOSLinux || {  BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# Installing the "Snap" package manager.
function BU.SoftwarePackageManagersInstallSnapLinux()
{
	#**** Code ****
	BU.IsOSLinux || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# -----------------------------------------------

## PACKAGE MANAGERS UPDATE

# Updating the Node package manager for Linux.
function BU.SoftwarePackageManagersUpdateNPMLinux()
{
	#**** Code ****
	BU.IsOSLinux || {  BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# Updating the "Snap" package manager.
function BU.SoftwarePackageManagersUpdateSnapLinux()
{
	#**** Code ****
	BU.IsOSLinux || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# -----------------------------------------------

## PACKAGE AVAILABLE CHECKING (ON THE MANAGER'S DATABASE)


# -----------------------------------------------

## PACKAGE INSTALLATION


# -----------------------------------------------

## PACKAGE UPDATE


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MAC OS PACKAGE MANAGERS

## PACKAGE MANAGERS INSTALLATION

# Install Homebrew on OSX.
function BU.SoftwarePackageManagersInstallHomebrewOSX()
{
    #**** Code ****
    BU.IsOSX || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

    return 0;
}

# Install NPM on OSX.
function BU.SoftwarePackageManagersInstallNPMOSX()
{
    #**** Code ****
    BU.IsOSX || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

    return 0;
}

# -----------------------------------------------

## PACKAGE MANAGERS UPDATE

# Update Homebrew.
function BU.SoftwarePackageManagersUpdateHomebrewOSX()l
{
    BU.IsOSX || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

    return 0;
}

# -----------------------------------------------

## PACKAGE AVAILABLE CHECKING (ON THE MANAGER'S DATABASE)


# -----------------------------------------------

## PACKAGE INSTALLATION


# -----------------------------------------------

## PACKAGE UPDATE


# -----------------------------------------------



# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### WINDOWS PACKAGE MANAGERS

## PACKAGE MANAGERS INSTALLATION

# Installing the Node package manager for Windows.
function BU.SoftwarePackageManagersInstallNPMWindows()
{
	#**** Code ****
	BU.IsOSWindows || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# Installing Chocolatey for Windows.
function BU.SoftwarePackageManagersInstallChocolateyWindows()
{
	#**** Code ****
	BU.IsOSWindows || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# -----------------------------------------------

## PACKAGE MANAGERS UPDATE

# Updating the Node package manager for Windows.
function BU.SoftwarePackageManagersInstallNPMLinux()
{
	#**** Code ****
	BU.IsOSWindows || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# Updating Chocolatey for Windows.
function BU.SoftwarePackageManagersInstallChocolateyWindows()
{
	#**** Code ****
	BU.IsOSWindows || { BU.EchoWarning ""; BU.Newline >&2; return 1; };

	return 0;
}

# -----------------------------------------------

## PACKAGE AVAILABLE CHECKING (ON THE MANAGER'S DATABASE)


# -----------------------------------------------

## PACKAGE INSTALLATION


# -----------------------------------------------

## PACKAGE UPDATE


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### QUICK PACKAGE INSTALLATION, UPDATE AND PROCESSING FOR MULTIPLE OPERATING SYSTEMS

## RESOURCES FUNCTIONS.

# Quick writing if the target operating system is not found.
function BU.SoftwarePackageManagersSoftwareNotAvailableForThisOS()
{
    BU.EchoError ""; BU.Newline;
}

# -----------------------------------------------

## PACKAGE MANAGERS INSTALLATION

# Install NPM on several platforms.
function BU.SoftwarePackageManagersInstallNPM()
{
    BU.IsOSLinux   && BU.SoftwarePackageManagersInstallNPMLinux     &&  return 0;
    BU.IsOSX       && BU.SoftwarePackageManagersInstallNPMOSX       &&  return 0;
    BU.IsOSWindows && BU.SoftwarePackageManagersInstallNPMWindows   &&  return 0;

    BU.SoftwarePackageManagersSoftwareNotAvailableForThisOS;               return 1;
}

# -----------------------------------------------

## PACKAGE MANAGERS UPDATE


# -----------------------------------------------

## PACKAGE AVAILABLE CHECKING (ON THE MANAGER'S DATABASE)


# -----------------------------------------------

## PACKAGE INSTALLATION


# -----------------------------------------------

## PACKAGE UPDATE


# -----------------------------------------------
