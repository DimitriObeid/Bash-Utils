#!/bin/bash

FILE_LOG_NAME="LOG.log"
FILE_LOG_PATH="$FILE_LOG_NAME"
MAIN_SCRIPT_LOG=""

ROOTPATH="/home/dimob/Projets/Linux-reinstall"

source "$ROOTPATH/lib/variables/colors.var" && echo true 2>&1 | tee -a "$FILE_LOG_PATH"
source "$ROOTPATH/lib/variables/text.var"

source "$ROOTPATH/lib/functions/Echo.lib"

BU.EchoError "Erreur"
BU.Newline;

MAIN_SCRIPT_LOG="log"
BU.EchoNewstep "Nouvelle étape" "3"
BU.Newline;

MAIN_SCRIPT_LOG="tee"
BU.EchoSuccess "Succès"
BU.Newline;

MAIN_SCRIPT_LOG="random"
BU.EchoError "Random"
BU.Newline;

echo test
