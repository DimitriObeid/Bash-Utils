#!/usr/bin/env bash

source "$HOME/.bash_profile"

__BASH_UTILS_MAIN_FULL_FILE_PATH="$__BASH_UTILS_MAIN_ROOT/Bash-utils.sh"

# function Newline { local iterations="$1"; for ((i=0; i<iterations; i++)); do echo -e "" | tee -a "$__BASH_UTILS_MAIN_FULL_FILE_PATH"; done; }
function CatBU { cat "$1" | tee -a "$__BASH_UTILS_MAIN_FULL_FILE_PATH"; }
function EchoBU { echo -e "# $1" | tee -a "$__BASH_UTILS_MAIN_FULL_FILE_PATH"; }

if [ ! -f "$__BASH_UTILS_MAIN_FULL_FILE_PATH" ]; then
	touch "$__BASH_UTILS_MAIN_FULL_FILE_PATH"
fi

if [ -s "$__BASH_UTILS_MAIN_FULL_FILE_PATH" ]; then
	true > "$__BASH_UTILS_MAIN_FULL_FILE_PATH"
fi

__CONFIG_ARRAY=($"__BASH_UTILS_MAIN_CONF_FILE_INIT" "$__BASH_UTILS_MAIN_CONF_FILE_PROJECT_STATUS" \
	"$__BASH_UTILS_MAIN_CONF_FILE_COLORS" "__BASH_UTILS_MAIN_CONF_FILE_TEXT" "$__BASH_UTILS_MAIN_CONF_FILE_TIME")

# Processing the configuration files.
for i in "${__CONFIG_ARRAY[@]}"; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done

# Processing the function files.
for i in "${__BASH_UTILS_MAIN_FUNCTIONS_FILES_PATH[@]}"; do
	Newline '2'; EchoBU "${i^^}"; Newline '1'; CatBU "$i"
done
