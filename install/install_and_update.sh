#!/usr/bin/env bash

## NOTE : This script takes in account my defined paths and the fact that I also develop with WSL. Please feel free to modify what you need to modify.

## TODO
##      : Ask to the user if he wants to keep the default paths.
##      : Change each user's newly installed files and folders rights, so that the users can interact easily with these.

if [ "$EUID" -ne 0 ]; then
    printf "THIS INSTALL / UPDATE SCRIPT MUST BE EXECUTED WITH SUPER-USER PRIVILEGES !\n\n"; exit 1
fi

# Feel free to add any user's home directory path into the "users.list" file.
mapfile -t __TARGET_HOME_DIRECTORIES < "users.list" || { printf "\nUNABLE TO GET THE USERS LIST FILE\n\nPlease navigate to this directory, and execute this script right there --> %s\n\n" "$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"; exit 1; }

# ------------------------------------------------

## FUNCTIONS

# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)"

    for _ in $(eval echo -e "{1..$__cols}"); do
            printf '-'
    done; printf "\n\n"
}

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

# Name of the file which stores the Bash Utils library's root directory's path.
__F_LIBRARY_PATH_FILE_NAME="Bash-utils-root-val.path"

# Path of the aforementionned file in the installation directory.
__F_LIBRARY_PATH_OLD_PARENT_PATH="$__D_MODULE_MANAGER_OLD_PATH/$__F_LIBRARY_PATH_FILE_NAME"

# Name of the modules inititialization file.
__F_MODULE_INITIALIZER_FILE_NAME="Bash-utils-init.sh"

# Path of the modules inititialization file in the installation directory.
__F_MODULE_INITIALIZER_OLD_PATH="$__D_INSTALL_DIR_PATH/$__F_MODULE_INITIALIZER_FILE_NAME"

# ------------------------------------------------

## OTHER VARIABLES
                
__SLEEP='1'

# ------------------------------------------------

## CODE

printf "Copying the Bash Utils root directory path into the %s file\n" "$__F_LIBRARY_PATH_FILE_NAME"
printf "%s" "$(cd "$(dirname "$(basename "${BASH_SOURCE[0]}")")"; cd ..; pwd -P)" 2>&1 | tee "$__F_LIBRARY_PATH_OLD_PARENT_PATH" || { printf "UNABLE TO WRITE THE BASH UTILS ROOT DIRECTORY PATH INTO THE %s FILE" "$__F_LIBRARY_PATH_FILE_NAME"; exit 1; }
printf "\n\nSuccessfully copied the Bash Utils root directory path into the %s file\n\n" "$__F_LIBRARY_PATH_FILE_NAME"

PrintLine

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do

	if [ ! -d "$user" ]; then
        ""
	else
        # ------------------------------------------------

        ## NEW DIRECTORIES VARIABLES DECLARATIONS

        # Path of the module manager directory in the user's directory.
        __D_MODULE_MANAGER_NEW_PATH="$user/$__D_MODULE_MANAGER_DIR_NAME"

        # ------------------------------------------------

        ## NEW FILES VARIABLES DECLARATIONS

        # Path of the file which stores the Bash Utils library's root directory's path, in the user's home directory.
        __F_LIBRARY_PATH_NEW_PARENT_PATH="$user/$__F_LIBRARY_PATH_FILE_NAME"

        __F_MODULE_INITIALIZER_NEW_PATH="$user/$__F_MODULE_INITIALIZER_FILE_NAME"

        # ------------------------------------------------

        ## CODE

        printf "PROCESSED USER : %s\n\n" "${user##*/}"; sleep "$__SLEEP"

        if [ -d "$__D_MODULE_MANAGER_NEW_PATH" ]; then

            printf "Erasing the existing %s modules manager directory into the %s directory\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"

			# WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            rm -rfv "${__D_MODULE_MANAGER_NEW_PATH/:?}/"* || { printf "UNABLE TO OVERWRITE THE HIDDEN %s MODULES MANAGER'S DIRECTORY !\n\n" "$__D_MODULE_MANAGER_NEW_PATH"; exit 1; }
            printf "\n"

            printf "Copying the %s modules manager directory into the %s directory\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"
			cp -rv "$__D_MODULE_MANAGER_OLD_PATH" "$user" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE $user DIRECTORY !\n\n" "$__D_MODULE_MANAGER_OLD_PATH"; exit 1; }

        else
            printf "Copying the %s modules manager directory into the %s directory\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"
            cp -rv "$__D_MODULE_MANAGER_OLD_PATH" "$user" || { printf "UNABLE TO COPY THE %s  DIRECTORY INTO THE $user DIRECTORY !\n\n" "$__D_MODULE_MANAGER_OLD_PATH"; exit 1; }
        fi

        if [ ! -f "$__F_MODULE_INITIALIZER_NEW_PATH" ]; then
            printf "Copying the %s file in the %s directory" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"
            cp -v "$__F_MODULE_INITIALIZER_OLD_PATH" "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO COPY THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"; exit 1; }
        else
            printf "Overwriting the %s file in the %s directory" "$__F_MODULE_INITIALIZER_NEW_PATH" "$user"
            true > "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO OVERWRITE THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH" "$user"; exit 1; }
            
            printf "Copying the %s file in the %s directory" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"
            cp -v "$__F_MODULE_INITIALIZER_OLD_PATH" "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO COPY THE %s FILE IN THE %s DIRECTORY\n\n" "$__F_MODULE_INITIALIZER_OLD_PATH" "$user"; exit 1; }
        fi

        printf "Changing recursively the ownership of the newly installed %s folder, from root to %s\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"
        chown -Rv "$user" "$__D_MODULE_MANAGER_NEW_PATH" || { printf "UNABLE TO RECURSIVELY CHANGE THE OWNERSHIP OF THE %s DIRECTORY TO %s\n\n" "$__D_MODULE_MANAGER_NEW_PATH" "$user"; exit 1; }

        printf "Changing the ownership of the newly %s file, from root to %s\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH" "$user"
        chown -v "$user" "$__F_MODULE_INITIALIZER_NEW_PATH" || { printf "UNABLE TO CHANGE THE OWNERSHIP OF THE %s FILE TO %s\n\n" "$__F_MODULE_INITIALIZER_NEW_PATH" "$user"; exit 1; }

		printf "\n\nTHE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR THE %s USER !\n\n" "${user##*/}"

        PrintLine; sleep "$__SLEEP"
    fi
done

printf "THE INSTALLATION / UPDATE OF THE MODULES MANAGER IS DONE FOR EVERY LISTED USERS :\n"

for user in "${__TARGET_HOME_DIRECTORIES[@]}"; do
	printf "\"%s\" " "${user##*/}"
done

printf "\n\n"

exit 0
