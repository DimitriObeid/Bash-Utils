#!/usr/bin/env bash

## NOTE : This script takes in account my defined paths and the fact that I also develop with WSL. Please feel free to modify what you need to modify.

if [ "$EUID" -ne 0 ]; then
	printf "THIS INSTALL / UPDATE SCRIPT MUST BE EXECUTED WITH SUPER-USER PRIVILEGES !\n\n"; exit 1
fi

username="$1"
username="$(tr '[:lower:]' '[:lower:]' <<< "${username:0:1}")${username:1}"
system="$2"

# Feel free to add any user's home directory path into this user list.
__TARGET_HOME_DIRECTORIES=("/root" "/home/dimob")


# ------------------------------------------------

## DIRECTORIES AND FILES NAMES

__module_init_file="Bash-utils-include.sh"

__INSTALL_DIRECTORY_SOURCE_PATH="$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"

__INSTALL_MODULE_DIRECTORY=".Bash-utils"


# ------------------------------------------------

## FULL PATHS

__INSTALL_MODULE_DIRECTORY_FULL_PATH="$__INSTALL_DIRECTORY_SOURCE_PATH/$__INSTALL_MODULE_DIRECTORY"

__INSTALL_DIRECTORY_DESTINATION_PATH="$user/$__INSTALL_MODULE_DIRECTORY"

__module_init_file_home_dir="$user/$__module_init_file"

# ------------------------------------------------

## CODE

if [ "${system,,}" = "win" ]; then
	username="$(tr '[:lower:]' '[:upper:]' <<< "${username:0:1}")${username:1}"
fi

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
	if [ ! -d "$user" ]; then
		printf "ERROR --> %s IS NOT AN EXISTING USER !\n\n" "$user"; exit 1
	else
		printf "Copying the modules initialization file into the %s directory\n" "$user"

		if [ -f "$__module_init_file_home_dir" ]; then
			cat "$__module_init_file" 2>&1 "$__module_init_file_home_dir" || { printf "UNABLE TO OVERWRITE THE %s FILE WITH THE %s FILE'S CONTENT !\n\n" "$__module_init_file_home_dir" "$__module_init_file"; exit 1; }
		else
			cp -v "$__module_init_file" "$user" || { printf "UNABLE TO COPY THE %s FILE INTO THE %s DIRECTORY !\n\n" "$__module_init_file" "$user"; exit 1; }
		fi

		printf "\nCopying the content of the %s into the %s directory\n" "$__INSTALL_MODULE_DIRECTORY_FULL_PATH" "$user"
		if [ -d "$__INSTALL_DIRECTORY_DESTINATION_PATH" ]; then
			# WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            		# WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            		# VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            		# Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            		rm -rfv "${$__INSTALL_DIRECTORY_DESTINATION_PATH/:?}/"* || { printf "UNABLE TO OVERWRITE THE HIDDEN %s MODULES MANAGER'S DIRECTORY !\n\n" "$__INSTALL_DIRECTORY_DESTINATION_PATH"; exit 1; }
			cp -rv "$__INSTALL_MODULE_DIRECTORY_FULL_PATH" "$user" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE $user DIRECTORY !\n\n" "$__INSTALL_MODULE_DIRECTORY_FULL_PATH"; exit 1; }
		else
			cp -rv "$__INSTALL_MODULE_DIRECTORY_FULL_PATH" "$user" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE $user DIRECTORY !\n\n" "$__INSTALL_MODULE_DIRECTORY_FULL_PATH"; exit 1; }
		fi

		printf "\n\nTHE INSTALLATION OF THE MODULES MANAGER IS DONE FOR THE ${user##*/} USER !\n\n\n"
	fi
done

exit 0
