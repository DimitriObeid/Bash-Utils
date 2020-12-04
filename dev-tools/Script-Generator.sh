#!/usr/bin/env bash

# This Bash script is a code generator. It was developped in order to help you to save time by creating your script

function Separation()
{
	for _ in $(tput cols); do
		echo -ne '-'
	done
	echo
	echo
}

function ReadName()
{
    read -rp "Enter your script's name (don't put any mimetype, the script will do it) : " rep_name
    echo

	if [ -z "$rep_name" ]; then
		echo "Your script must be named, aborting operation."
		exit 1
	else
		echo "Script's name : $rep_name"
		echo
	fi
}

function ReadAccessibility()
{
	echo "You have to define the script's accessibility in order to determine if you want to share your script, if you decide to commit your changes on Git."
	echo 'The awaited values are "private" or "public" (Warning, the awaited values are case sensitive)'
	echo

	read -rp "Enter the accessibility : " rep_access
	echo

    case ${rep_access} in
    	"private" | "public")
			echo "Accessibility : $rep_access"
			echo

			return
			;;
        *)
            echo 'Awaited values : "private"  or "public" (case sensitive).'
            echo

            ReadAccessibility
            ;;
    esac
}

ReadName && Separation
ReadAccessibility && Separation

path="/usr/local/lib/Bash-Utils/src/$rep_access/$rep_name"

echo "Creating ""$rep_name""'s directory"
echo

Separation

if [ ! -d "$path" ]; then
	mkdir -pv "$path"

	echo "The '$path' directory was successfully created"
	echo
	echo

else
	echo "The '$path' directory already exists, aborting operation."

	exit 1
fi

echo "GENERATING CODE"
echo

cat <<EOF > "$path/$rep_name.sh"
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################## CALLING SCRIPT'S DEPENDENCIES ##################################

#### INITIALIZING LINUX-REINSTALL

## DEFINING PROJECT SETTINGS

# Private or public project
PROJECT_ACCESSIBILITY="public"

# Determines whether text from library functions has to be redirected into a log file, and how (into the log file only or to the file AND to the terminal)
PROJECT_LOG_STATUS=""

# -----------------------------------------------

## INCLUDING THE INITALIZER FILE

if ! source "/usr/local/lib/Bash-Utils/lib/init/initializer.sh"; then
    echo "In $(basename "$0"), line $LINENO --> Error : unable to include the initializer file"; echo; exit 1
fi
EOF
