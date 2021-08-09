#!/usr/bin/env bash

# Feel free to add any user's home directory path into the "users.list" file.
mapfile -t __TARGET_HOME_DIRECTORIES < "users.list"

__BU_root_path_file="Bash-utils-root-val.path"

printf "Copying the Bash Utils root directory path into the %s file\n" "$__BU_root_path_file"
printf "%s" "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")"; cd ..; pwd -P)" 2>&1 | tee "$__BU_root_path_file" || { printf "UNABLE TO WRITE THE BASH UTILS ROOT DIRECTORY PATH INTO THE %s FILE" "$__BU_r>
printf "\n\nSuccessfully copied the Bash Utils root directory path into the %s file\n\n" "$__BU_root_path_file"

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
        if [ ! -d "$user" ]; then
                printf "ERROR --> %s IS NOT AN EXISTING USER !\n\n" "$user"; exit 1
        else
		
fi
