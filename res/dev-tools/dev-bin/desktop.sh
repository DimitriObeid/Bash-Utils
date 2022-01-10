#!/usr/bin/env bash

# This script serves to create quickly a shortcut file into the wished location.
# You will just have to fill the empty fields.

if ! source "/usr/local/lib/Bash-utils/lib/Initializer.sh"; then
    echo; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the initialization file."; echo; exit 1
fi

p_path=$1		# Path of the file to create, including its name.



if test "$#" -ne 1; then
	BU::EchoError "Usage : $(BU::DechoechoE "./Desktop.sh /path/to/the/file.desktop")"
	BU::EchoError "or"
	BU::EchoError "$(BU::DechoechoE "sudo ./Desktop.sg /path/to/the/file.desktop")"
	BU:Newline
	exit 1
fi

BU::EchoNewstep "Creating the $(BU::DechoechoN "$p_path") file"
BU:Newline

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
	BU::EchoSuccess "The $(BU::DechoechoS "$p_path") file was successfully created."
	BU:Newline; exit 0
else
	BU::EchoError "An error occured during the $(BU::DechoechoE "$p_path") file creation."
	BU:Newline; exit 1
fi
