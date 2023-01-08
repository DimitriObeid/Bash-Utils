#!/usr/bin/env bash

# Reverse a string.
function BU.Main.Text.ReverseStringWordsOrder()
{
    #**** Parameters ****
    p_str=$1
    p_delim=$2

    #**** Code ****
    echo "$p_str" | tr "$p_delim" '\n' | tac | tr '\n' "$p_delim"

}

function BU.Main.Directories.GetParentDirectoryPathMkdir()
{
	local p_path=$1
	local p_iterations=$2

    mkdir -p "${p_path}" || { echo "THE ${p_path} FOLDER CANNOT BE CREATED !"; exit 1; }

    local v_path_str=""

	local v_current_path="${p_path}"

    for ((i=0; i<p_iterations; i++)); do
        local v_parent
			v_parent="$( cd "$(dirname "$v_current_path")" > /dev/null 2>&1 \
            	|| { echo "UNABLE TO CHANGE DIRECTORY"; exit 1; };
				pwd -P; )"

		echo "PATH : $v_parent"
		v_path_cut="${v_parent##*/}"
        v_path_str+="$v_path_cut/"

		# WARNING !!!! USE THE "rmdir" COMMAND ONLY !!!!
		# DO NOT USE THE "rm -rf" COMMAND AT ALL, OR FILES AND FOLDERS COULD BE UNINTENTIONNALY ERASED !!!!
		rmdir "$v_current_path" || { echo "Unable to remove the $v_current_path folder"; exit 1; }

		v_current_path="$v_parent"
    done

    local v_print_path
		v_print_path="$(BU.Main.Text.ReverseStringWordsOrder "$v_path_str" '/')"
	echo "$v_print_path"
}

BU.Main.Directories.GetParentDirectoryPathMkdir "$HOME/Projets/Bash-utils/res/tests/test_s1/test_s2/3/4/5" "5"
