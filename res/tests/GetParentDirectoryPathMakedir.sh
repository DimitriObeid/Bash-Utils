#!/usr/bin/env bash

# Reverse a string.
function ReverseStringWordsOrder()
{
    #***** Parameters *****
    p_str=$1
    p_delim=$2

    #***** Code *****
    echo "$p_str" | tr "$p_delim" '\n' | tac | tr '\n' "$p_delim"

}

function GetParentDirectoryPathMkdir()
{
	local p_path=$1
	local p_iterations=$2

    mkdir -p "$p_path" || { echo "THE $p_path FOLDER CANNOT BE CREATED !"; exit 1; }

    local v_path_str=""

    for ((i=0; i<p_iterations; i++)); do
        local v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || { echo "UNABLE TO CHANGE DIRECTORY"; exit 1; };
			pwd -P )"

		p_path="${p_path##*/}"
        v_path_str+="$v_parent/"
    done

    local v_print_path="$(ReverseStringWordsOrder "$v_path_str" '/')"
	echo "$v_print_path"
}

GetParentDirectoryPathMkdir "$HOME/Projets/Bash-utils/res/tests/test_s1/test_s2/3/4/5" "3"
