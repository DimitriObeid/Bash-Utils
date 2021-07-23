#!/usr/bin/env bash

function funcname1
{
	echo "$1"
}

function funcname0
{
	echo "${FUNCNAME[0]}"
	funcname1 "${FUNCNAME[1]}"
}

funcname0
