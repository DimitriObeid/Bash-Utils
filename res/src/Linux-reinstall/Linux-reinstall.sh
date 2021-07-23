#!/usr/bin/env bash

# School and home software and packages installation script
# Version : 1.0

# To debug this script when needed, type the following command :
# sudo bash -x reinstall.sh

# Check each syntax error by using Shellcheck :
#	Online -> https://www.shellcheck.net/
#	On CLI -> shellcheck Linux-reinstall.sh
#		--> Shellcheck install command : sudo $package_manager $install_command shellcheck

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

#### INITIALIZING LINUX-REINSTALL

## SOURCING THE INITALIZER FILE

# shellcheck disable=SC1090
# shellcheck disable=SC1091
if ! source "$HOME/.bash_profile"; then
    echo >&2; echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the ~/.bash_profile file." >&2; echo >&2; exit 1
fi

# shellcheck disable=SC1091
if ! source "$__BASH_UTILS_LIB_FILE_INITIALIZER"; then
    echo >&2; echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the initialization file." >&2; echo >&2; exit 1
fi

# -----------------------------------------------

## DEFINING RESOURCE FILES AND FOLDERS

# Linux-reinstall's sub-folders paths
__LINUX_REINSTALL_INST="$(GetParentDirectoryPath "$__BU_PROJECT_FILE")/install/categories"
__LINUX_REINSTALL_LANG="$(GetParentDirectoryPath "$__BU_PROJECT_FILE")/lang"
__LINUX_REINSTALL_VARS="$(GetParentDirectoryPath "$__BU_PROJECT_FILE")/variables"

# Calling the "GetDirectory" function from the "Directories.lib" file and passing targeted directories paths as argument.
EchoNewstep "IN $(DechoN "$__BU_PROJECT_FILE"), LINE $(DechoN "$LINENO") : CHECKING FOR ${__BU_PROJECT_NAME^^}'S SUB-FOLDERS"
GetDirectoryPath "$__LINUX_REINSTALL_INST" > /dev/null && EchoSuccess "Got this $PROJECT_NAME's directory : $(DechoS "$__LINUX_REINSTALL_INST")"
GetDirectoryPath "$__LINUX_REINSTALL_LANG" > /dev/null && EchoSuccess "Got this $PROJECT_NAME's directory : $(DechoS "$__LINUX_REINSTALL_INST")"
GetDirectoryPath "$__LINUX_REINSTALL_VARS" > /dev/null && EchoSuccess "Got this $PROJECT_NAME's directory : $(DechoS "$__LINUX_REINSTALL_INST")"; Newline
EchoNewstep "All the needed directories are found !"

# Sourcing the Linux-reinstall language files.
# EchoInit "In $PROJECT_FILE, line $LINENO : DEFINING ${PROJECT_NAME^^}'S LIBRARY FOLDER"
# SourceFile "$LINUX_REINSTALL_LANG/SetMainLang.sh" "" "$LINENO"
# Newline #; Newline

# Ending the initialization process.
HeaderGreen "END OF THE $(DechoGreen "${__BU_PROJECT_NAME^^}")'S INITIALIZATION"

# -----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

#### DEFINING SCRIPT'S ARGUMENTS

## ARGUMENT VALUES ARRAY
# shellcheck disable=SC2034
__ARGV=("$@")

# -----------------------------------------------

## MANDATORY ARGUMENTS

# Arguments to call after the script's execution command to make it running correctly.
__ARG_INSTALL=$1          # First argument : the type of packages to install (SIO version (for work) or personal (work + software for personal usage)).
__ARG_INSTALL_INDEX='1'   # Packages installation argument's index.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DEFINING SCRIPT'S FUNCTIONS

## DEFINING INITIALIZATION FUNCTIONS

# Détection du passage des arguments au script.
function CheckArgs
{
    #***** Status *****
    # shellcheck disable=SC2034
    __STAT_ERROR="fatal";       CheckSTAT_ERROR         "$(basename "$0")" "$LINENO"

    # shellcheck disable=SC2034
    __STAT_LOG="true";          CheckSTAT_LOG           "$(basename "$0")" "$LINENO"

    # shellcheck disable=SC2034
    __STAT_LOG_REDIRECT="tee";  CheckSTAT_LOG_REDIRECT  "$(basename "$0")" "$LINENO"

    # shellcheck disable=SC2034
    __STAT_TIME_TXT=".1";       CheckSTAT_TIME_TXT      "$(basename "$0")" "$LINENO"
    
    #***** Code *****
	# If the script is not run as super-user (root)
        local lineno=$LINENO; if [ "$EUID" -ne 0 ]; then
            EchoError "Ce script doit être exécuté en tant que super-utilisateur (root)."
            EchoError "Exécutez ce script en plaçant la commande $(DechoE "sudo") devant votre commande :"

            # La variable "$0" ci-dessous est le nom du fichier shell en question avec le "./" placé devant (argument 0).
            # Si ce fichier est exécuté en dehors de son dossier, le chemin vers le script depuis le dossier actuel sera affiché.
            echo "    sudo $0 \$installation" >&2
            Newline >&2

            EchoError "Ou connectez vous directement en tant que super-utilisateur, puis tapez cette commande."
            echo "    $0 \$installation" >&2

            HandleErrors "1" "SCRIPT LANCÉ EN TANT QU'UTILISATEUR NORMAL !" \
                "Relancez le script avec les droits de super-utilisateur (avec la commande $(DechoE "sudo")) ou en vous connectant en super-utilisateur." \
                "EUID != 0" "$(basename "$0")" "${FUNCNAME[0]}" "$lineno"
    fi

    # If the mandatory username argument is not passed.
    local lineno=$LINENO; if [ -z "$__ARG_USERNAME" ]; then
        EchoError "Veuillez exécuter ce script en précisant le type d'installation :"
        echo "    sudo $0 \$username" >&2
        Newline >&2
        
        exit 1
    fi
    
	# If the mandatory installation type argument is not passed.
	local lineno=$LINENO; if [ -z "$__ARG_INSTALL" ]; then
        EchoError "Veuillez exécuter ce script en précisant le type d'installation :"
        echo "    sudo $0 \$username" >&2
        Newline >&2
        
        HandleErrors "1" "VOUS N'AVEZ PAS PASSÉ LE TYPE D'INSTALLATION EN PREMIER ARGUMENT !" \
            "Les valeurs attendues sont : $(DechoE "perso") ou $(DechoE "sio")." \
            "$__ARG_INSTALL" "$(basename "$0")" "${FUNCNAME[0]}" "$lineno"

        exit 1

    # Else, if the second argument is passed, the script checks if the value is equal to only one of the awaited values ("custom" or "sio"). They are not case sensitive.
   	else local lineno=$LINENO
        case ${__ARG_INSTALL,,} in
            "custom")
                __VER_INSTALL="$__ARG_INSTALL"
                ;;
            "sio")
                # shellcheck disable=SC2034
                __VER_INSTALL="$__ARG_INSTALL"
                ;;
            *)
                Newline; HandleErrors "1" \
                    "LA VALEUR DE L'ARGUMENT $(DechoE "$__ARG_INSTALL_INDEX") NE CORRESPOND PAS À L'UNE DES VALEURS ATTENDUES !" \
                    "Les valeurs attendues sont : $(DechoE "perso") ou $(DechoE "sio")." \
                    "$__ARG_INSTALL" "$(basename "$0")" "${FUNCNAME[0]}" "$lineno"

                exit 1
                ;;
        esac
    fi


	# I use this function to test features on my script without waiting for it to reach their step. Its content is likely to change a lot.
	# Checking if the user passed a string named "debug" as last argument. 
	if [ "$__STAT_DEBUG" = "true" ]; then
		EchoMsg "PROJECT_STATUS_DEBUG status : $(Decho "true")"
		Newline

		# The name of the log file is redefined, THEN we redefine the path,
		# EVEN if the initial value of the variable "$PROJECT_LOG_PATH" is the same as the new value.
		# In this case, if the value of the variable "$PROJECT_LOG_PATH" is not redefined, its former value is called,
		# because the "$PROJECT_LOG_NAME" stored in the former "$$PROJECT_LOG_PATH" is the former one (its value was not updated).
		__BU_PROJECT_LOG_FILE_NAME_OLD="$__BU_PROJECT_LOG_FILE_NAME"
		echo "$__BU_PROJECT_LOG_FILE_NAME_OLD"
		__BU_PROJECT_LOG_FILE_NAME="$__BU_PROJECT_NAME - DEBUG.log"
    		echo "$__BU_PROJECT_LOG_FILE_NAME"

		__BU_PROJECT_LOG_FILE_PATH="$__BU_PROJECT_LOG_DIR_PATH/$__BU_PROJECT_LOG_FILE_NAME"
		
		# Changing the name of the log file.
        if [ "$(EchoMsg "$(mv -v "$__BU_PROJECT_LOG_FILE_NAME_OLD" "$__BU_PROJECT_LOG_FILE_NAME")")" ]; then
            ## APPEL DES FONCTIONS D'INITIALISATION
            CreateLogFile			# On appelle la fonction de création du fichier de logs. À partir de maintenant, chaque sortie peut être redirigée vers un fichier de logs existant.
            GetMainPackageManager	# Puis la fonction de détection du gestionnaire de paquets principal de la distribution de l'utilisateur.
            WriteInstallScript		# Puis la fonction de création de scripts d'installation.

            # APPEL DES FONCTIONS À TESTER
            EchoNewstep "Test de la fonction d'installation"

            HeaderStep "TEST D'INSTALLATION DE PAQUETS"
            PackInstall "apt" "nano"
            PackInstall "apt" "emacs"

            exit 0
        else
            HandleErrors "1" "UNABLE TO RENAME THE LOG FILE" \
                "Check what happened by running the script with the $(DechoE "bash -x $0") command" \
                "$__BU_PROJECT_LOG_FILE_NAME_OLD // OR // $__BU_PROJECT_LOG_FILE_NAME" "$(basename "$0")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
        fi
	fi
}

# CreateLogFile --> Old

# Script's initialization.
function ScriptInit
{
    CheckArgs				# On appelle la fonction de vérification des arguments passés au script,
	GetMainPackageManager	# Puis la fonction de détection du gestionnaire de paquets principal de la distribution de l'utilisateur,

	# On écrit dans le fichier de logs que l'on passe à la première étape "visible dans le terminal", à savoir l'étape d'initialisation du script.
    HeaderBase "$COL_BLUE" "-" "$COL_BLUE" "VÉRIFICATION DES INFORMATIONS PASSÉES EN ARGUMENT"

	# On demande à l'utilisateur de bien confirmer son nom d'utilisateur, au cas où son compte utilisateur cohabite avec d'autres comptes et qu'il n'a pas passé le bon compte en argument.
	Newline

	KbInputYesNo "Nom d'utilisateur entré :$COL_RESET ${ARG_USERNAME}.$(Newline)Est-ce correct ? (oui/non)" \
        "$(return)" "Abandon $(exit 0)"
}

# Demande à l'utilisateur s'il souhaite vraiment lancer le script, puis connecte l'utilisateur en mode super-utilisateur.
function LaunchScript
{
    # Affichage du header de bienvenue
    HeaderCyan "BIENVENUE DANS L'INSTALLATEUR DE PROGRAMMES POUR ${OSTYPE^^} : VERSION $MAIN_SCRIPT_VERSION"
    EchoNewstep "Début de l'installation."
	Newline

	KbInputYesNo "Assurez-vous d'avoir lu au moins le mode d'emploi $(DechoN "(Mode d'emploi.odt)") avant de lancer l'installation.$(Newline)Êtes-vous sûr de bien vouloir lancer l'installation ? (oui/non)." \
        "Vous avez confirmé vouloir exécuter ce script.$(Newline)Début de l'exécution. $(return)" \
        "Le script ne sera pas exécuté.$(Newline)Abandon.$(exit 0)"
}

# -----------------------------------------------

## DÉFINITION DES FONCTIONS DE CONNEXION À INTERNET ET DE MISES À JOUR
# Vérification de la connexion à Internet.
function CheckInternetConnection
{
	HeaderCyan "VÉRIFICATION DE LA CONNEXION À INTERNET"

	# On vérifie si l'ordinateur est connecté à Internet (pour le savoir, on ping le serveur DNS d'OpenDNS avec la commande ping 1.1.1.1).
	local lineno=$LINENO; ping -q -c 1 -W 1 opendns.com 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH"

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
		Makedir "$DIR_TMP_PATH" "$update_d_name" "0" "0" >> "$__BU_PROJECT_LOG_FILE_PATH"
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

	bash "$pack_upg_f_path" # | tee -a "$PROJECT_LOG_PATH"

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
	local sudoers_old="/etc/sudoers - $__TIME_DATE.old"

    EchoNewstep "Détection de la commande sudo $__COL_RESET."
    Newline

	# On vérifie si la commande "sudo" est installée sur le système de l'utilisateur.
	command -v sudo 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH"

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
		echo "$rep_set_sudo" >> "$__BU_PROJECT_LOG_FILE_PATH"
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

				usermod -aG root "${ARG_USERNAME}" 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH"

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
    HandleErrors "$?" "" "" ""
    composer --version
    HandleErrors "$?" "" "" ""

    # Installation de Laravel
    composer global require laravel/installer
    
    # Ajout du dossier ~/.config/composer/vendor/bin dans la variable d'environnement "$PATH"
    local lineno=$LINENO; cat <<-EOF >> "$DIR_HOMEDIR/.bashrc"
    export PATH="$envpath$PATH"
EOF

    # Mise à jour du fichier de configuration "~/.bashrc" et vérification de l'application de la modification de la variable d'environnement
    # shellcheck disable=SC1090
    source "$DIR_HOME/.bashrc"
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
		echo "$rep_autoremove" >> "$__BU_PROJECT_LOG_FILE_PATH"
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
	echo "$rep_erase_tmp" >> "$__BU_PROJECT_LOG_FILE_PATH"
    Newline

	case ${rep_erase_tmp,,} in
		"oui")
			EchoNewstep "Déplacement du fichier de logs dans votre dossier personnel."
			Newline

			mv -v "$__BU_PROJECT_LOG_FILE_PATH" "$DIR_HOMEDIR" 2>&1 | tee -a "$DIR_HOMEDIR/$__BU_PROJECT_LOG_FILE_NAME" && __BU_PROJECT_LOG_FILE_PATH=$"$DIR_HOMEDIR" \
				&& EchoSuccess "Le fichier de logs a bien été deplacé dans votre dossier personnel."

			EchoNewstep "Suppression du dossier temporaire $DIR_TMP_PATH."
			Newline

			if test rm -rfv "$DIR_TMP_PATH" >> "$__BU_PROJECT_LOG_FILE_PATH"; then
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
	echo "Il porte le nom de $(Decho "$__BU_PROJECT_LOG_FILE_NAME")."
	Newline

    # On tue le processus de connexion en mode super-utilisateur.
	sudo -k

	exit 0
}



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################ DÉBUT DE L'EXÉCUTION DU SCRIPT ###########################################

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

lineno=$LINENO; command -v curl snap wget | tee -a "$__BU_PROJECT_LOG_FILE_PATH"
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

Makedir "$DIR_HOMEDIR" "$DIR_SOFTWARE_NAME" "2" "1" 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH"
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
