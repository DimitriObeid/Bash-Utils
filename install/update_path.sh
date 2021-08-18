#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
        printf "THIS INSTALL PATH UPDATER SCRIPT MUST BE EXECUTED WITH SUPER-USER PRIVILEGES !\n\n"; exit 1
fi

# Feel free to add any user's home directory path into the "users.list" file.
mapfile -t __TARGET_HOME_DIRECTORIES < "users.list" || { printf "\nUNABLE TO GET THE USERS LIST FILE\n\nPlease navigate to this directory, and execute this script right there --> %s\n\n" "$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"; exit 1; }

__BU_root_path_file_name="Bash-utils-root-val.path"

__BU_module_directory_name=".Bash-utils"

__BU_root_dir="$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")"; cd ..; pwd -P)"

__BU_root_path_file_old_parent="$(pwd -P)/$__BU_module_directory_name"
__BU_root_path_file_old_path="$__BU_root_path_file_old_parent/$__BU_root_path_file_name"

printf "Copying the Bash Utils root directory path into the %s file\n\n" "$__BU_root_path_file_old_path"
printf "Library path : %s\n\n" "$__BU_root_dir"

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
        if [ ! -d "$user" ]; then
                printf "ERROR --> %s IS NOT AN EXISTING USER !\n\n" "$user"; exit 1
        else

        __BU_root_path_file_new_parent="$user/$__BU_module_directory_name"
        __BU_root_path_file_new_path="$__BU_root_path_file_new_parent/$__BU_module_directory_name"

	__cols="$(tput cols)"

	for _ in $(eval echo -e "{1..$__cols}"); do
		printf '-'
	done; printf "\n\n"

	printf "PROCESSED USER'S PATH FILE : %s\n\n" "${user##*/}"

        printf "%s" "$__BU_root_dir" 2>&1 | tee "$__BU_root_path_file_new_path" || { printf "\n\nUNABLE TO WRITE THE BASH UTILS ROOT DIRECTORY PATH INTO THE %s FILE\n\n" "$__BU_root_path_file_new_path"; exit 1; }
        printf "\n\nSuccessfully copied the Bash Utils root directory path into the %s file\n\n" "$__BU_root_path_file_new_path"
	fi
done

printf "\nDONE!\n\n"
