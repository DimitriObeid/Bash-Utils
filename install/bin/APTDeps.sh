#!/usr/bin/env bash

# This file is used to simplify the Bash-utils library dependencies installation on Linux distributions using the APT package manager.

function APTexit { echo -e "${BASH_SOURCE[0]} Unable to install this package !"; exit 1; }

apt install gcc		|| APTexit
apt install make	|| APTexit
