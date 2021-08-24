#!/usr/bin/env bash

__BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")"

__BU_MAIN_FULL_FILE_PATH="$__BU_ROOT_PATH/Bash-utils.sh"


# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)"

	for _ in $(eval echo -e "{1..$__cols}"); do
            printf '-'
    done; printf "\n"
}


# function Newline { local iterations="$1"; for ((i=0; i<iterations; i++)); do echo -e "" | tee -a "$__BU_MAIN_FULL_FILE_PATH"; done; }
function CatBU { cat "$1" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { echo "UNABLE TO DISPLAY THE $1 FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }
function EchoBU { echo -e "# $1" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { echo "UNABLE TO WRITE THE $1 FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }

if [ ! -f "$__BU_MAIN_FULL_FILE_PATH" ]; then
	touch "$__BU_MAIN_FULL_FILE_PATH"
fi

if [ -s "$__BU_MAIN_FULL_FILE_PATH" ]; then
	true > "$__BU_MAIN_FULL_FILE_PATH"
fi


# Processing the modules initializer file.
EchoBU "$HOME/Bash-utils-init.sh"; Newline '1'; CatBU "$i"

# Processing the modules configuration files.
for i in "$HOME/.Bash-utils/config/modules/main/"*.conf; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done

# Processing the modules files.
for i in "$HOME/.Bash-utils/modules/main/"*; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done

# Processing the function files.
for i in "$__BU_ROOT_PATH/lib/functions/main/"*.lib; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done


PrintLine

printf "Library statistics :\n\n"

printf "Size in bytes			: %s\n" "$(wc -c "$__BU_MAIN_FULL_FILE_PATH")"
printf "Number of characters 	: %s\n" "$(wc -m "$__BU_MAIN_FULL_FILE_PATH")"
printf "Number of lines			: %s\n" "$(wc -l "$__BU_MAIN_FULL_FILE_PATH")"
printf "Maximum display width 	: %s\n" "$(wc -L "$__BU_MAIN_FULL_FILE_PATH")"
printf "Number of words 		: %s\n" "$(wc -w "$__BU_MAIN_FULL_FILE_PATH")"