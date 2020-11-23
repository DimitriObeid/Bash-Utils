source lib/functions/Filesystem.sh

function Chown()
{
    #***** Paramètres *****
    username=$1
    path=$2

    #***** Code *****
    if test -d "$path"; then
        EchoNewstepTimer "$MSG_MKDIR_CHMOD." "$sleep_txt"
		echo

		chown -Rv "${ARG_USERNAME}" "$path"

        # On vérifie que les droits du dossier nouvellement créé ont bien été changés, en vérifiant le code de retour de la commande "chown".
		if test "$?" -eq "0"; then
			echo

			EchoSuccessTimer "$MSG_MKDIR_CHMOD_SUCC." "$sleep_txt"
			echo

			EchoSuccessTimer "$MSG_MKDIR_PROCESSING_END_SUCC." "$sleep_txt"
			DrawLine "$COL_RESET" "$block_char"
			sleep "$sleep_blk"
			echo

			return
		else
            echo

			EchoErrorTimer "$MSG_MKDIR_CHMOD_FAIL_1." "$sleep_txt"
			EchoErrorTimer "$MSG_MKDIR_CHMOD_FAIL_2 :" "$sleep_txt"
			echo "	chown -R ${ARG_USERNAME} $path"
			echo

			EchoErrorTimer "$MSG_MKDIR_PROCESSING_END_FAIL." "$sleep_txt"
			DrawLine "$COL_RESET" "$block_char"		# On dessine la deuxième et dernière ligne du bloc.
			sleep "$sleep_blk"
			echo

			return
        fi
    elif test -f "$path"; then
            chown -v "$username" "$path"

        # On vérifie que les droits du fichier nouvellement créé ont bien été changés, en vérifiant le code de retour de la commande "chown".
        if test "$?" -eq "0"; then
            echo

            EchoSuccessTimer "Les droits du fichier $(DechoS "$parent") ont été changés avec succès." "$sleep_txt"
            echo

            EchoSuccessTimer "$MSG_MKFILE_PROCESSING_END_SUCC." "$sleep_txt"
            DrawLine "$COL_RESET" "$block_char"
            sleep "$sleep_blk"
            echo

            return
        else
            echo

            EchoErrorTimer "Impossible de changer les droits du fichier $(DechoE "$path")." "$sleep_txt"
            EchoErrorTimer "Pour changer les droits du fichier $(DechoE "$path")," "$sleep_txt"
            EchoErrorTimer "utilisez la commande :" "$sleep_txt"
            echo "	chown username chemin"

            EchoErrorTimer "$MSG_MKFILE_PROCESSING_END_FAIL." "$sleep_txt"
            DrawLine "$COL_RESET" "$block_char"
            sleep "$sleep_blk"
            echo

            return
        fi
    else
        EchoErrorTimer "Impossible de changer le moindre droit"
        echo
    fi
}

echo "Dir"
Chown "dimob" "foo" "0"
echo && echo

echo "File"
Chown "dimob" "foo.txt" "1"
