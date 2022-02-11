#!/usr/bin/env bash

find docs/ -name "*.aux" "*.log" "*.out" "*.synctex.gz" "*.toc" -exec rm {} +
