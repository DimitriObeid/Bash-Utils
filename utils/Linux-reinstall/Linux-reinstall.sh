#!/usr/bin/env bash

# Script de réinstallation | Reinstallation script
# Version : 2.0

# To debug this script when needed, type the following command :
# sudo <shell> -x <filename>

# Example :
# sudo bash -x reinstall.sh

# Or debug it by using Shellcheck :
#	Online -> https://www.shellcheck.net/
#	On command line interface -> shellcheck beta.sh
#		--> Shellcheck install command : sudo $package_manager $install_command shellcheck

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################## CALLING INSTALL SCRIPT'S DEPENDENCIES ##############################

#### INITIALIZING LINUX-REINSTALL

## INCLUDING THE INITALIZER FILE

# shellcheck disable=SC1091
lineno=$LINENO; if ! source "/usr/local/lib/Bash-Utils/src/Initializer.sh"; then
    echo "In $(basename "$0"), line $lineno --> Error : unable to include the initializer file"; echo; exit 1
fi

# -----------------------------------------------

## DEFINING RESOURCE FILES AND FOLDERS

# Linux-reinstall sub-folders paths
LINUX_REINSTALL_INST="$(GetProjectParentPath)/install/categories"
LINUX_REINSTALL_LANG="$(GetProjectParentPath)/lang"
LINUX_REINSTALL_VARS="$(GetProjectParentPath)/variables"

# Calling the "CheckSubFolder" function from the initializer script and passing targeted directories paths as argument
WriteInitLog "In $PROJECT_FILE, line $LINENO : CHECKING FOR $PROJECT_NAME's SUB-FOLDERS"
CheckSubFolder "$LINUX_REINSTALL_INST"
CheckSubFolder "$LINUX_REINSTALL_LANG"
CheckSubFolder "$LINUX_REINSTALL_VARS"; WriteInitLog

# Sourcing the Linux-reinstall language files.
echo "In $PROJECT_FILE, line $LINENO : DEFINING $PROJECT_NAME's LIBRARY FOLDER"
SourceFile "$LINUX_REINSTALL_LANG/SetMainLang.sh" "" "$LINENO"
WriteInitLog; WriteInitLog

WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2";
WriteInitLog "END OF THE $(Decho "${PROJECT_NAME^^}")'S INITIALIZATION";
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"; WriteInitLog;


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

####################################### INITIALIZING SCRIPT #######################################

#### DEFINING SCRIPT'S ARGUMENTS

## ARGUMENT VALUES ARRAY
ARGV=("$@")

# -----------------------------------------------

## MANDATORY ARGUMENTS

# Arguments to call after the script's execution command to make it running correctly.
ARG_USERNAME=$1         # First argument : username's account.
ARG_USERNAME_INDEX='1'  # Username argument's index.

ARG_INSTALL=$2          # Second argument : the type of packages to install (SIO version (for work) or personal (work + software for personal usage)).
ARG_INSTALL_INDEX='2'   # Packages installation argument's index.

# -----------------------------------------------

# TODO : Retirer ces lignes obsolètes
## OPTIONAL ARGUMENTS

ARG_DEBUG=$3            # Debug utilitary  | Argument servant d'utilitaire de déboguage.
ARG_DEBUG_INDEX='3'     # Debug argument's index.

ARG_DEBUG_VAL="debug"   # Valeur de l'agument de déboguage.

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING SCRIPT'S FUNCTIONS

## DEFINING INITIALIZATION FUNCTIONS

# Détection du passage des arguments au script
function CheckArgs
{
	# If the script is not run as super-user (root)
	if [ "$EUID" -ne 0 ]; then
		EchoError "$MSG_LR_CHKARGS_ROOT_ZERO."
		EchoError "$MSG_LR_CHKARGS_ROOT_ZERO_EXEC :"

		# La variable "$0" ci-dessous est le nom du fichier shell en question avec le "./" placé devant (argument 0).
		# Si ce fichier est exécuté en dehors de son dossier, le chemin vers le script depuis le dossier actuel sera affiché.
		echo "$MSG_LR_CHKARGS_ARGS_SUDO"
		Newline

		EchoError "$MSG_LR_CHKARGS_ROOT_ZERO_OR_1,"
		EchoError "$MSG_LR_CHKARGS_ROOT_ZERO_OR_2 :"
		echo "    $MSG_LR_CHKARGS_ARGS"
		Newline

		EchoError "$MSG_LR_CHKARGS_ROOT_FAIL !"
		EchoError "$MSG_LR_CHKARGS_ROOT_FAIL_ADVICE."
		Newline

		exit 1
    fi

	# If no value is passed as username argument.
	if [ -z "$ARG_USERNAME" ]; then
		EchoError "$MSG_LR_CHKARGS_USERNAME_ZERO :"
		echo "$MSG_LR_CHKARGS_ARGS_SUDO"
		Newline

		EchoError "$MSG_LR_CHKARGS_USERNAME_FAIL !"
		EchoError "$MSG_LR_CHKARGS_USERNAME_FAIL_ADVICE."
		Newline

		exit 1

	# Else, if the username argument doesn't match to any existing user account.
	elif ! id -u "$ARG_USERNAME" > /dev/null; then
        Newline; EchoError "$MSG_LR_CHKARGS_USERNAME_INCORRECT !"
		EchoError "$MSG_LR_CHKARGS_USERNAME_INCORRECT_ADVICE."
		Newline

		exit 1
	fi

	# If the second mandatory argument is not passed.
	if [ -z "$ARG_INSTALL" ]; then
        Newline; EchoError "$MSG_LR_CHKARGS_INSTALL_ZERO !"
        EchoError "$MSG_LR_CHKARGS_INSTALL_ZERO_ADVICE."
        Newline

        EchoError "$MSG_LR_CHKARGS_INSTALL_AWAITED."
        Newline

        exit 1

    # Else, if the second argument is passed, the script checks if the value is equal to only one of the awaited values ("custom" or "sio"). They are not case sensitive.
   	else
        case ${ARG_INSTALL,,} in
            "custom")
                VER_INSTALL="$ARG_INSTALL"
                ;;
            "sio")
                VER_INSTALL="$ARG_INSTALL"
                ;;
            *)
                Newline; EchoError "$MSG_LR_CHKARGS_INSTALL_DIFFERENT !"
                EchoError "$MSG_LR_CHKARGS_INSTALL_AWAITED."
                Newline

                exit 1
                ;;
        esac
    fi


	# I use this function to test features on my script without waiting for it to reach their step. Its content is likely to change a lot.
	# Checking if the user passed a string named "debug" as last argument. 
	if test "$ARG_DEBUG_VAL" = "${ARG_DEBUG}"; then
		# The name of the log file is redefined, THEN we redefine the path, EVEN if the initial value of the variable "$FILE_LOG_PATH" is the same as the new value.
		# In this case, if the value of the variable "$FILE_LOG_PATH" is not redefined, the old value is called.
		FILE_LOG_NAME="Linux-reinstall $TIME_DATE.test"
		FILE_LOG_PATH="$PWD/$FILE_LOG_NAME"

		## APPEL DES FONCTIONS D'INITIALISATION
		CreateLogFile			# On appelle la fonction de création du fichier de logs. À partir de maintenant, chaque sortie peut être redirigée vers un fichier de logs existant.
		Mktmpdir				# Puis la fonction de création du dossier temporaire.
		GetMainPackageManager	# Puis la fonction de détection du gestionnaire de paquets principal de la distribution de l'utilisateur.
		WriteInstallScript		# Puis la fonction de création de scripts d'installation.

		# APPEL DES FONCTIONS À TESTER
		EchoNewstep "Test de la fonction d'installation"

		HeaderStep "TEST D'INSTALLATION DE PAQUETS"
		PackInstall "apt" "nano"
		PackInstall "apt" "emacs"

		exit 0

	# Si un deuxième argument est passé ET si la valeur attendue ("debug") ne correspond pas à la valeur du dernier argument.
	elif test ! -z "${ARG_DEBUG}" && test "$ARG_DEBUG_VAL" != "${ARG_DEBUG}" ; then
		EchoError "$MSG_INIT_DEBUG_FAIL : $(DechoE "debug")"
		EchoError "$MSG_INIT_DEBUG_ADVICE"
		Newline

		exit 1
	fi
}

# Création du fichier de logs pour répertorier chaque sortie de commande (sortie standard (STDOUT) ou sortie d'erreurs (STDERR)).
function CreateLogFile
{
	# Récupération des informations sur le système d'exploitation de l'utilisateur, me permettant de corriger tout bug pouvant survenir sur une distribution Linux précise.

	# Le script crée d'abord le fichier de logs dans le dossier actuel (pour cela, on passe la valeur de la variable d'environnement $PWD en premier argument de la fonction "Makefile").
	lineno=$LINENO; Makefile "$PWD" "$FILE_LOG_NAME" "0" "0" > /dev/null

	# On vérifie si le fichier de logs a bien été créé.
	if test -f "$FILE_LOG_PATH"; then
		EchoSuccess "$MSG_CRLOGFILE_SUCCESS"

		HeaderBase "$COL_BLUE" "$TXT_HEADER_LINE_CHAR" "$COL_BLUE" "RÉCUPÉRATION DES INFORMATIONS SUR LE SYSTÈME DE L'UTILISATEUR" "0" >> "$FILE_LOG_PATH"	# Au moment de la création du fichier de logs, la variable "$FILE_LOG_PATH" correspond au dossier actuel de l'utilisateur.

		# Récupération des informations sur le système d'exploitation de l'utilisateur contenues dans le fichier "/etc/os-release".
		EchoNewstep "$MSG_CRLOGFILE_GETOSINFOS :"
		cat "/etc/os-release" >> "$FILE_LOG_PATH"
		EchoLog

		EchoSuccess "$MSG_CRLOGFILE_GOTOSINFOS."
    else
        # Étant donné que le fichier de logs n'existe pas dans ce cas, il est impossible d'appeler la fonction "HandleErrors" sans que le moindre bug ne se produise (cependant, il ne s'agit pas de bugs importants).
        EchoError "$MSG_CRLOGFILE_FAIL"
        EchoError "$MSG_CRLOGFILE_ADVICE"
        echo

        EchoError "$MSG_LINENO $lineno."
        echo

        exit 1
    fi
}

# Création du dossier temporaire où sont stockés les fichiers et dossiers temporaires.
function Mktmpdir
{
    #***** Code *****
    # Tout ce qui se trouve entre les accolades suivantes est envoyé dans le fichier de logs.
	{
		HeaderBase "$COL_BLUE" "$TXT_HEADER_LINE_CHAR" "$COL_BLUE" \
			"CRÉATION DU DOSSIER TEMPORAIRE $COL_JAUNE\"$DIR_TMP_NAME$COL_BLUE\" DANS LE DOSSIER $COL_JAUNE\"$DIR_TMP_PARENT\"$COL_RESET" "0"

		Makedir "$DIR_TMP_PARENT" "$DIR_TMP_NAME" "0" "0"     # Dossier principal
		Makedir "$DIR_TMP_PATH" "$DIR_LOG_NAME" "0" "0"       # Dossier d'enregistrement des fichiers de logs
	} >> "$FILE_LOG_PATH"

	# Avant de déplacer le fichier de logs, on vérifie si l'utilisateur n'a pas passé la valeur "debug" en tant que dernier argument (vérification importante, étant donné que le chemin et le nom du fichier sont redéfinis dans ce cas).
    EchoNewstep "Déplacement du fichier de logs dans le dossier $(DechoN "$DIR_LOG_PATH")" >> "$FILE_LOG_PATH"

	# Dans le cas où l'utilisateur ne le passe pas, une fois le dossier temporaire créé, on y déplace le fichier de logs tout en vérifiant s'il ne s'y trouve pas déjà, puis on redéfinit le chemin du fichier de logs de la variable "$FILE_LOG_PATH". Sinon, le fichier de logs n'est déplacé nulle part ailleurs dans l'arborescence.
	if test -z "${ARGV[2]}"; then
		FILE_LOG_PATH="$DIR_LOG_PATH/$FILE_LOG_NAME"

		# On vérifie que le fichier de logs a bien été déplacé vers le dossier temporaire en vérifiant le code de retour de la commande "mv".
		local lineno=$LINENO; mv "$PWD/$FILE_LOG_NAME" "$FILE_LOG_PATH"

        # Étant donné que la fonction "Mktmpdir" est appelée après la fonction de création du fichier de logs (CreateLogFile) dans les fonctions "CheckArgs" (dans le cas où l'argument de débug est passé) et "CreateLogFile" dans la fonction "ScriptInit, il est possible d'appeler la fonction "HandleErrors" sans que le moindre bug ne se produise.
        HandleErrors "$?" "IMPOSSIBLE DE DÉPLACER LE FICHIER DE LOGS VERS LE DOSSIER $(DechoE "$DIR_LOG_PATH")" "" "$lineno"
        EchoLog

        EchoSuccess "Le fichier de logs a été déplacé avec succès dans le dossier $(DechoS "$DIR_LOG_PATH")." >> "$FILE_LOG_PATH"
    else
        # Rappel : Dans cette situation où l'argument de débug est passé, les valeurs des variables "FILE_LOG_NAME" et "$DIR_LOG_PATH" ont été redéfinies dans la fonction "CheckArgs".
        EchoSuccess "Le fichier $(DechoS "$FILE_LOG_NAME") reste dans le dossier $(DechoS "$PWD")." >> "$FILE_LOG_PATH"
	fi
}

# Détection du gestionnaire de paquets principal utilisée par la distribution de l'utilisateur.
function GetMainPackageManager
{
	HeaderBase "$COL_BLUE" "$TXT_HEADER_LINE_CHAR" "$COL_BLUE" "DÉTECTION DU GESTIONNAIRE DE PAQUETS DE VOTRE DISTRIBUTION" "0" >> "$FILE_LOG_PATH"

	# On cherche la commande du gestionnaire de paquets de la distribution de l'utilisateur dans les chemins de la variable d'environnement "$PATH" en l'exécutant.
	# On redirige chaque sortie ("STDOUT (sortie standard) si la commande est trouvée" et "STDERR (sortie d'erreurs) si la commande n'est pas trouvée")
	# de la commande vers /dev/null (vers rien) pour ne pas exécuter la commande.

	# Pour en savoir plus sur les redirections en Shell UNIX, consultez ce lien -> https://www.tldp.org/LDP/abs/html/io-redirection.html
	command -v apt-get &> /dev/null && command -v apt &> /dev/null && command -v apt-cache &> /dev/null && PACK_MAIN_PACKAGE_MANAGER="apt"
	command -v dnf &> /dev/null && PACK_MAIN_PACKAGE_MANAGER="dnf"
	command -v pacman &> /dev/null && PACK_MAIN_PACKAGE_MANAGER="pacman"

	# Si, après la recherche de la commande, la chaîne de caractères contenue dans la variable $PACK_MAIN_PACKAGE_MANAGER est toujours nulle (aucune commande trouvée).
	if test -z "$PACK_MAIN_PACKAGE_MANAGER"; then
        # Étant donné que la fonction "Mktmpdir" est appelée après la fonction de création du fichier de logs (CreateLogFile) dans les fonctions "CheckArgs" (dans le cas où le deuxième argument de débug est passé) et "CreateLogFile" dans la fonction "ScriptInit, il est possible d'appeler la fonction "HandleErrors" sans que le moindre bug ne se produise.
		HandleErrors "1" "AUCUN GESTIONNAIRE DE PAQUETS PRINCIPAL SUPPORTÉ TROUVÉ" "Les gestionnaires de paquets supportés sont : $(DechoE "APT"), $(DechoE "DNF") et $(DechoE "Pacman")." "$LINENO"
	else
		EchoSuccess "Gestionnaire de paquets principal trouvé : $(DechoS "$PACK_MAIN_PACKAGE_MANAGER")" >> "$FILE_LOG_PATH"
	fi
}

# Script's initialization.
function ScriptInit
{
	CheckArgs				# On appelle la fonction de vérification des arguments passés au script,
	CreateLogFile			# Puis la fonction de création du fichier de logs. À partir de maintenant, chaque sortie peut être redirigée vers un fichier de logs existant,
	Mktmpdir 				# Puis la fonction de création du dossier temporaire,
	GetMainPackageManager	# Puis la fonction de détection du gestionnaire de paquets principal de la distribution de l'utilisateur,
	WriteInstallScript		# Puis la fonction de création de scripts d'installation.

	# On écrit dans le fichier de logs que l'on passe à la première étape "visible dans le terminal", à savoir l'étape d'initialisation du script.
	{
		HeaderBase "$COL_BLUE" "$TXT_HEADER_LINE_CHAR" "$COL_CYAN" \
			"VÉRIFICATION DES INFORMATIONS PASSÉES EN ARGUMENT" "0"
	} >> "$FILE_LOG_PATH"

	# On demande à l'utilisateur de bien confirmer son nom d'utilisateur, au cas où son compte utilisateur cohabite avec d'autres comptes et qu'il n'a pas passé le bon compte en argument.
	EchoNewstep "Nom d'utilisateur entré :$COL_RESET ${ARG_USERNAME}"
	EchoNewstep "Est-ce correct ? (oui/non)"
	Newline

	# Cette condition case permer de tester les cas où l'utilisateur répond par "oui", "non" ou autre chose que "oui" ou "non".
	# Les deux virgules suivant directement le "rep_script_init" entre les accolades signifient que les mêmes réponses avec des
	# majuscules sont permises, peu importe où elles se situent dans la chaîne de caractères (pas de sensibilité à la casse).
	function ReadScriptInit
	{
		read -rp "Entrez votre réponse : " rep_script_init
		echo "$rep_script_init" >> "$FILE_LOG_PATH"
		Newline

		case ${rep_script_init,,} in
			"oui" | "yes")
				return
				;;
			"non" | "no")
				EchoError "Abandon"
				Newline

				exit 0
				;;
			*)
				EchoError "Réponses attendues : $(DechoE "oui") ou $(DechoE "non") (pas de sensibilité à la casse)."
				Newline

				ReadScriptInit
				;;
		esac
	}

	ReadScriptInit

	return
}

# Demande à l'utilisateur s'il souhaite vraiment lancer le script, puis connecte l'utilisateur en mode super-utilisateur.
function LaunchScript
{
    # Affichage du header de bienvenue
    HeaderStep "BIENVENUE DANS L'INSTALLATEUR DE PROGRAMMES POUR LINUX : VERSION $MAIN_SCRIPT_VERSION"
    EchoNewstep "Début de l'installation."
	Newline

	EchoNewstep "Assurez-vous d'avoir lu au moins le mode d'emploi $(DechoN "(Mode d'emploi.odt)") avant de lancer l'installation."
    EchoNewstep "Êtes-vous sûr de bien vouloir lancer l'installation ? (oui/non)."
	Newline

	# Fonction d'entrée de réponse sécurisée et optimisée demandant à l'utilisateur s'il est sûr de lancer le script.
	function ReadLaunchScript
	{
        # On demande à l'utilisateur d'entrer une réponse.
		read -rp "Entrez votre réponse : " rep_launch_script
		echo "$rep_launch_script" >> "$FILE_LOG_PATH"
		Newline

		# Cette condition case permer de tester les cas où l'utilisateur répond par "oui", "non" ou autre chose que "oui" ou "non".
		case ${rep_launch_script,,} in
	        "oui")
				EchoSuccess "Vous avez confirmé vouloir exécuter ce script."
				EchoSuccess "C'est parti !!!"

				return
	            ;;
	        "non")
				EchoError "Le script ne sera pas exécuté."
	            EchoError "Abandon"
				Newline

				exit 0
	            ;;
            # Si une réponse différente de "oui" ou de "non" est rentrée.
			*)
				Newline

				EchoNewstep "Veuillez répondre EXACTEMENT par $(DechoN "oui") ou par $(DechoN "non")."
				Newline

				# On rappelle la fonction "ReadLaunchScript" en boucle tant qu"une réponse différente de "oui" ou de "non" est entrée.
				ReadLaunchScript
				;;
	    esac
	}

	# Appel de la fonction "ReadLaunchScript", car même si la fonction est définie dans la fonction "LaunchScript", ses instructions ne sont pas lues automatiquement.
	ReadLaunchScript
}

# -----------------------------------------------

## DÉFINITION DES FONCTIONS DE CONNEXION À INTERNET ET DE MISES À JOUR
# Vérification de la connexion à Internet.
function CheckInternetConnection
{
	HeaderStep "VÉRIFICATION DE LA CONNEXION À INTERNET"

	# On vérifie si l'ordinateur est connecté à Internet (pour le savoir, on ping le serveur DNS d'OpenDNS avec la commande ping 1.1.1.1).
	local lineno=$LINENO; ping -q -c 1 -W 1 opendns.com 2>&1 | tee -a "$FILE_LOG_PATH"

    HandleErrors "$?" "AUCUNE CONNEXION À INTERNET" "Vérifiez que vous êtes bien connecté à Internet, puis relancez le script." "$lineno"
    EchoSuccess "Votre ordinateur est connecté à Internet."

    return
}

# Mise à jour des paquets actuels selon le gestionnaire de paquets principal supporté (utilisé par la distribution).
# C'EST UNE ÉTAPE IMPORTANTE SUR UNE INSTALLATION FRAÎCHE, NE MODIFIEZ PAS CE QUI SE TROUVE DANS LA CONDITION "CASE",
# SAUF EN CAS D'AJOUT D'UN NOUVEAU GESTIONNAIRE DE PAQUETS PRINCIPAL (PAS DE SNAP OU DE FLATPAK) !!!.
function DistUpgrade
{
	#***** Variables *****
	# Noms du dossier et des fichiers temporaires contenant les commandes de mise à jour selon le gestionnaire de paquets principal de l'utilisateur.
	local update_d_name="Update"		# Dossier contenant les fichiers.
	local pack_upg_f_name="pack.tmp"	# Fichier contenant la commande de mise à jour des paquets.

	# Chemins du dossier et des fichiers temporaires contenant les commandes de mise à jour selon le gestionnaire de paquets principal de l'utilisateur.
	local update_d_path="$DIR_TMP_PATH/$update_d_name"			# Chemin du dossier.
	local pack_upg_f_path="$update_d_path/$pack_upg_f_name"		# Chemin du fichier contenant la commande de mise à jour des paquets.

	# Vérification du succès des mises à jour.
	local packs_updated="0"

	#***** Code *****
	HeaderStep "MISE À JOUR DU SYSTÈME"

	# On crée le dossier contenant les commandes de mise à jour.
	if test ! -d "$update_d_path"; then
		Makedir "$DIR_TMP_PATH" "$update_d_name" "0" "0" >> "$FILE_LOG_PATH"
	fi

	# On récupère la commande de mise à jour du gestionnaire de paquets principal enregistée dans la variable "$PACK_MAIN_PACKAGE_MANAGER".
	case "$PACK_MAIN_PACKAGE_MANAGER" in
		"apt")
			echo apt-get -y upgrade > "$pack_upg_f_path"
			;;
		"dnf")
			echo dnf -y update > "$pack_upg_f_path"
			;;
		"pacman")
			echo pacman --noconfirm -Syu > "$pack_upg_f_path"
			;;
	esac

	# On met à jour les paquets
	EchoNewstep "Mise à jour des paquets"
	Newline

	bash "$pack_upg_f_path" # | tee -a "$FILE_LOG_PATH"

	if test "$?" -eq 0; then
		packs_updated="1"
		EchoSuccess "Tous les paquets ont été mis à jour."
		Newline
	else
		EchoError "Une ou plusieurs erreurs ont eu lieu lors de la mise à jour des paquets."
		Newline
	fi

	# On vérifie maintenant si les paquets ont bien été mis à jour.
	if test $packs_updated = "1"; then
		EchoSuccess "Les paquets ont été mis à jour avec succès."
	else
		EchoError "La mise à jour des paquets a échouée."
	fi

	return
}


## DÉFINITION DES FONCTIONS DE PARAMÉTRAGE
# Détection et installation de Sudo.
function SetSudo
{
	HeaderStep "DÉTECTION DE SUDO ET AJOUT DE L'UTILISATEUR À LA LISTE DES SUDOERS"

	# On crée une backup du fichier de configuration "sudoers" au cas où l'utilisateur souhaite revenir à son ancienne configuration.
	local sudoers_old="/etc/sudoers - $TIME_DATE.old"

    EchoNewstep "Détection de la commande sudo $COL_RESET."
    Newline

	# On vérifie si la commande "sudo" est installée sur le système de l'utilisateur.
	command -v sudo 2>&1 | tee -a "$FILE_LOG_PATH"

	if test "$?" -eq 0; then
        Newline

        EchoSuccess "La commande $(DechoS "sudo") est déjà installée sur votre système."
		Newline
	else
		Newline
		EchoNewstep "La commande $(DechoN "sudo") n'est pas installé sur votre système."
		Newline

		PackInstall "$PACK_MAIN_PACKAGE_MANAGER" "sudo"
	fi

	EchoNewstep "Le script va tenter de télécharger un fichier $(DechoN "sudoers") déjà configuré"
	EchoNewstep "depuis le dossier des fichiers ressources de mon dépôt Git :"
	echo ">>>> https://github.com/DimitriObeid/Linux-reinstall/tree/Beta/Ressources"
	Newline

	EchoNewstep "Souhaitez vous le télécharger PUIS l'installer maintenant dans le dossier $(DechoN "/etc/") ? (oui/non)"
	Newline

	echo ">>>> REMARQUE : Si vous disposez déjà des droits de super-utilisateur, ce n'est pas la peine de le faire !"
	echo ">>>> Si vous avez déjà un fichier sudoers modifié, une sauvegarde du fichier actuel sera effectuée dans le même dossier,"
	echo "	tout en arborant sa date de sauvegarde dans son nom (par exemple :$COL_CYAN sudoers - $TIME_DATE.old $COL_RESET)."
	Newline

	function ReadSetSudo
	{
		read -rp "Entrez votre réponse : " rep_set_sudo
		echo "$rep_set_sudo" >> "$FILE_LOG_PATH"
		Newline

		# Cette condition case permer de tester les cas où l'utilisateur répond par "oui", "non" ou autre chose que "oui" ou "non".
		case ${rep_set_sudo,,} in
			"oui" | "yes")
				# Sauvegarde du fichier "/etc/sudoers" existant en "/etc/sudoers $date_et_heure.old"
				EchoNewstep "Création d'une sauvegarde de votre fichier $(DechoN "sudoers") existant nommée $(DechoN "sudoers $TIME_DATE.old")."
				Newline

				cat "/etc/sudoers" > "$sudoers_old"

				if test "$?" -eq 0; then
					EchoSuccess "Le fichier de sauvegarde $(DechoS "$sudoers_old") a été créé avec succès."
					Newline
				else
                    EchoError "Impossible de créer une sauvegarde du fichier $(DechoE "sudoers")."
					Newline

					return
				fi

				# Téléchargement du fichier sudoers configuré.
				EchoNewstep "Téléchargement du fichier sudoers depuis le dépôt Git $SCRIPT_REPO."
				Newline

				sleep 1

				wget https://raw.githubusercontent.com/DimitriObeid/Linux-reinstall/Beta/Ressources/sudoers -O "$DIR_TMP_PATH/sudoers"

				if test "$?" -eq "0"; then
                    EchoSuccess "Le nouveau fichier $(DechoS "sudoers") a été téléchargé avec succès."
					Newline
				else
                    EchoError "Impossible de télécharger le nouveau fichier $(DechoE "sudoers")."

					return
				fi

				# Déplacement du fichier "sudoers" fraîchement téléchargé vers le dossier "/etc/".
				EchoNewstep "Déplacement du fichier $(DechoN "sudoers") vers le dossier $(DechoN "/etc")."
				Newline

				mv "$DIR_TMP_PATH/sudoers" /etc/sudoers

				if test "$?" -eq 0; then
					EchoSuccess "Fichier $(DechoS "sudoers") déplacé avec succès vers le dossier $(DechoS "/etc/")."
					Newline
				else
                    EchoError "Impossible de déplacer le fichier $(DechoE "sudoers") vers le dossier $(DechoE "/etc/")."
					Newline

					return
				fi

				# Ajout de l'utilisateur au groupe "sudo".
				EchoNewstep "Ajout de l'utilisateur $(DechoN "${ARG_USERNAME}") au groupe sudo."
				Newline

				usermod -aG root "${ARG_USERNAME}" 2>&1 | tee -a "$FILE_LOG_PATH"

				if test "$?" == "0"; then
                    EchoSuccess "L'utilisateur $(DechoS "${ARG_USERNAME}") a été ajouté au groupe sudo avec succès."
                    Newline

					return
				else
					EchoError "Impossible d'ajouter l'utilisateur $(DechoE "${ARG_USERNAME}") à la liste des sudoers."
                    Newline

					return

				fi
				;;
			"non" | "no")
				EchoSuccess "Le fichier $(DechoS "/etc/sudoers") ne sera pas modifié."

				return
				;;
			*)
				EchoNewstep "Veuillez répondre EXACTEMENT par $(DechoN "oui") ou par $(DechoN "non")."
				ReadSetSudo
				;;
		esac
	}
	ReadSetSudo

	return
}

# Installation du framework PHP Laravel.
function LaravelInstall
{
    #***** Variables *****
#    phpver=
    local envpath="$DIR_HOMEDIR/.config/composer/vendor/bin:"
    local php_ini_path="/etc/php/7.4/apache2/php.ini"

    #***** Code *****
    HeaderInstall "INSTALLATION DU FRAMEWORK LARAVEL"
    
    CommandLogs systemctl start apache2     # Démarrage du serveur Apache.
    CommandLogs systemctl enable apache2    # Démarrage du serveur Apache lors de la procédure de boot du système d'exploitation.
    
    # Ajout des services HTTP, HTTPS et SSH au firewall UFW.
    for svc in http https ssh; do
        ufw allow $svc
    done
    
    # Démarrage du firewall UFW
    uwf enable
    
    # Installation des paquets et modules PHP importants pour le bon fonctionnement de Laravel et des outils associés
    PackInstall "$main" libapache2-mod-php
    # PackInstall "$main" php                   # Le paquet étant déja installé avec Apache 2, il reste là comme rappel, au cas où vous souhaitez récupérer la fonction "LaravelInstall" pour l'implémenter dans un script personnel
    PackInstall "$main" php-bcmath
    PackInstall "$main" php-common
    # PackInstall "$main" php-json              # Le paquet étant déja installé avec Apache 2, il reste là comme rappel, au cas où vous souhaitez récupérer la fonction "LaravelInstall" pour l'implémenter dans un script personnel
    # PackInstall "$main" php-mbstring          # Le paquet étant déja installé avec Apache 2, il reste là comme rappel, au cas où vous souhaitez récupérer la fonction "LaravelInstall" pour l'implémenter dans un script personnel
    PackInstall "$main" php-opcache
    PackInstall "$main" php-tokenizer
    # PackInstall "$main" php-xml               # Le paquet étant déja installé avec Apache 2, il reste là comme rappel, au cas où vous souhaitez récupérer la fonction "LaravelInstall" pour l'implémenter dans un script personnel
    # PackInstall "$main" php-zip               # Le paquet étant déja installé avec Apache 2, il reste là comme rappel, au cas où vous souhaitez récupérer la fonction "LaravelInstall" pour l'implémenter dans un script personnel
    PackInstall "$main" unzip
    
    # Modification de la valeur de la variable "cgi.fix_pathinfo" (booléen) en la mettant à 0
    local lineno=$LINENO; sed -ie 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' "$php_ini_path"
    HandleErrors "$?" "IMPOSSIBLE DE TROUVER LE FICHIER $(DechoE "$php_ini_path")" \
        "Vérifiez que le dossier $(DechE "/etc/php/7.4") existe." ""
    
    # Redémarrage du serveur Apache après avoir modifié le fichier "php.ini"
    systemctl restart apache2
    
    # Installation de Composer pour gérer les paquets PHP
    curl -sS https://getcomposer.org/installer | php
    mv -v composer.phar /usr/local/bin/composer
    HandleFatalErrors "$?" "" "" ""
    composer --version
    HandleFatalErrors "$?" "" "" ""
    
    # Installation de Laravel
    composer global require laravel/installer
    
    # Ajout du dossier ~/.config/composer/vendor/bin dans la variable d'environnement "$PATH"
    local lineno=$LINENO; cat <<-EOF >> "$DIR_HOMEDIR/.bashrc"
    export PATH="$envpath$PATH"
EOF

    # Mise à jour du fichier de configuration "~/.bashrc" et vérification de l'application de la modification de la variable d'environnement
    # shellcheck disable=SC1091
    source "$DIR_HOMEDIR/.bashrc"
    echo "$PATH" | grep "$envpath"
    
    HandleErrors "$?" "LA VARIABLE D'ENVIRONNEMENT $(DechoE "\$PATH") N'A PAS ÉTÉ MODIFÉE" \
        "Échec de l'installation de Laravel." "$lineno"
    EchoSuccess "La variable d'environnement $(DechoS "\$PATH") a été modifiée avec succès."
    Newline
    
    EchoSuccess "Le framework Laravel a été installé avec succès sur votre système"
}


# Fonction regroupant les fonctions d'installation et de configuration (telles que "LaravelInstall", etc...) pour éviter de retaper leur nom à différents endroits si elles deviennent nombreuses
function InstallAndConfig
{
    HeaderStep "INSTALLATIONS ET CONFIGURATIONS"
    
    EchoNewstep "Installation des programmes et configurations"
    Newline
 
    # Installation de sudo (pour les distributions livrées sans la commande) et configuration du fichier "sudoers" ("/etc/sudoers").
    SetSudo
 
    case ${VER_PACKS,,} in
    "sio")
        # shellcheck source=../src/install/sio.sh
        local lineno=$LINENO; source src/install/sio.sh \
            || HandleErrors "1" "LE FICHIER $(DechoE "install/sio.sh") N'EXISTE PAS" "Vérifiez s'il existe" "$lineno"
        SIOInstall
        ;;
    "custom")
        # shellcheck source=../src/install/custom.sh
        local lineno=$LINENO; source src/install/custom.sh \
            || HandleErrors "1" "LE FICHIER $(DechoE "install/custom.sh") N'EXISTE PAS" "Vérifiez s'il existe" "$lineno"
        SIOInstall
        CustomInstall
        ;;
    esac

    LaravelInstall
}


# DÉFINITION DES FONCTIONS DE FIN D'INSTALLATION
# Suppression des paquets obsolètes.
function Autoremove
{
	HeaderStep "AUTO-SUPPRESSION DES PAQUETS OBSOLÈTES"

	EchoNewstep "Souhaitez vous supprimer les paquets obsolètes ? (oui/non)"
	Newline

	# Fonction d'entrée de réponse sécurisée et optimisée demandant à l'utilisateur s'il souhaite supprimer les paquets obsolètes.
	function ReadAutoremove
	{
		read -rp "Entrez votre réponse : " rep_autoremove
		echo "$rep_autoremove" >> "$FILE_LOG_PATH"
		Newline

		case ${rep_autoremove,,} in
			"oui" | "yes")
				EchoNewstep "Suppression des paquets."
				Newline

	    		case "$PACK_MAIN_PACKAGE_MANAGER" in
					"apt")
	            		apt-get -y autoremove
	            		;;
					"dnf")
		           		dnf -y autoremove
		           		;;
	        		"pacman")
	            		pacman --noconfirm -Qdt
	            		;;
				esac

				Newline

				EchoSuccess "Auto-suppression des paquets obsolètes effectuée avec succès."

				return
				;;
			"non" | "no")
				EchoSuccess "Les paquets obsolètes ne seront pas supprimés."
				EchoSuccess "Si vous voulez supprimer les paquets obsolète plus tard, tapez la commande de suppression de paquets obsolètes adaptée à votre getionnaire de paquets."

				return
				;;
			*)
				EchoNewstep "Veuillez répondre EXACTEMENT par $(DechoN "oui") ou par $(DechoN "non")."
				ReadAutoremove
				;;
		esac
	}
	ReadAutoremove

	return
}

# Fin de l'installation.
function IsInstallationDone
{
	HeaderStep "INSTALLATION TERMINÉE"

	EchoNewstep "Souhaitez-vous supprimer le dossier temporaire $(DechoN "$DIR_TMP_PATH") ? (oui/non)"
	Newline

	read -rp "Entrez votre réponse : " rep_erase_tmp
	echo "$rep_erase_tmp" >> "$FILE_LOG_PATH"
    Newline

	case ${rep_erase_tmp,,} in
		"oui")
			EchoNewstep "Déplacement du fichier de logs dans votre dossier personnel."
			Newline

			mv -v "$FILE_LOG_PATH" "$DIR_HOMEDIR" 2>&1 | tee -a "$DIR_HOMEDIR/$FILE_LOG_NAME" && FILE_LOG_PATH=$"$DIR_HOMEDIR" \
				&& EchoSuccess "Le fichier de logs a bien été deplacé dans votre dossier personnel."

			EchoNewstep "Suppression du dossier temporaire $DIR_TMP_PATH."
			Newline

			if test rm -rfv "$DIR_TMP_PATH" >> "$FILE_LOG_PATH"; then
				EchoSuccess "Le dossier temporaire $(DechoS "$DIR_TMP_PATH") a été supprimé avec succès."
				Newline
			else
				EchoError "Suppression du dossier temporaire impossible. Essayez de le supprimer manuellement."
                Newline
			fi
			;;
		*)
			EchoSuccess "Le dossier temporaire $(DechoS "$DIR_TMP_PATH") ne sera pas supprimé."
            Newline
			;;
	esac

    EchoSuccess "Installation terminée. Votre distribution Linux est prête à l'emploi."
	Newline

	echo "$(Decho "Note :") Si vous avez constaté un bug ou tout autre problème lors de l'exécution du script,"
	echo "vous pouvez m'envoyer le fichier de logs situé dans votre dossier personnel."
	echo "Il porte le nom de $(Decho "$FILE_LOG_NAME")."
	Newline

    # On tue le processus de connexion en mode super-utilisateur.
	sudo -k

	exit 0
}



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #



################### DÉBUT DE L'EXÉCUTION DU SCRIPT ###################



## APPEL DES FONCTIONS D'INITIALISATION ET DE PRÉ-INSTALLATION
# Détection du mode super-administrateur (root) et de la présence de l'argument contenant le nom d'utilisateur.
ScriptInit              # Initialisation du script.
LaunchScript			# Assurance que l'utilisateur soit sûr de lancer le script.
CheckInternetConnection	# Détection de la connexion à Internet.
DistUpgrade				# Mise à jour des paquets actuels.


## INSTALLATIONS PRIORITAIRES ET CONFIGURATIONS DE PRÉ-INSTALLATION
# On déclare une variable "main" et on lui assigne en valeur le nom du gestionnaire de paquet principal stocké dans la variable. "$PACK_MAIN_PACKAGE_MANAGER" pour éviter de retaper le nom de cette variable.
main="$PACK_MAIN_PACKAGE_MANAGER"

HeaderStep "INSTALLATION DES COMMANDES IMPORTANTES POUR LES TÉLÉCHARGEMENTS"
PackInstall "$main" curl
PackInstall "$main" snapd
PackInstall "$main" wget

EchoNewstep "Vérification de l'installation des commandes $(DechoN "curl"), $(DechoN "snapd") et $(DechoN "wget")."
Newline

lineno=$LINENO; command -v curl snap wget | tee -a "$FILE_LOG_PATH"
HandleErrors "$?" "AU MOINS UNE DES COMMANDES D'INSTALLATION MANQUE À L'APPEL" "Essayez de  télécharger manuellement ces paquets : $(DechoE "curl"), $(DechoE "snapd") et $(DechoE "wget")." "$lineno"
EchoSuccess "Les commandes importantes d'installation ont été installées avec succès."
Newline

# DÉBUT DE LA PARTIE D'INSTALLATION
DrawLine ";" "$COL_GREEN"
Newline

EchoSuccess "Vous pouvez désormais quitter votre ordinateur pour chercher un café,"
EchoSuccess "La partie d'installation de vos programmes commence véritablement."
sleep 1

Newline
Newline

sleep 3


## INSTALLATION DES LOGICIELS ABSENTS DES GESTIONNAIRES DE PAQUETS
HeaderStep "INSTALLATION DES LOGICIELS INDISPONIBLES DANS LES BASES DE DONNÉES DES GESTIONNAIRES DE PAQUETS"

EchoNewstep "Les logiciels téléchargés via la commande $(DechoN "wget") sont déplacés vers le nouveau dossier $(DechoN "$DIR_SOFTWARE_NAME"), localisé dans votre dossier personnel"
Newline

sleep 1

# Création du dossier contenant les fichiers de logiciels téléchargés via la commande "wget" dans le dossier personnel de l'utilisateur.
EchoNewstep "Création du dossier d'installation des logiciels."
Newline

Makedir "$DIR_HOMEDIR" "$DIR_SOFTWARE_NAME" "2" "1" 2>&1 | tee -a "$FILE_LOG_PATH"
Newline

# Installation de JMerise
SoftwareInstall "http://www.jfreesoft.com" \
				"JMeriseEtudiant.zip" \
				"JMerise" \
				"JMerise est un logiciel dédié à la modélisation des modèles conceptuels de donnée pour Merise" \
				"JMerise.jar" \
				"" \
				"Application" \
				"Développement"


## FIN D'INSTALLATION
# Suppression des paquets obsolètes.
Autoremove

# Fin de l'installation.
IsInstallationDone
