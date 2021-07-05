#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
	echo >&2; echo "Please launch this script with super-user's privileges"; echo >&2; exit 1
fi

__USERS_LIST=("/root" "/home/dimob")

for users in "$__USERS_LIST"; do

done
