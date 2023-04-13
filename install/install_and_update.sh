#!/usr/bin/env bash

## NOTE : This script takes in account my defined paths and the fact that I also develop with WSL. Please feel free to modify what you need to modify.

## TODO
##      : Ask to the user if he wants to keep the default paths.
##      : Change each user's newly installed files and folders rights, so that the users can interact easily with these.

## -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PROCESSING INSTALLATION RESOURCES

## DIRECTORIES VARIABLES DECLARATIONS

# /foo/bar/Bash-utils/install directory
__D_INSTALL_DIR_PATH="$(pwd -P "$(basename "${BASH_SOURCE[0]}")")";

# Name of the module manager directory.
__D_MODULE_MANAGER_DIR_NAME=".Bash-utils";

# Path of the module manager directory in the installation directory.
__D_MODULE_MANAGER_OLD_PATH="${__D_INSTALL_DIR_PATH}/${__D_MODULE_MANAGER_DIR_NAME}";

## ==============================================

## DIRECTORIES VARIABLES DECLARATIONS

# Getting the script's name to define the name of the installation log file.
__F_INSTALL_LOG_FILE_NAME="${BASH_SOURCE[0]##*./}";

# Setting the name of the log file according to the user's privileges.
if [ "${EUID}" -eq 0 ]; then
    __F_INSTALL_LOG_FILE_NAME="${__F_INSTALL_LOG_FILE_NAME%%.sh} - ROOT.log";
else
    __F_INSTALL_LOG_FILE_NAME="${__F_INSTALL_LOG_FILE_NAME%%.sh}.log";
fi


# Path of the installation log file.
__F_INSTALL_LOG_FILE_PATH="${__D_INSTALL_DIR_PATH}/${__F_INSTALL_LOG_FILE_NAME}";

# Name of the file which stores the Bash Utils library's root directory's path.
__F_LIBRARY_PATH_FILE_NAME="Bash-utils-root-val.path";

# Path of the aforementionned file in the installation directory.
__F_LIBRARY_PATH_OLD_PARENT_PATH="${__D_MODULE_MANAGER_OLD_PATH}/${__F_LIBRARY_PATH_FILE_NAME}";

# Name of the modules inititialization file.
__F_MODULE_INITIALIZER_FILE_NAME="Bash-utils-init.sh";

# Path of the modules inititialization file in the installation directory.
__F_MODULE_INITIALIZER_OLD_PATH="${__D_INSTALL_DIR_PATH}/${__F_MODULE_INITIALIZER_FILE_NAME}";

# Name of the users home directories paths list file.
if [ "${OSTYPE}" == 'linux-android' ]; then
    __F_USERS_LIST_FILE_NAME="termux-users.list";
else
    __F_USERS_LIST_FILE_NAME="users.list";
fi

# Path of the users home directories paths list file.
__F_USERS_LIST_FILE_PATH="${__D_INSTALL_DIR_PATH}/${__F_USERS_LIST_FILE_NAME}";

## ==============================================

## FUNCTIONS

# ·········································
# Asking to user before engaging an action.

# shellcheck disable=
function AskUser()
{
    #**** Parameters ****
    p_main_question=${1:-$'\0'};
    p_more_informations=${2:-$'\0'};

    #**** Code ****
    printf "%s" "${p_main_question}";

    if [ -n "${p_more_informations}" ]; then
        printf "%s" "${p_more_informations}";
    fi

    printf "";

    read -rp "Enter your answer : " __ANS_ASK;

    return 0;
}

# ·······································
# Behavior if the "$(cd)" command failed.

# shellcheck disable=
function CDfail() { printf "UNABLE TO CHANGE DIRECTORY"; PrintRoot; exit 1; }

# ····················································
# Changing recursively a directory's ownership rights.

# shellcheck disable=
function ChangeDirOwnership()
{
	#**** Parameters ****
	p_user=${1:-$'\0'};
	p_dir=${2:-$'\0'};

	#**** Code ****
	PrintLog "Changing recursively the ownership of the « ${__F_LIBRARY_PATH_NEW_PARENT_PATH} » directory, from « root » to « ${user##*/} »";
	if chown -Rv "${p_user##*/}" "${p_file}"; then PrintLog "The « ${__F_MODULE_INITIALIZER_NEW_PATH} » file ownership was successfully changed"; return 0;
    else BU.Main.Echo.Newline; PrintLog "UNABLE TO RECURSIVELY CHANGE THE OWNERSHIP OF THE « ${p_dir} » DIRECTORY TO « ${user##*/} »"; BU.Main.Echo.NewlineF; PrintRoot; exit 1; fi

}

# ·················································
# Changing individually the files ownership rights.

# shellcheck disable=
function ChangeFileOwnership()
{
	#**** Parameters ****
	p_user=${1:-$'\0'};
	p_file=${2:-$'\0'};

	#**** Code ****
	PrintLog "Changing the ownership of the « ${__F_LIBRARY_PATH_NEW_PARENT_PATH} » file, from « root » to « ${user##*/} »";
	if chown -v "${p_user##*/}" "${p_file}"; then return 0; else PrintLog "UNABLE TO CHANGE THE OWNERSHIP OF THE « ${p_file} » FILE TO « ${user##*/} »"; PrintRoot; exit 1; fi
}

# ························································································
# Changing the ownership of the ".Bash-utils" directory and the "Bash-utils-init.sh" file.

# shellcheck disable=
function ChangeOwnership()
{
	#**** Parameters ****
	user=${1:-$'\0'};

	#**** Code ****
	if [ "${user}" != '/root' ]; then
        if [ "${__ARG,,}" == 'update' ] || [ "${__ARG,,}" == 'u' ]; then ChangeFileOwnership "${user##*/}" "${__F_LIBRARY_PATH_NEW_PARENT_PATH}"; BU.Main.Echo.Newline; return 0; fi

        PrintLog "Changing recursively the ownership of the newly installed « ${__D_MODULE_MANAGER_NEW_PATH} » folder, from 'root' to « ${user##*/} »";
        ChangeDirOwnership "${user##*/}" "${__D_MODULE_MANAGER_NEW_PATH}";

        BU.Main.Echo.Newline;
        PrintLog "The « ${__D_MODULE_MANAGER_NEW_PATH} » folder ownership was successfully changed";

        BU.Main.Echo.Newline; PrintLine; BU.Main.Echo.Newline; sleep 0.5;

        PrintLog "Changing the ownership of the newly « ${__F_MODULE_INITIALIZER_NEW_PATH} » file, from root to « ${user##*/} »";
        ChangeFileOwnership "${user##*/}" "${__F_MODULE_INITIALIZER_NEW_PATH}";

        BU.Main.Echo.Newline;
        PrintLog "The « ${__F_MODULE_INITIALIZER_NEW_PATH} » file ownership was successfully changed";

        return 0;
    else
        return 0;
    fi
}

# ······································································
# Copying the modules inititializer file into the user's home directory.

# shellcheck disable=
function CopyModulesInitializer()
{
	#**** Parameters ****
	user=${1:-$'\0'};

	#**** Code ****
    if [ ! -f "${__F_MODULE_INITIALIZER_NEW_PATH}" ]; then
        PrintLog "Copying the « ${__F_MODULE_INITIALIZER_OLD_PATH} » file in the « ${user} » directory";
        cp -v "${__F_MODULE_INITIALIZER_OLD_PATH}" "${__F_MODULE_INITIALIZER_NEW_PATH}" || { PrintLog "UNABLE TO COPY THE « ${__F_MODULE_INITIALIZER_OLD_PATH} » FILE IN THE « ${user} » DIRECTORY"; PrintRoot; exit 1; }

	BU.Main.Echo.Newline;

	else
        PrintLog "Overwriting the « ${__F_MODULE_INITIALIZER_NEW_PATH} » file in the « ${user} » directory";
        true > "${__F_MODULE_INITIALIZER_NEW_PATH}" || { PrintLog "UNABLE TO OVERWRITE THE « ${__F_MODULE_INITIALIZER_NEW_PATH} » FILE IN THE « ${user} » DIRECTORY"; exit 1; }

        PrintLog "Copying the « ${__F_MODULE_INITIALIZER_OLD_PATH} » file in the « ${user} » directory";
        cp -v "${__F_MODULE_INITIALIZER_OLD_PATH}" "${__F_MODULE_INITIALIZER_NEW_PATH}" || { PrintLog "UNABLE TO COPY THE « ${__F_MODULE_INITIALIZER_OLD_PATH} » FILE IN THE « ${user} » DIRECTORY"; PrintRoot; exit 1; }
    fi
}

# ·····································································
# Copying the modules manager directory into the user's home directory.

# shellcheck disable=
function CopyModulesManagerDirectory()
{
	#**** Parameters ****
	user=${1:-$'\0'};

	#**** Code ****
    if [ -d "${__D_MODULE_MANAGER_NEW_PATH}" ]; then

        PrintLog "Erasing the existing « ${__D_MODULE_MANAGER_NEW_PATH} » modules manager directory into the « ${user} » directory";

		# WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY «< WHAT YOU DO !!!
        # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
        # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

        # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
        rm -rfv "${__D_MODULE_MANAGER_NEW_PATH/:?}/"* || { PrintLog "UNABLE TO OVERWRITE THE HIDDEN « ${__D_MODULE_MANAGER_NEW_PATH} » MODULES MANAGER'S DIRECTORY !"; PrintRoot; exit 1; }
        BU.Main.Echo.Newline;

        PrintLog "Copying the « ${__D_MODULE_MANAGER_NEW_PATH} » modules manager directory into the « ${user} » directory";
		cp -rv "${__D_MODULE_MANAGER_OLD_PATH}" "${user}" || { PrintLog "UNABLE TO COPY THE « ${__D_MODULE_MANAGER_OLD_PATH} » DIRECTORY INTO THE « ${user} » DIRECTORY !"; PrintRoot; exit 1; }

		BU.Main.Echo.Newline;
    else
        PrintLog "Copying the « ${__D_MODULE_MANAGER_NEW_PATH} » modules manager directory into the « ${user} » directory";
        cp -rv "${__D_MODULE_MANAGER_OLD_PATH}" "${user}" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE « ${user} » DIRECTORY !" "${__D_MODULE_MANAGER_OLD_PATH}"; PrintRoot; exit 1; }

		BU.Main.Echo.Newline;
	fi
}

# ····················
# Log file processing.

# shellcheck disable=
function Log()
{
    if [ -f "${__F_INSTALL_LOG_FILE_PATH}" ] && [ -s "${__F_INSTALL_LOG_FILE_PATH}" ]; then
        true > "${__F_INSTALL_LOG_FILE_PATH}" || { printf "UNABLE TO ERASE THE EXISTING CONTENT OF THE « %s » LOG FILE\n\nPlease erase the content of this file by yourself, or execute this script with « nolog » as extra argument." "${__F_INSTALL_LOG_FILE_PATH}"; exit 1; }
	fi

    PrintLog '' 'log';

	PrintLog "USER'S OPERATING SYSTEM DATA" 'log';
	PrintLog "Operating system family : ${OSTYPE}" 'log';

	if [ -f "/etc/os-release" ]; then PrintLog "Operating system general informations : $(cat "/etc/os-release")" 'log'; fi

	PrintLog '' 'log'; PrintLog "$(PrintLine)" 'log'; PrintLog '' 'log';
}

# ·········································································
# New line function for the functions called into the following "for" loop.

# shellcheck disable=
function BU.Main.Echo.Newline()
{
    #**** Parameters ****
    local p_line_breaks=${1:-$'\0'};

#     #**** Code ****
    if [[ "${p_line_breaks}" =~ ^[\-0-9]+$ ]]; then
        for (( i=0; i<p_line_breaks; i++ )); do
            echo;
        done
    else
        echo;
    fi
}

# ··································································································································
# New line function called into the the following "for" loop, and after each PrintLog functions, if a linebreak should be displayed.

# shellcheck disable=
function BU.Main.Echo.NewlineF() { local p_line_breaks=${1:-$'\0'}; if [[ "${p_line_breaks}" =~ ^[\-0-9]+$ ]]; then PrintLog "$(BU.Main.Echo.Newline "${p_line_breaks}")"; else PrintLog "$(BU.Main.Echo.Newline)"; fi; return 0; }

# ···························································
# Printing a line according to the terminal's columns number.

# shellcheck disable=
function PrintLine()
{
    if command -v tput &> /dev/null; then
        __cols="$(tput cols || stty size | cut -d " " -f2)";
    else
        __cols="$(stty size | cut -d " " -f2)";
    fi

	for _ in $(eval echo -e "{1..${__cols}}"); do
            printf '-';
    done; PrintLog "$(BU.Main.Echo.Newline)"; return 0;
}

# ···············
# Checking if the

# shellcheck disable=
function PrintLog()
{
    if [ "${__NOLOG}" == 'nolog' ]; then
        if [ -n "${2}" ] && [ "${2}" == 'log' ]; then
            echo -e "${1}"; BU.Main.Echo.Newline; return 0 # >> "${__F_INSTALL_LOG_FILE_PATH}"; BU.Main.Echo.Newline >> "${__F_INSTALL_LOG_FILE_PATH}"; return 0;
        else
            echo -e "${1}" 2>&1 | tee -a "${__F_INSTALL_LOG_FILE_PATH}"; BU.Main.Echo.Newline 2>&1 | tee -a "${__F_INSTALL_LOG_FILE_PATH}"; return 0;
        fi
    else
        echo -e "${1}"; return 0;
    fi
}

# ·····························································
# Printing back the "/root" path in the normal users list file.

# shellcheck disable=
function PrintRoot() { if [ "${__UNROOT}" == 'true' ] && [ "${OSTYPE}" != 'linux-android' ]; then printf '/root' >> "${__F_USERS_LIST_FILE_PATH}"; fi; return 0; }

## ==============================================



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BEGINNING INSTALLATION

# INITIALIZATION

# Installation type argument.
__ARG=${1:-$'\0'};
__NOLOG=${2:-$'\0'};

if [ -z "${__NOLOG}" ]; then
    Log
elif [ "${__NOLOG}" != 'nolog' ]; then
    echo "WARNING : you tried to pass a second argument, which is not the expected « nolog » value";
    echo "Do you want to create the log file ? Type « yes » (case insenitive) if you want it, otherwise, type « no » or any other value"; echo;

    read -rp 'Please type your answer : ' __nolog_ans;

    if [ "${__nolog_ans,,}" == 'yes' ]; then
        Log;
    fi

    echo;
fi

# Checking if the library is being installed on a computer without the "su" command or an authorization to access to root privileges (like an unrooted Android device).
if [ "${EUID}" -ne 0 ]; then
    PrintLog "Are you sure you want to install this library without super-user privileges ?"; BU.Main.Echo.NewlineF; sleep .3;

    PrintLog "If it was a mistake, please relaunch this script with the « sudo » command, or else you will not be able to use any function that require these privileges."; BU.Main.Echo.Newline; sleep .3;

    PrintLog "Please install this library whitout these privileges ONLY if you don't have super-user privileges, or if you can't install or use the « su » or « sudo » command, or if you're using an unrooted Android device."; BU.Main.Echo.NewlineF;

    PrintLog "Do you want to continue the installation ? Answer '« es » (case unsensitive) if you want to continue, or type any other answer if you want to abort the installation."; BU.Main.Echo.NewlineF;


    read -rp "Please type your answer : " __ans

    if [ -f "${__F_INSTALL_LOG_FILE_PATH}" ]; then
        PrintLog "Please type your answer" 'log';
        PrintLog "Answer : ${__ans}" 'log'; BU.Main.Echo.NewlineF;
    fi

    if [ "${__ans,,}" != 'yes' ]; then
        PrintLog "Aborting installation"; BU.Main.Echo.NewlineF;

        PrintLog "Please check the « ${__F_INSTALL_LOG_FILE_PATH} » log file"; BU.Main.Echo.NewlineF;

        exit 1;
    fi

	echo;

    __UNROOT="true";
fi

# If the installation is made without super-user's privileges.
if [ "${__UNROOT}" == 'true' ]; then
    # Sorting the users list to get the "/root" path at last line, so the deletion of this path will be easier.
    PrintLog "Copying and sorting the content of the « ${__F_USERS_LIST_FILE_PATH} » file to the « ${__F_USERS_LIST_FILE_PATH}.tmp » file" 'log';

    # shellcheck disable=SC2002
    cat "${__F_USERS_LIST_FILE_PATH}" | sort > "${__F_USERS_LIST_FILE_PATH}.tmp"  || { PrintLog "UNABLE TO CREATE THE « ${__F_USERS_LIST_FILE_PATH}.tmp » FILE"; $ exit 1; }
    PrintLog 'Done' 'log'; echo;

    PrintLog "Copying back the content of the « ${__F_USERS_LIST_FILE_PATH}.tmp » file to the « ${__F_USERS_LIST_FILE_PATH} » file" 'log'
    cat "${__F_USERS_LIST_FILE_PATH}.tmp" > "${__F_USERS_LIST_FILE_PATH}"         || { PrintLog "UNABLE TO COPY THE CONTENT OF THE « ${__F_USERS_LIST_FILE_PATH}.tmp » TO THE « ${__F_USERS_LIST_FILE_PATH} » FILE"; exit 1; }
    PrintLog 'Done' 'log'; echo;

    PrintLog "Removing the « ${__F_USERS_LIST_FILE_PATH}.tmp » file" 'log'
    rm "${__F_USERS_LIST_FILE_PATH}.tmp"      || { PrintLog "UNABLE TO REMOVE THE « ${__F_USERS_LIST_FILE_PATH}.tmp » FILE"; exit 1; }
    PrintLog 'Done' 'log'; echo;

    # Finding the "/root" path at the end of the users list file.
    LAST=$(tail -n 1 "${__F_USERS_LIST_FILE_PATH}");

    # Truncating this aforementionned file.
    let TRUNCATE_SIZE="${#LAST} + 1";

    # Deleting the "/root" path
    truncate -s -"${TRUNCATE_SIZE}" "${__F_USERS_LIST_FILE_PATH}";
fi

# Feel free to add any user's home directory path into the users list.
mapfile -t __TARGET_HOME_DIRECTORIES < "${__F_USERS_LIST_FILE_PATH}" || { PrintLog "UNABLE TO GET THE USERS LIST FILE"; PrintLog "Please navigate to this directory, and execute this script right there --> $(pwd -P "$(basename "${BASH_SOURCE[0]}")")" 'log'; PrintRoot; exit 1; }

## ==============================================

## CODE
PrintLog "Copying the Bash Utils root directory path into the ${__F_LIBRARY_PATH_FILE_NAME} file";
PrintLog "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")" || CDfail; cd .. || CDfail; pwd -P)" 2>&1 | tee "${__F_LIBRARY_PATH_OLD_PARENT_PATH}" || { PrintLog "UNABLE TO WRITE THE BASH UTILS ROOT DIRECTORY PATH INTO THE %s FILE" "${__F_LIBRARY_PATH_FILE_NAME}"; PrintRoot; exit 1; }
PrintLog "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")" || CDfail; cd .. || CDfail; pwd -P)" 'log';
PrintLog "Successfully copied the Bash Utils root directory path into the ${__F_LIBRARY_PATH_FILE_NAME} file";

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do

	if [ ! -d "${user}" ]; then
        PrintLog "ERROR --> « ${user} » IS NOT AN EXISTING USER !"; PrintRoot; exit 1;
	else
        #~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        #~ NEW DIRECTORIES VARIABLES DECLARATIONS
        #~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        # Path of the module manager directory in the user's directory.
        __D_MODULE_MANAGER_NEW_PATH="${user}/${__D_MODULE_MANAGER_DIR_NAME}";

        #~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        #~ NEW FILES VARIABLES DECLARATIONS
        #~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        # Path of the file which stores the Bash Utils library's root directory's path, in the user's home directory.
        __F_LIBRARY_PATH_NEW_PARENT_PATH="${__D_MODULE_MANAGER_NEW_PATH}/${__F_LIBRARY_PATH_FILE_NAME}";

        __F_MODULE_INITIALIZER_NEW_PATH="${user}/${__F_MODULE_INITIALIZER_FILE_NAME}";

        ## -----------------------------------------------

        ## CODE

		BU.Main.Echo.NewlineF; PrintLog "$(PrintLine)"; PrintLog "PROCESSED USER : ${user##*/}"; PrintLog "$(PrintLine)"; BU.Main.Echo.NewlineF; sleep 1;

		if [ "${__ARG,,}" == 'install' ] || [ "${__ARG,,}" == 'i' ]; then

			PrintLog "$(CopyModulesManagerDirectory "${user}")"; sleep 0.5;

			PrintLog "$(CopyModulesInitializer "${user}")"; sleep 0.5;

			BU.Main.Echo.NewlineF; PrintLog "$(PrintLine)"; BU.Main.Echo.NewlineF; sleep 0.5;

			if [ "${EUID}" == 0 ]; then ChangeOwnership "${user}"; sleep 0.5; fi

		elif [ "${__ARG,,}" == 'update' ] || [ "${__ARG,,}" == 'u' ]; then

			if [ -f "${__F_LIBRARY_PATH_NEW_PARENT_PATH}" ]; then
				PrintLog "Overwriting the « ${__F_LIBRARY_PATH_FILE_NAME} » file in the « ${__D_MODULE_MANAGER_NEW_PATH} » directory";
				true > "${__F_LIBRARY_PATH_NEW_PARENT_PATH}" || { PrintLog "UNABLE TO OVERWRITE THE « ${__F_LIBRARY_PATH_FILE_NAME} FILE IN THE « ${__D_MODULE_MANAGER_NEW_PATH} » DIRECTORY"; PrintRoot; exit 1; }

				PrintLog "Copying the ${__F_LIBRARY_PATH_OLD_PARENT_PATH} » file in the ${__D_MODULE_MANAGER_NEW_PATH} » directory";
				cp -v "${__F_LIBRARY_PATH_OLD_PARENT_PATH}" "${__F_LIBRARY_PATH_NEW_PARENT_PATH}" || { PrintLog "UNABLE TO COPY THE « ${__F_LIBRARY_PATH_OLD_PARENT_PATH} » FILE IN THE « ${__F_LIBRARY_PATH_NEW_PARENT_PATH} » DIRECTORY"; PrintRoot; exit 1; }

				BU.Main.Echo.Newline;
			else
				PrintLog "Copying the « ${__F_LIBRARY_PATH_OLD_PARENT_PATH} file in the « ${__D_MODULE_MANAGER_NEW_PATH} » directory";
				cp -v "${__F_LIBRARY_PATH_OLD_PARENT_PATH}" "${__F_LIBRARY_PATH_NEW_PARENT_PATH}" || { PrintLog "UNABLE TO COPY THE « ${__F_LIBRARY_PATH_OLD_PARENT_PATH} » FILE IN THE « ${__F_LIBRARY_PATH_NEW_PARENT_PATH} » DIRECTORY"; PrintRoot; exit 1; }

				BU.Main.Echo.Newline;
			fi

			if [ "${EUID}" == 0 ]; then ChangeOwnership "${user}"; sleep 0.5; fi
		else
			PrintLog "THE INSTALLATION MODE MUST BE SPECIFIED AS FIRST ARGUMENT\n\nThe accepted values are « install » or « i » for the installation of the modules manager, or « update » or « u » for the update of the Bash Utils root directory's path."; PrintRoot; exit 1;
		fi

		PrintLog "$(PrintLine)";

		PrintLog "THE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR THE « ${user##*/} » USER !";
    fi
done

PrintLog "$(PrintLine)"; BU.Main.Echo.NewlineF;

PrintLog "THE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR EVERY LISTED USERS :";

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
	PrintLog "- ${user##*/}";
done

PrintLog "";

# Printing back the "/root" path into the users list file if the installation was done without the super-user's privileges.
PrintRoot

if [ "${__ARG}" == 'install' ] || [ "${__ARG}" == 'i' ]; then
	PrintLog "Please check the « ${__F_INSTALL_LOG_FILE_PATH} » log file to verify if the installation was successful";
elif [ "${__ARG}" == 'update' ] || [ "${__ARG}" == 'u' ]; then
	PrintLog "Please check the « ${__F_INSTALL_LOG_FILE_PATH} » log file to verify if the update was successful";
fi

# if [ "${EUID}" -eq 0 ]; then
#     # TODO : Get the current home directory.
#     ChangeFileOwnership "";
# fi

printf "";

exit 0;
