#!/bin/bash

ARGV=("$@")

function foo()
{
	echo "ARGC : ${#ARGV[@]}"
	echo "Argument 1 : ${ARGV[0]}"
	echo "Argument 2 : ${ARGV[1]}"
	echo ""

	if test "${ARGV[0]}" = "hello"; then
		echo "True"
	else
		echo "False"
	fi
}

foo
