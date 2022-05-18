#!/usr/bin/env bash

# Display a progress bar while a task is ongoing.
function BU.Main.PosixTermDisplayProgressBarOld()
{
        v_cols="$(tput cols)"

        # Process data.
        let _progress=$(( (${1}*100/${2}*100)/100 ))
        let _done=$(( (${_progress}*4)/10 ))
        let _left=40-$_done

        # Build progressive string lengths.
        _fill=$(printf "%${_done}s")
        _empty=$(printf "%${_left}s")

        # Printing the bar
        printf "\rProgress : [ ${_fill// /#}${_empty// /-}] ${_progress}%%"

	return 0;
}


# Display a progress bar while a task is ongoing.
function BU.Main.PosixTermDisplayProgressBar()
{
	v_cols="$(tput cols)"

	# Process data.
	let _progress=$(( (${1}*100/${2}*100)/100 )) 	|| return 1;
	let _done=$(( (${_progress}*4)/10 ))		|| return 1;
	let _left=40-$_done				|| return 1;

	# Build progressive string lengths.
	_fill=$(printf "%${_done}s")
	_empty=$(printf "%${_left}s")

	# Printing the bar
	printf "\rProgress : [ ${_fill// /#}${_empty// /-}] ${_progress}%%"

	return 0;
}

__start='1'

__end="$(tput cols)"

for number in $(seq "${__start}" "${__end}"); do
	sleep "0.1"
	BU.Main.PosixTermDisplayProgressBar "${number}" "${__end}"
done

printf "\nDONE\n"
