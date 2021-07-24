#!/usr/bin/env bash

source "$HOME/.bash_profile"

__BASH_UTILS_FULL_FILE_PATH="$__BASH_UTILS_ROOT/Bash-utils.sh"

function CatBU { cat "$1" | tee -a "$__BASH_UTILS_FULL_FILE_PATH"; }
function EchoBU { echo "# $1" | tee -a "$__BASH_UTILS_FULL_FILE_PATH"; }

if [ ! -f "$__BASH_UTILS_FULL_FILE_PATH" ]; then
	touch "$__BASH_UTILS_FULL_FILE_PATH"
fi

if [ -s "$__BASH_UTILS_FULL_FILE_PATH" ]; then
	true > "$__BASH_UTILS_FULL_FILE_PATH"
fi

EchoBU "$__BASH_UTILS_CONF_FILE_INIT"           && CatBU "$__BASH_UTILS_CONF_FILE_INIT"
EchoBU "$__BASH_UTILS_CONF_FILE_PROJECT_STATUS" && CatBU "$__BASH_UTILS_CONF_FILE_PROJECT_STATUS"
EchoBU "$__BASH_UTILS_CONF_FILE_COLORS"         && CatBU "$__BASH_UTILS_CONF_FILE_COLORS"
EchoBU "$__BASH_UTILS_CONF_FILE_TEXT"           && CatBU "$__BASH_UTILS_CONF_FILE_TEXT"
EchoBU "$__BASH_UTILS_CONF_FILE_TIME"           && CatBU "$__BASH_UTILS_CONF_FILE_TIME"

for i in "${__BASH_UTILS_FUNCTIONS_FILES_PATH[@]}"; do
	EchoBU && EchoBU "${i^^}" && EchoBU && CatBU "$i"
done
