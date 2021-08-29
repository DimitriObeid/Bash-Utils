#!/usr/bin/env bash

function char__()
{
	if [[ "$1" =~ [^a-zA-Z0-9\ ] ]]; then
    		echo "Not a valid input"
	else
    		echo "Its a valid input"
	fi
}

char__ '2a 3r'
