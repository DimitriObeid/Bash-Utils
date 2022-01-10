#!/usr/bin/env bash

function BU::Main::Echo::KeepFormattingl
{
    #***** Parameters *****
    p_string=$1

    #***** Code *****
    echo -e "$p_string" | tr '[lower]' '[lower]'
}

function BU::Main::Echo::KeepFormattingU
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo -e "$p_string" | tr '[upper]' '[upper]'
}

string1="Test de la fonction $(BU::Main::Echo::KeepFormattingl "BU::Main::Echo::KeepFormattingl") en LOW"
echo -e "${string1,,}"

string2="Test de la fonction $(BU::Main::Echo::KeepFormattingU "BU::Main::Echo::KeepFormattingU") EN up"
echo -e "${string2^^}"
