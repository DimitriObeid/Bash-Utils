#!/usr/bin/env bash

debug_tmp_f="tmp/debug.tmp";
debug_log="tmp/final_debug_file.dbg";

if [ -f "${debug_tmp_f}" ]; then
	true > "${debug_f}";
else
	if [ ! -d "tmp" ]; then
		mkdir -p "tmp";
	fi

	touch "${debug_tmp_f}";
fi

bash -x LibTest.sh 2>&1 | tee -a "${debug_tmp_f}";

function BU.EchoDbg()
{
	echo -e "${1}" >> "${debug_log}";
}

if [ -s "${debug_tmp_f}" ]; then
	if [ ! -f "${debug_log}" ]; then
		touch "${debug_log}";
	else
		true > "${debug_log}";
	fi

	i=0

    # shellcheck disable=SC2002
	cat "${debug_tmp_f}" | while read -r line; do

        # shellcheck disable=SC2016
		if line='++++ for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}")\n++++ echo -n -'; then
			for _ in ${#line}; do
				line="$(echo -e "${line}\b")";
				BU.EchoDbg "${line}";
			done; BU.EchoDbg "\b";
		fi

		echo "${line}" >> "${debug_log}";
	done
fi
