#!/usr/bin/env bash

## NOTE : This script takes in account my defined paths and the fact that I also develop with WSL. Please feel free to modify what you need to modify.

if [ "$EUID" -eq 0 ]; then
	printf "THIS COPY SCRIPT MUST BE EXECUTED WITH SUPER-USER PRIVILEGES !\n\n"; exit 1
fi

username="$1"
username="$(tr '[:lower:]' '[:lower:]' <<< "${username:0:1}")${username:1}"
system="$2"

__module_init_file="Bash-utils-include.sh"

__INSTALL_DIRECTORY_PATH="$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"

__INSTALL_MODULE_DIRECTORY=".Bash-utils"
__INSTALL_MODULE_DIRECTORY_FULL_PATH="$__INSTALL_DIRECTORY_PATH/$__INSTALL_MODULE_DIRECTORY"

# Feel free to add any user's home directory path into this user list.
__TARGET_HOME_DIRECTORIES=("/root" "/home/dimob")

if [ "${system,,}" = "win" ]; then
	username="$(tr '[:lower:]' '[:upper:]' <<< "${username:0:1}")${username:1}"
fi

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
	if [ ! -d "$user" ]; then
		printf "ERROR --> %s IS NOT AN EXISTING USER !\n\n" "$user"; exit 1
	else
		printf "Copying the modules initialization file into the $user directory\n"

		if [ -f "$user/$__module_init_file" ]; then
			cat "$__INSTALL_DIRECTORY_PATH" 2>&1 "$user/$__module_init_file" || { printf "UNABLE TO OVERWRITE THE $user/$__module_init_file FILE INTO THE $user DIRECTORY !\n\n"; exit 1; }
		else
			cp -v "$__module_init_file" "$user" || { printf "UNABLE TO COPY THE $__module_init_file FILE INTO THE $user DIRECTORY !\n\n"; exit 1; }
		fi

		printf "\nCopying the content of the $__INSTALL_MODULE_DIRECTORY_FULL_PATH into the $user directory\n"
		if [ -d "$user/__INSTALL_MODULE_DIRECTORY" ]; then
			# WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            		# WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            		# VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            		# Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            		rm -rfv "${$user/$__INSTALL_MODULE_DIRECTORY/:?}/"* || { printf "UNABLE TO OVERWRITE THE HIDDEN"; exit 1; }
		else
			cp -rv "$__INSTALL_MODULE_DIRECTORY_FULL_PATH" "$user" || { printf "UNABLE TO COPY THE $__INSTALL_MODULE_DIRECTORY_FULL_PATH DIRECTORY INTO THE $user DIRECTORY !\n\n"; exit 1; }
		fi

		printf "\n\nTHE INSTALLATION OF THE MODULES MANAGER IS DONE !\n\n"
	fi
done

exit 0
