#!/usr/bin/env bash

mkfifo fifo

cat /dev/null < fifo | fifo > source ../../lib/CheckTxtFmts/text.var

rm fifo
