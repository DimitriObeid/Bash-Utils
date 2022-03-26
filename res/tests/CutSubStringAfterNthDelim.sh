#!/usr/bin/env bash

function CutSubStringAfterNthDelim()
{
	string=$1;
	delim=$2;

	remainder="$string";
	newstr="";

	for ((i=0; i<3; i++)); do
		first="${remainder%%$delim*}";
		remainder="${remainder#*$delim}";

		if [ -z "$newstr" ]; then
			newstr="$first"
		else
			newstr="$newstr$delim$first";
		fi
	done
}

CutSubStringAfterNthDelim "one_two_three_four_five" "_";

echo "Rem : $remainder";
echo "New : $newstr";
