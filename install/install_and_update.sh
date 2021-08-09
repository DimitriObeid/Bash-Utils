#!/usr/bin/env bash

## NOTE : This script takes in account my defined paths and the fact that I also develop with WSL. Please feel free to modify what you need to modify.

## TODO 
##	: Ask to the user if he wants to keep the defualt paths.

if [ "$EUID" -ne 0 ]; then
	printf "THIS INSTALL / UPDATE SCRIPT MUST BE EXECUTED WITH SUPER-USER PRIVILEGES !\n\n"; exit 1
fi

# Feel free to add any user's home directory path into the "users.list" file.
mapfile -t __TARGET_HOME_DIRECTORIES < "users.list"

# ------------------------------------------------

## DIRECTORIES AND FILES NAMES

__BU_root_path_file="Bash-utils-root-val.path"

__module_init_file="Bash-utils-include.sh"

__INSTALL_DIRECTORY_SOURCE="$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"

__INSTALL_MODULE_DIRECTORY=".Bash-utils"


# ------------------------------------------------

## FULL PATHS

__INSTALL_MODULE_DIRECTORY_FULL_PATH="$__INSTALL_DIRECTORY_SOURCE/$__INSTALL_MODULE_DIRECTORY"

__INSTALL_DIRECTORY_DESTINATION_PATH="$user/$__INSTALL_MODULE_DIRECTORY"

__module_init_file_home_dir="$user/$__module_init_file"

# ------------------------------------------------

## CODE

printf "Copying the Bash Utils root directory path into the %s file\n" "$__BU_root_path_file"
printf "%s" "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")"; cd ..; pwd -P)" 2>&1 | tee "$__BU_root_path_file" || { printf "UNABLE TO WRITE THE BASH UTILS ROOT DIRECTORY PATH INTO THE %s FILE" "$__BU_root_path_file"; exit 1; }
printf "\n\nSuccessfully copied the Bash Utils root directory path into the %s file\n\n" "$__BU_root_path_file"

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

		printf "\n\nTHE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR THE ${user##*/} USER !\n\n\n"
	fi
done

printf "THE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR EVERY LISTED USERS !\n"

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
	printf "\"%s\" " "${user##*/}"
done

printf "\n\n"
exit 0
