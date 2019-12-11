# Wi-Fix - Gestion automatique de connexion Wi-Fi

Voici un petit script Powershell pour récupérer votre connexion Wi-Fi automatique si celle-ci ne fonctionne plus.
À noter que Powershell n'est disponible que sous **Windows**, et que donc les utilisateurs de Mac ou de Linux n'auront aucun intérêt à télécharger ce script.

Également, ce script nécessitant de modifier les stratégies de groupes locaux, il ne peut fonctionner que sur les versions **Professionnel** et **Education** de Windows.
Pour la version **Famille** de Windows, le script devra s'exécuter à la main à chaque lancement de l'ordinateur.

## MISE EN GARDE

La modification de la politique d'exécution des scripts Powershell sur votre machine peut entrainer des failles de sécurité sur votre ordinateur. Par conséquent, n'exécutez JAMAIS un script Powershell dont vous ne connaissez pas l'origine.
Sur mon script, j'ai ajouté un commentaire pour chaque bloc afin que vous comprenniez ma démarche, car j'ai créé ce script pour mes besoins personnels avant de vous le faire partager. Si vous n'avez pas confiance en ce script malgré cela, je vous conseille de le faire lire par quelqu'un de votre entourage qui comprend Powershell, afin que vous soyez plus sereins lorsque vous exécuterez ce script.

## INSTALLATION DU SCRIPT SUR VOTRE MACHINE

Pour que le script puisse se lancer sur votre machine, il faudra modifier la politique d'exécution des scripts Powershell.
De base, et pour plus de sécurité, votre ordinateur n'acceptera que les scripts reconnus par Windows, ce qui empêchera Wi-Fix de se lancer. Pour modifier cette politique, ouvrez une fenêtre Powershell en mode Administrateur (Recherchez "Powershell" dans votre barre de recherche Windows, click droit sur "Windows Powershell", et "Exécuter en tant qu'administrateur") et tapez la commande suivante :

`Set-ExecutionPolicy -ExecutionPolicy Unrestricted`

Puis appuyez sur T et Entrée. Wi-Fix pourra désormais s'exécuter sur votre machine.

Pour que le script fonctionne sans que vous n'ayez à le lancer à la main, il faut l'installer de sorte à ce qu'il s'exécute au lancement de votre ordinateur. Pour ce faire, ouvrez une fenêtre "Exécuter" (soit en appuyant simultanément sur les touches Windows et R, soit en faisantun click droit sur votre icône Windows et en cliquant sur "Exécuter") et tapez

`gpedit.msc`

Une fenêtre appellée "Éditeur de stratégies de groupe locale" va alors s'ouvrir. Dépliez l'onglet "Configuration ordinateur", puis l'onglet "Paramètres Windows", et enfin cliquez sur "Scripts (démarrage/arrêt)". Le morceau de fenêtre à droite de l'arborescense affichera alors deux éléments : "Démarrage", et "Arrêt du système". Faites un double click sur "Démarrage", et dans la nouvelle fenêtre qui vient de s'ouvrir cliquez sur l'onglet "Scripts Powershell". Cliquez ensuite sur "Ajouter", puis sur "Parcourir..." et sélectionnez le script téléchargé. Sur le menu déroulant, mettez l'option "Exécuter les scripts Powershell en premier" et cliquez sur OK. L'ordinateur devrait vous demander de redémarrer pour appliquer les nouvelles configurations. Redémarrez alors l'ordinateur,et vous constaterez alors que ... Oh, miracle! Ma Wi-Fi fonctionne à nouveau!!! :D

A noter que le programme peut mettre quelques secondes à se lancer, dépendant de la puissance de la machine. Mais rien d'insurmontable, n'est-ce pas? :)