#!/usr/bin/env bash

function Check
{
	# Supports '+' and '-' signs
	if [[ ! "$1" =~ ^[+-]?([0-9]+\.?|[0-9]*\.[0-9]+)$ ]]; then
    	echo "Test 1 : NaN"; exit 1
	else
		echo "Test 1 : Number"
	fi

	if [[ ! "$1" =~ ^([0-9]+\.?|[0-9]*\.[0-9]+)$ ]]; then
		echo "Test 2 : NaN"
	else
		echo "Test 2 : Number"
	fi
	echo
}

Check 1
Check +1
Check -1
echo

Check .1
Check +.1
Check -.1
echo

Check 1.1
Check +1.1
Check -1.1
echo
