#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

# shellcheck disable=SC1090
source "$HOME/.bash_profile" || { echo >&2; echo "Unable to source the \"$HOME/.bash_profile\" file" >&2; echo >&2; exit 1; }

# shellcheck disable=SC1090
source "$__BASH_UTILS/Initializer.sh" || { echo >&2; echo "Unable to source the \"$__BASH_UTILS/Initializer.sh\" file" >&2; echo >&2; exit 1; }



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

## FUNCTIONS DEFINITION


# ----------------------------------------------

## VARIABLES DEFINITION

# Supported languages array.
__supported_languages=('en' 'fr')


# -----------------------------------------------

## STATUS VARIABLES MODIFICATION

# shellcheck disable=SC2034
__STAT_ERROR="fatal";CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## CODE

EchoNewstep "In which language do you want to write your LaTeX document ?"
EchoNewstep "Currently supported languages --> English (en), French (fr)"
Newline

read -rp "Please type the wanted language's code in the above parenthesis : " __read_lang
EchoRead "$__read_lang"

if [[ ! "$__read_lang" =~ ${__supported_languages[*]} ]]; then
	HandleErrors "1" "THE $(ToLowercase "$(DechoE '$__read_doc_name')") VARIABLE'S VALUE IS INCORRECT" "" "$__read_lang" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
else

	#***** Conditions variables definition.
	__path1="$__read_lang/Bash/"
	__path2="$__read_lang/Bash/functions/basis"
	__path3="$__read_lang/Bash/functions/main"
	__path4="$__read_lang/Bash/variable"

	#***** Asking for the new document's path.
	EchoNewstep "What kind of document do you want to write ?"
	EchoMsg "1 - Master documentation			Targeted folder --> $__path1"
	EchoMsg "2 - Basic functions documentation	Targeted folder --> $__path2"
	EchoMsg "3 - Main functions documentation	Targeted folder --> $__path3"
	EchoMsg "4 - Variables documentation		Targeted folder --> $__path4"
	Newline

	read -rp "Please type the number corresponding to the wanted document category : " __read_folder_code
	EchoRead "$__read_folder_code"
	
	#***** Verifying if the entered code is valid.
	lineno_case_read_folder_is_valid="$LINENO"; case "$__read_folder_code" in
		1)
			Makedir "$__read_lang" "$__path1" && __folder_path="$__read_lang/$__path1"
			;;
		2)
			Makedir "$__read_lang" "$__path2" && __folder_path="$__read_lang/$__path2"
			;;
		3)
			Makedir "$__read_lang" "$__path3" && __folder_path="$__read_lang/$__path3"
			;;
		4)
			Makedir "$__read_lang" "$__path4" && __folder_path="$__read_lang/$__path4"
			;;
		*)
			HandleErrors "1" "THE $(ToLowercase "$(DechoE "\$__read_doc_name")")) ENTERED VALUE IS INVALID" "Please type an integer value ranging from 1 to 4" "$__read_folder_code" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno_case_read_folder_is_valid"
			;;
	esac
	
	read -rp "How do you want to name your document ?" __read_doc_name
	EchoRead "$__read_doc_name"
	
	if [ -z "$__read_doc_name" ]; then
		HandleErrors "1" "THE $(ToLowercase "$(DechoE "\$__read_doc_name")") VARIABLE IS EMPTY" "Please type a valid name according to your filesystem accepted values" "$__read_doc_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"
	fi
	
	__full_path="$__folder_path/$__read_doc_name"

	Makefile "$__folder_path" "$__read_doc_name" && EchoSuccess "Your LaTeX file ($(DechoS "$__full_path")) was successfully created."
	
	exit 0
fi