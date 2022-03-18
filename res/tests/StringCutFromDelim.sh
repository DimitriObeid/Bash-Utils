#!/usr/bin/env bash

p_string='Hello [/|\] world [/|\] from [/|\] Linux [/|\] Ubuntu';

p_delim=' [|] ';

for ((i=0; i<2; i++)); do
    #    p_string="${$p_string#*$p_delim}";
    tmp_str="$p_string";

    cut -d : -f 2 <<< "$tmp_str"

    p_string="$tmp_str";
done;

echo "$p_string";
