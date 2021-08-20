#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    printf "THIS INSTALL PATH UPDATER SCRIPT MUST BE EXECUTED WITH SUPER-USER PRIVILEGES !\n\n"; exit 1
fi

# Feel free to add any user's home directory path into the "users.list" file.
mapfile -t __TARGET_HOME_DIRECTORIES < "users.list" || { printf "\nUNABLE TO GET THE USERS LIST FILE\n\nPlease navigate to this directory, and execute this script right there --> %s\n\n" "$(pwd -P "$(basename "${BASH_SOURCE[0]}")")"; exit 1; }

# ------------------------------------------------

## FUNCTIONS
