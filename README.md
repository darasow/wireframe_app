# wireframe_app

## Pour Executer le projet :
- Assurez vous d'avoir flutter installer dans votre machine
- Lancez votre IDE de preference(Android, Vscode, Intellij...)
- Ouvrez le projet
- Connectez votre emulateur ou votre telephone physique(activez le mode   developpement)
- Executer l'application avec les boutons proposés par votre IDE après avoir installer les dépendances avec la commande flutter pub get

## Les principales fonctionnalités implémentées
- J'ai utiliser un SingleChildScrollView pour que ma Scaffold soit scrollable
- L'utilisation de ListView.builder pour ajouter dynamiquement bcp d'amis en creant une Liste<String> static appelé amis la ou j'ai ajouter en dure les noms des amis
- Comme la listeView sera scrolable et verticalement par defaut, donc  j'ai changer la direction du scroll avec scrollDirection qui prend Axis.horizontal pour faire scroller les amis horizontalement,
- Pour les postes là je les ais pas mis dans une LisView parcequ'ils sont directement dans le SingleChildScrollView donc scrollable mais il y a cas même une petite chose que j'ai augmenter, le fait que chaque poste correspond a un ami au niveau des amis, c'est parceque j'ai generer 10 cards avec List.generate et chaque card je recupere un ami qui correspond a l'index courant puis je prend une image qui correspond a cet ami.
- Sur les nombres de likes et commentaires là aussi j'ai fait de tel sorte que quand on click sur les boutons le nombre s'incremente dynamiquement et c'est là maintenant j'ai penser au StatefulWidget


## La logique de la technique wireframe
- Pour bien respecter le wireframe j'ai morceler mon code pour que  chaque grande partie soit dans une fonction a part j'ai creer un fichier dart appeler component.dart pour ces fonctions, c'est juste pour avoir un code plus lisible, organiser et maintenable.


