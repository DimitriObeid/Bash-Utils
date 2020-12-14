LOGS="t.log"

function checklog
{
	if test -z "$LOGS"; then
		echo "Empty"
		LOGS="t.log"
	else
		echo "True"
	fi
}

function echoLOL
{
	string=$1; checklog && echo "$(tput setaf 82)$string$(tput sgr0)" 2>&1 | tee -a "$LOGS"
}

echoLOL "test"
