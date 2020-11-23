#/usr/bin/env bash

MAIN_L_FNCTS="../lib/functions"
MAIN_L_VARS="../lib/variables"
MAIN_S_INST="../src/install"
MAIN_S_LANG="src/lang"
MAIN_S_RES="src/res"

function CheckSubFolder()
{
	local path=$1;

	if test -d "$path"; then
		echo "$path : true"
	else
		echo "$path : not found"

		exit 1
	fi
}


CheckSubFolder "$MAIN_L_FNCTS"
CheckSubFolder "$MAIN_L_VARS"
CheckSubFolder "$MAIN_S_INST"
CheckSubFolder "$MAIN_S_LANG"
CheckSubFolder "$MAIN_S_RES"
