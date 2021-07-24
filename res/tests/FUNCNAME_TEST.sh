#!/usr/bin/env bash

function funcname1
{
	echo -e "$1"
}

function funcname0
{
	echo -e "${FUNCNAME[0]}"
	funcname1 "${FUNCNAME[1]}"
}

funcname0
