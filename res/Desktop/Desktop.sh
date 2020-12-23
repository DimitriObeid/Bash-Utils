#!/usr/bin/env bash

# This script serves to create quickly a shortcut file into the wished location.
# You will just have to fill the empty fields.

if ! source "/usr/local/lib/Bash-utils/src/Initializer.sh"; then
    echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the initialization file."; echo; exit 1
fi

path=$1		# Path of the file to create, including its name.

if test "$#" -ne 1; then
	EchoError "Usage : $(DechoE "./Desktop.sh /path/to/the/file.desktop")"
	EchoError "or"
	EchoError "$(DechoE "sudo ./Desktop.sg /path/to/the/file.desktop")"
	Newline
	exit 1
fi

EchoNewstep "Creating the $(DechoN "$path") file"
Newline

cat <<-EOF > "$path"
[Desktop Entry]
Name=
Comment=
Exec=
Icon=
Terminal=false
Type=Application
Categories=;
EOF

if test "$?" -eq 0; then
	EchoSuccess "The $(DechoS "$path") file was successfully created."
	Newline; exit 0
else
	EchoError "An error occured during the $(DechoE "$path") file creation."
	Newline; exit 1
fi
