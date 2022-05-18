#!/usr/bin/env bash

__ARG=$1

function BU.ModuleInit.CaseInsensitiveSubString()
{
    #**** Parameters ****
    local p_string=$1;

    #**** Code ****
    read -ra substring_char_array <<< "$p_string";

    for i in "${substring_char_array[@]}"; do
        shopt -s nocaseglob
    done

    return 0;
}

BU.ModuleInit.CaseInsensitiveSubString "$__ARG"
