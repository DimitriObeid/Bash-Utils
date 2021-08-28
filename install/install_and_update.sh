#!/usr/bin/env bash

## NOTE : This script takes in account my defined paths and the fact that I also develop with WSL. Please feel free to modify what you need to modify.

## TODO
##      : Ask to the user if he wants to keep the default paths.
##      : Change each user's newly installed files and folders rights, so that the users can interact easily with these.

# ------------------------------------------------

## DIRECTORIES VARIABLES DECLARATIONS

# /foo/bar/Bash-utils/install directory
__D_INSTALL_DIR_PATH="$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"

# Name of the module manager directory.
__D_MODULE_MANAGER_DIR_NAME=".Bash-utils"

# Path of the module manager directory in the installation directory.
__D_MODULE_MANAGER_OLD_PATH="$__D_INSTALL_DIR_PATH/$__D_MODULE_MANAGER_DIR_NAME"

# ------------------------------------------------

## DIRECTORIES VARIABLES DECLARATIONS

# Name of the installation log file.
__F_INSTALL_LOG_FILE_NAME="${BASH_SOURCE[0]##*./}"
__F_INSTALL_LOG_FILE_NAME="${__F_INSTALL_LOG_FILE_NAME%%.sh}.log"

# Path of the installation log file.
__F_INSTALL_LOG_FILE_PATH="$__D_INSTALL_DIR_PATH/$__F_INSTALL_LOG_FILE_NAME"

# Name of the file which stores the Bash Utils library's root directory's path.
__F_LIBRARY_PATH_FILE_NAME="Bash-utils-root-val.path"

# Path of the aforementionned file in the installation directory.
__F_LIBRARY_PATH_OLD_PARENT_PATH="$__D_MODULE_MANAGER_OLD_PATH/$__F_LIBRARY_PATH_FILE_NAME"

# Name of the modules inititialization file.
__F_MODULE_INITIALIZER_FILE_NAME="Bash-utils-init.sh"

# Path of the modules inititialization file in the installation directory.
__F_MODULE_INITIALIZER_OLD_PATH="$__D_INSTALL_DIR_PATH/$__F_MODULE_INITIALIZER_FILE_NAME"

# ------------------------------------------------

## FUNCTIONS

# Behavior if the "cd" command failed.
function CDfail() { printf "UNABLE TO CHANGE DIRECTORY\n\n"; PrintRoot; exit 1; }

# Changing the ownership of the ".Bash-utils" directory and the "Bash-utils-init.sh" file.
function ChangeOwnership()
{
	#***** Parameters *****
	user=$1

	#***** Code *****
	if [ "${__ARG,,}" = 'update' ] || [ "${__ARG,,}" = 'u' ]; then
		printf "Changing the ownership of the %s file, from root to %s\n\n" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" "${user##*/}"
		chown -v "${user##*/}" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" || { printf "\nUNABLE TO CHANGE THE OWNERSHIP OF THE %s FILE TO %s\n\n" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" "${user##*/}"; PrintRoot; exit 1; }

		Newline

		return 0
	fi

    printf "Changing recursively the ownership of the newly installed %s folder, from root to %s\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "${user##*/}"
    chown -Rv "${user##*/}" "$__D_MODULE_MANAGER_NEW_PATH" || { printf "\nUNABLE TO RECURSIVELY CHANGE THE OWNERSHIP OF THE %s DIRECTORY TO %s\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "${user##*/}"; PrintRoot; exit 1; }

	Newline
	printf "The %s folder ownership was successfully changed\n\n" "$__D_MODULE_MANAGER_NEW_PATH"

	Newline; PrintLine; Newline; sleep 0.5

	printf "Changing the ownership of the newly %s file, from root to %s\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH" "${user##*/}"
    chown -v "${user##*/}" "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "\nUNABLE TO CHANGE THE OWNERSHIP OF THE %s FILE TO %s\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH" "${user##*/}"; PrintRoot; exit 1; }

	Newline
	printf "The %s file ownership was successfully changed\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH"
}

# Copying the modules inititializer file into the user's home directory.
function CopyModulesInitializer()
{
	#***** Parameters *****
	user=$1

	#***** Code *****
    if [ ! -f "$__F_MODULE_INITIALIZER_NEW_PATH" ]; then
        printf "Copying the %s file in the %s directory" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"
        cp -v "$__F_MODULE_INITIALIZER_OLD_PATH" "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO COPY THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"; PrintRoot; exit 1; }

	Newline

	else
        printf "Overwriting the %s file in the %s directory" "$__F_MODULE_INITIALIZER_NEW_PATH" "$user"
        true > "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO OVERWRITE THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH" "$user"; exit 1; }

        printf "Copying the %s file in the %s directory" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"
        cp -v "$__F_MODULE_INITIALIZER_OLD_PATH" "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO COPY THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"; PrintRoot; exit 1; }
    fi
}

# Copying the modules manager directory into the user's home directory.
function CopyModulesManagerDirectory()
{
	#***** Parameters *****
	user=$1

	#***** Code *****
    if [ -d "$__D_MODULE_MANAGER_NEW_PATH" ]; then

        printf "Erasing the existing %s modules manager directory into the %s directory\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"

		# WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
        # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
        # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

        # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
        rm -rfv "${__D_MODULE_MANAGER_NEW_PATH/:?}/"* || { printf "UNABLE TO OVERWRITE THE HIDDEN %s MODULES MANAGER'S DIRECTORY !\n\n" "$__D_MODULE_MANAGER_NEW_PATH"; PrintRoot; exit 1; }
        Newline

        printf "Copying the %s modules manager directory into the %s directory\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"
		cp -rv "$__D_MODULE_MANAGER_OLD_PATH" "$user" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE $user DIRECTORY !\n\n" "$__D_MODULE_MANAGER_OLD_PATH"; PrintRoot; exit 1; }

		Newline
    else
        printf "Copying the %s modules manager directory into the %s directory\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"
        cp -rv "$__D_MODULE_MANAGER_OLD_PATH" "$user" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE $user DIRECTORY !\n\n" "$__D_MODULE_MANAGER_OLD_PATH"; PrintRoot; exit 1; }

		Newline
	fi
}

# Log file processing.
function Log()
{
    if [ -f "$__F_INSTALL_LOG_FILE_PATH" ] && [ -s "$__F_INSTALL_LOG_FILE_PATH" ]; then
        true > "$__F_INSTALL_LOG_FILE_PATH" || { printf "UNABLE TO ERASE THE EXISTING CONTENT OF THE %s LOG FILE\n\nPlease erase the content of this file by yourself\n\n" "$__F_INSTALL_LOG_FILE_PATH"; exit 1; }
	fi

    printf '\n' >> "$__F_INSTALL_LOG_FILE_PATH"
	
	printf "USER'S OPERATING SYSTEM DATA\n\n" >> "$__F_INSTALL_LOG_FILE_PATH"
	printf "Operating system family : %s\n" "$OSTYPE" >> "$__F_INSTALL_LOG_FILE_PATH"

	if [ -f "/etc/os-release" ]; then printf "Operating system general informations : %s" "$(cat "/etc/os-release")" >> "$__F_INSTALL_LOG_FILE_PATH"; fi

	printf '\n\n' >> "$__F_INSTALL_LOG_FILE_PATH"; PrintLine >> "$__F_INSTALL_LOG_FILE_PATH"; printf '\n' >> "$__F_INSTALL_LOG_FILE_PATH"
}

# New line function for the functions called into the following "for" loop.
function Newline() { printf "\n"; }

# New line function called into the the followig "for" loop.
function NewlineF() { Newline 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; }

# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)"

	for _ in $(eval echo -e "{1..$__cols}"); do
            printf '-'
    done; printf "\n"
}

# Printing back the "/root" path in the "users.list" file.
function PrintRoot() { if [ "$__UNROOT" = 'true' ]; then printf '/root' >> 'users.list'; fi; }

# ------------------------------------------------

# INITIALIZATION

Log

# Checking if the library is being installed on a computer without the "su" command or an authorization to access to root privileges (like an unrooted Android device).
if [ "$EUID" -ne 0 ]; then
    {
        printf "Are you sure you want to install this library without super-user privileges ?\n\n"; sleep .3

        printf "If it was a mistake, please relaunch this script with the 'sudo' command, or else you will not be able to use any function that require these privileges.\n\n"; sleep .3

        printf "Please install this library whitout these privileges ONLY if you don't have super-user privileges / can't install the 'su' or 'sudo' command, or if you're using an unrooted Android device.\n\n"

        printf "Do you want to continue the installation ? Answer 'yes' (case unsensitive) if you want to continue, or type any other answer if you want to abort the installation.\n\n"
    } 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"

    read -rp "Type your answer : " __ans
    printf "Type your answer" >> "$__F_INSTALL_LOG_FILE_PATH"
    printf "Answer : %s\n\n" "$__ans" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"


    if [ "${__ans,,}" != 'yes' ]; then
        printf "\n\nAborting installation\n\n" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
        
        printf "Please check the %s log file\n\n" "$__F_INSTALL_LOG_FILE_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"

        exit 1
    fi

    __UNROOT="true"
fi


if [ "$__UNROOT" = 'true' ]; then
    # Sorting the users list to get the "/root" path at last line, so the deletion of this path will be easier.
    printf "Copying and sorting the content of the 'users.list' file to the 'users.list.tmp\n' file" >> "$__F_INSTALL_LOG_FILE_PATH"

    # shellcheck disable=SC2002
    cat "users.list" | sort > "users.list.tmp"  || { printf "UNABLE TO CREATE THE 'users.list' FILE\n\n"; $ exit 1; }
    printf 'Done\n\n' >> "$__F_INSTALL_LOG_FILE_PATH"

    printf "Copying back the content of the 'users.list.tmp' file to the 'users.list' file" >> "$__F_INSTALL_LOG_FILE_PATH"
    cat "users.list.tmp" > "users.list"         || { printf "UNABLE TO COPY THE CONTENT OF THE 'users.list.tmp' TO THE 'users.list' FILE\n\n"; exit 1; }
    printf 'Done\n\n' >> "$__F_INSTALL_LOG_FILE_PATH"

    printf "Removing the 'users.list.tmp' file" >> "$__F_INSTALL_LOG_FILE_PATH"
    rm "users.list.tmp"                         || { printf "UNABLE TO REMOVE THE 'users.list.tmp' FILE\n\n"; exit 1; }
    printf 'Done\n\n' >> "$__F_INSTALL_LOG_FILE_PATH"

    # Finding the "/root" path at the end of the "users.list" file.
    LAST=$(tail -n 1 users.list)

    # Truncating this aforementionned file.
    let TRUNCATE_SIZE="${#LAST} + 1"

    # Deleting the "/root" path
    truncate -s -"$TRUNCATE_SIZE" users.list
fi

# Feel free to add any user's home directory path into the "users.list" file.
mapfile -t __TARGET_HOME_DIRECTORIES < "users.list" || { printf "\nUNABLE TO GET THE USERS LIST FILE\n\nPlease navigate to this directory, and execute this script right there --> %s\n\n" "$(pwd -P "$(basename "${BASH_SOURCE[0]}")")" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1; }


# Installation type argument.
__ARG=$1

# ------------------------------------------------

## CODE
printf "Copying the Bash Utils root directory path into the %s file\n" "$__F_LIBRARY_PATH_FILE_NAME" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
printf "%s" "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")" || CDfail; cd .. || CDfail; pwd -P)" 2>&1 | tee "$__F_LIBRARY_PATH_OLD_PARENT_PATH" || { printf "UNABLE TO WRITE THE BASH UTILS ROOT DIRECTORY PATH INTO THE %s FILE" "$__F_LIBRARY_PATH_FILE_NAME" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1; }
printf "%s" "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")" || CDfail; cd .. || CDfail; pwd -P)" >> "$__F_INSTALL_LOG_FILE_PATH"
printf "\n\nSuccessfully copied the Bash Utils root directory path into the %s file\n\n" "$__F_LIBRARY_PATH_FILE_NAME" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do

	if [ ! -d "$user" ]; then
        printf "ERROR --> %s IS NOT AN EXISTING USER !\n\n" "$user" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1
	else
        # ------------------------------------------------

        ## NEW DIRECTORIES VARIABLES DECLARATIONS

        # Path of the module manager directory in the user's directory.
        __D_MODULE_MANAGER_NEW_PATH="$user/$__D_MODULE_MANAGER_DIR_NAME"

        # ------------------------------------------------

        ## NEW FILES VARIABLES DECLARATIONS

        # Path of the file which stores the Bash Utils library's root directory's path, in the user's home directory.
        __F_LIBRARY_PATH_NEW_PARENT_PATH="$__D_MODULE_MANAGER_NEW_PATH/$__F_LIBRARY_PATH_FILE_NAME"

        __F_MODULE_INITIALIZER_NEW_PATH="$user/$__F_MODULE_INITIALIZER_FILE_NAME"

        # ------------------------------------------------

        ## CODE

		PrintLine 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; printf "PROCESSED USER : %s\n" "${user##*/}" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintLine 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; NewlineF; sleep 1

		if [ "${__ARG,,}" = 'install' ] || [ "${__ARG,,}" = 'i' ]; then

			CopyModulesManagerDirectory "$user" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; sleep 0.5

			CopyModulesInitializer "$user" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; sleep 0.5

			NewlineF; PrintLine 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; NewlineF; sleep 0.5

			ChangeOwnership "$user" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; sleep 0.5

		elif [ "${__ARG,,}" = 'update' ] || [ "${__ARG,,}" = 'u' ]; then

			if [ -f "$__F_LIBRARY_PATH_NEW_PARENT_PATH" ]; then
				printf "Overwriting the %s file in the %s directory\n\n" "$__F_LIBRARY_PATH_FILE_NAME" "$__D_MODULE_MANAGER_NEW_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
				true > "$__F_LIBRARY_PATH_NEW_PARENT_PATH" || { printf "UNABLE TO OVERWRITE THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_LIBRARY_PATH_FILE_NAME" "$__D_MODULE_MANAGER_NEW_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1; }

				printf "\nCopying the %s file in the %s directory\n\n" "$__F_LIBRARY_PATH_OLD_PARENT_PATH" "$__D_MODULE_MANAGER_NEW_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
				cp -v "$__F_LIBRARY_PATH_OLD_PARENT_PATH" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" || { printf "UNABLE TO COPY THE %s FILE IN THE %s DIRECTORY" "$__F_LIBRARY_PATH_OLD_PARENT_PATH" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1; }

				NewlineF
			else
				printf "Copying the %s file in the %s directory\n\n" "$__F_LIBRARY_PATH_OLD_PARENT_PATH" "$__D_MODULE_MANAGER_NEW_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
				cp -v "$__F_LIBRARY_PATH_OLD_PARENT_PATH" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" || { printf "UNABLE TO COPY THE %s FILE IN THE %s DIRECTORY" "$__F_LIBRARY_PATH_OLD_PARENT_PATH" "$__F_LIBRARY_PATH_NEW_PARENT_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1; }

				NewlineF
			fi

			ChangeOwnership "$user" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; sleep 0.5
		else
			printf "THE INSTALLATION MODE MUST BE SPECIFIED AS FIRST ARGUMENT\n\nThe accepted values are 'install' or 'i' for the installation of the modules manager,\nor 'update' or 'u' for the update of the Bash Utils root directory's path.\n\n" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; PrintRoot; exit 1
		fi

		PrintLine 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; NewlineF

		printf "THE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR THE %s USER !\n\n" "${user##*/}" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"

    fi
done

PrintLine 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"; NewlineF

printf "THE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR EVERY LISTED USERS :\n" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
	printf "\"%s\" " "${user##*/}" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
done

printf "\n\n"

# Printing back the "/root" path into the "users.list" file if the installation was done without the super-user's privileges.
PrintRoot

if [ "$__ARG" = 'install' ] || [ "$__ARG" = 'i' ]; then
	printf "Please check the %s log file to verify if the installation was successful" "$__F_INSTALL_LOG_FILE_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
elif [ "$__ARG" = 'update' ] || [ "$__ARG" = 'u' ]; then
	printf "Please check the %s log file to verify if the update was successful" "$__F_INSTALL_LOG_FILE_PATH" 2>&1 | tee -a "$__F_INSTALL_LOG_FILE_PATH"
fi

printf "\n\n"

exit 0
