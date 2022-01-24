#!/usr/bin/env bash

cp "install/Bash-utils-init.sh" ~   || { echo "Unable to copy the initializer script in the $HOME directory"; exit 1; }
echo "Successfully copied the initializer script in the $HOME directory";
echo;

cp -r "install/.Bash-utils" ~       || { echo "Unable to copy the Bash Utils modules directory in the $HOME directory"; exit 1; }
echo "Successfully copied the Bash Utils modules directory in the $HOME directory";

