#!/usr/bin/env bash

# Languages processing with argument
__BU_ARGS=("$@")

__BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path)";

__BU_MAIN_FULL_FILE_PATH="$__BU_ROOT_PATH/Bash-utils.tex";

# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)";

        for _ in $(eval echo -e "{1..$__cols}"); do
            printf '-';
    done; printf "\n";
}

# function BU.Newline { local iterations="$1"; for ((i=0; i<iterations; i++)); do echo -e "" | tee -a "$__BU_MAIN_FULL_FILE_PATH"; done; }
function CatBU { cat "$1" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { echo "UNABLE TO DISPLAY THE $1 FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }
function EchoBU { echo -e "# $1" | tee -a "$__BU_MAIN_FULL_FILE_PATH" || { echo "UNABLE TO WRITE THE $1 FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }


if [ ! -f "$__BU_MAIN_FULL_FILE_PATH" ]; then
        touch "$__BU_MAIN_FULL_FILE_PATH";
fi

if [ -s "$__BU_MAIN_FULL_FILE_PATH" ]; then
        true > "$__BU_MAIN_FULL_FILE_PATH";
fi

# Processing the English documentation
