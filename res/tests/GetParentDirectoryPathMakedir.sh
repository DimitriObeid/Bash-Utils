#!/usr/bin/env bash

function GetParentDirectoryPathMkdir()
{
    mkdir -p "$p_path" || HandleErrors "THE $(KeepFormatting "$(DechoHighlight "$p_path/")") FOLDER CANNOT BE CREATED !" \
        "Please check the permissions of the targeted directory" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

    local v_path_str=""

    for ((i=0; i<p_iterations; i++)); do
        local v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || {
                HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
            }; pwd -P )"

        local v_path_cut="${v_parent##*/}"
        v_path_str+="$v_path_cut/"
    done

    local v_print_path="$(ReverseStringWordsOrder "$v_path_str" '/')"
}
