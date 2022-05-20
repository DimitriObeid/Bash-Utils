#!/usr/bin/env bash

# This script serves to create quickly a shortcut file into the wished location.
# You will just have to fill the empty fields.

if ! source "/usr/local/lib/Bash-utils/lib/Initializer.sh"; then
    echo; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the initialization file."; echo; exit 1
fi

p_path=$1		# Path of the file to create, including its name.



if test "$#" -ne 1; then
	BU.Main.Echo.Error "Usage : $(BU.Main.Decho.echoE "./Desktop.sh /path/to/the/file.desktop")"
	BU.Main.Echo.Error "or"
	BU.Main.Echo.Error "$(BU.Main.Decho.echoE "sudo ./Desktop.sg /path/to/the/file.desktop")"
	BU.Main.Echo.Newline;
	exit 1
fi

BU.Main.Echo.Newstep "Creating the $(BU.Main.Decho.echoN "$p_path") file"
BU.Main.Echo.Newline;

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
	BU.Main.Echo.Success "The $(BU.Main.Decho.echoS "$p_path") file was successfully created."
	BU.Main.Echo.Newline; exit 0
else
	BU.Main.Echo.Error "An error occured during the $(BU.Main.Decho.echoE "$p_path") file creation."
	BU.Main.Echo.Newline; exit 1
fi
