#!/usr/bin/env bash

# Source of this AWK script : https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BU::Main::BasicMaths::BytesToHuman()
{
    # Converts a byte count to a human readable format in IEC binary notation (base-1024), rounded to two decimal places for anything larger than a byte. switchable to padded format and base-1000 if desired.
    local L_BYTES="${1:-0}"
    local L_PAD="${2:-no}"
    local L_BASE="${3:-1024}"

    BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" 'function human(x, pad, base) {
         if(base!=1024)base=1000
         basesuf=(base==1024)?"iB":"B"

         s="BKMGTEPYZ"
         while (x>=base && length(s)>1)
               {x/=base; s=substr(s,2)}
         s=substr(s,1,1)

         xf=(pad=="yes") ? ((s=="B")?"%5d   ":"%8.2f") : ((s=="B")?"%d":"%.2f")
         s=(s!="B") ? (s basesuf) : ((pad=="no") ? s : ((basesuf=="iB")?(s "  "):(s " ")))

         return sprintf( (xf " %s\n"), x, s)
      }
      BEGIN{print human(bytes, pad, base)}')
    return $?
}

BU::Main::BasicMaths::BytesToHuman "$1" "$2" "$3"

echo "$BYTESTOHUMAN_RESULT"
