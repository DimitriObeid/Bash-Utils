#!/usr/bin/env bash

# This script serves to create quickly a shortcut file into the wished location.
# You will just have to fill the empty fields.

if ! source "/usr/local/lib/Bash-utils/lib/Initializer.sh"; then
    echo; echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the initialization file."; echo; exit 1
fi

p_path=$1		# Path of the file to create, including its name.



if test "$#" -ne 1; then
	EchoError "Usage : $(DechoE "./Desktop.sh /path/to/the/file.desktop")"
	EchoError "or"
	EchoError "$(DechoE "sudo ./Desktop.sg /path/to/the/file.desktop")"
	Newline
	exit 1
fi

EchoNewstep "Creating the $(DechoN "$p_path") file"
Newline

cat <<-EOF > "$p_path"
#!/usr/bin/env xdg-open

[Desktop Entry]
Name=
Comment=
Exec=
Icon=
Terminal=true
Type=Application
Categories=;
EOF

if test "$?" -eq 0; then
	EchoSuccess "The $(DechoS "$p_path") file was successfully created."
	Newline; exit 0
else
	EchoError "An error occured during the $(DechoE "$p_path") file creation."
	Newline; exit 1
fi
