#!/usr/bin/env bash

__BU_MAIN_TIME_DATE="$(date +"%Y-%m-%d %Hh-%Mm-%Ss")"

__BU_MAIN_TIME_DATE_DISPLAY=$(printf "%s[ %s%s%s ]%s" "$(tput setaf 78)" "$(tput setaf 111)" "$__BU_MAIN_TIME_DATE" "$(tput setaf 78)" "$(tput sgr0)")

__BU_MAIN_TIME_DATE_DISPLAY_STR="$__BU_MAIN_TIME_DATE_DISPLAY"

echo "$__BU_MAIN_TIME_DATE_DISPLAY_STR"

# Getting the 64 first letters (including the brackets, the date stored inside and the color encoding)

__BU_MAIN_TIME_26="${__BU_MAIN_TIME_DATE_DISPLAY:0:64}"

echo "$__BU_MAIN_TIME_26"
