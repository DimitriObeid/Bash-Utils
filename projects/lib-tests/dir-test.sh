#!/usr/bin/env bash

source "/usr/local/lib/Bash-utils/src/Initializer.sh" || { echo "Unable" && exit 1; }

ProcessingDir "$(Makedir "~/Bureau" "Test")"
