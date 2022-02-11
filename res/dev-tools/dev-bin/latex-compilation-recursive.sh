#!/usr/bin/env bash

find . -name '*.tex' -execdir latexmk -pdf {} \;
