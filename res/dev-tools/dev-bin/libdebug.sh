#!/usr/bin/env bash

debug="tmp/debug.log"

if [ -f "$debug" ]; then
	true > "$debug"
else
	touch "$debug"
fi

bash -x LibTest.sh 2>&1 | tee -a "$debug"
