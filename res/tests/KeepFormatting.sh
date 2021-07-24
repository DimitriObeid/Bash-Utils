#!/usr/bin/env bash

function KeepFormattingl
{
    #***** Parameters *****
    p_string=$1

    #***** Code *****
    echo -e "$p_string" | tr '[lower]' '[lower]'
}

function KeepFormattingU
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo -e "$p_string" | tr '[upper]' '[upper]'
}

string1="Test de la fonction $(KeepFormattingl "KeepFormattingl") en LOW"
echo -e "${string1,,}"

string2="Test de la fonction $(KeepFormattingU "KeepFormattingU") EN up"
echo -e "${string2^^}"
