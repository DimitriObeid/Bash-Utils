#!/usr/bin/env bash

__BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")"

__BASH_UTILS_MAIN_FULL_FILE_PATH="$__BU_ROOT_PATH/Bash-utils.sh"

# function Newline { local iterations="$1"; for ((i=0; i<iterations; i++)); do echo -e "" | tee -a "$__BASH_UTILS_MAIN_FULL_FILE_PATH"; done; }
function CatBU { cat "$1" | tee -a "$__BASH_UTILS_MAIN_FULL_FILE_PATH"; }
function EchoBU { echo -e "# $1" | tee -a "$__BASH_UTILS_MAIN_FULL_FILE_PATH"; }

if [ ! -f "$__BASH_UTILS_MAIN_FULL_FILE_PATH" ]; then
	touch "$__BASH_UTILS_MAIN_FULL_FILE_PATH"
fi

if [ -s "$__BASH_UTILS_MAIN_FULL_FILE_PATH" ]; then
	true > "$__BASH_UTILS_MAIN_FULL_FILE_PATH"
fi


# Processing the configuration files.
for i in "$HOME/.Bash-utils/config/modules/main/"*.conf; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done

# Processing the function files.
for i in "$__BU_ROOT_PATH/lib/functions/main/"*.lib; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done
