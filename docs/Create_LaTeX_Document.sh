#!/usr/bin/env bash

source "$HOME/.bash_profile" || { echo >&2; echo "Unable to source the \"$HOME/.bash_profile\" file" >&2; echo >&2; exit 1 }
source "$__BASH_UTILS/Initializer.sh" || { echo >&2; echo "Unable to source the \"$__BASH_UTILS/Initializer.sh\" file" >&2; echo >&2; exit 1 }


__supported_languages=('en', 'fr')

EchoNewstep "Please type the wanted language's code in the following parenthesis --> English (en), French (fr)"
read -rp "In which language do you want to write your LaTeX document ?" __lang
EchoRead "$__lang"

lineno="$LINENO"; if [[ "$__lang" =~ "$__supported_languages[*]" ]]; then
	
	
	
	case
else
	HandleErrors "1" "The \$__lang variable's value is incorrect" "" "$__lang" "${BASH_SOURCE[0]}" "${FUNCNAME[0]}" "$lineno"
fi