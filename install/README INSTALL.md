# BASH-UTILS MODULES CONFIGURATIONS

## ENGLISH

### Automatic install

Just execute the **install_and_update.sh** script to install the modules manager, or to update the Bash Utils library root folder's path if you moved this folder somewhere else in your hard drive.

To do so, please execute this script as described :

	- INSTALLATION 	--> sudo ./install_and_update update install	**OR**	sudo ./install_and_update update i
	- UPDATE PATH 	--> sudo ./install_and_update update	**OR**	sudo ./install_and_update u

### Manual install

Copy the **.Bash-utils** folder and the **Bash-utils-include.sh** script file in your home directory (/home/<your_username>), and in the **/root** directory. You don't need to copy the other files.

**PLEASE NOTICE** that the ".Bash-utils" folder is a hidden folder so as not to clutter up your personnal folder, so make it visible by your file explorer (usually with the **Ctrl+H** keyboard shortcut), or include it with the files to copy if you're using the _cp -r_ command.

**DON'T FORGET** to check the path stored into the **_Bash-utils-root-val.path_** file, **EVEN** if the installation and the update script files automatically change it, This is the definition of the path of the library's root folder.

---

## FRANÇAIS | FRENCH

### Installation automatique

Exécutez le script **install_and_update.sh** pour installer le gestionnaire de modules, ou pour mettre à jour le chemin du dossier racine de la librairie Bash Utils si vous l'avez déplacé ailleurs sur votre disque dur.

Pour cela, exécuter ce script d'une des manières suivantes :

	- INSTALLATION 			--> sudo ./install_and_update update install	**OU**	sudo ./install_and_update update i
	- MISE À JOUR DU CHEMIN --> sudo ./install_and_update update	**OU**	sudo ./install_and_update u

### Installation manuelle

Copiez tout le dossier **.Bash-utils** dans votre dossier personnel (/home/<votre_nom_d'utilisateur>), ainsi que dans le dossier **/root**. Vous n'avez pas besoin de copier les autres fichiers.

**REMARQUE** : Le dossier ".Bash-utils" est un dossier caché pour ne pas trop encombrer votre dossier personnel. Rendez-le visible par votre explorateur de fichiers (en général avec le raccourci clavier **Ctrl+H**), ou incluez-le avec les fichiers à copier si vous utilisez la commande _cp -r_.

**N'OUBLIEZ PAS** de vérifier le contenu du fichier **_Bash-utils-root-val.path_**, **MÊME** si les scripts d'installation et/ou de mise à jour le modifie automatiquement. C'est ici que le chemin du dossier racine de la libraire est défini.
