# Evaluation d'Entrainement - créer et administrer une base de donnée

## Date
Réalisé du 18/04/2022 au 19/04/2022 dans le cadre de la formation en ligne Studi

## Contenu
5 fichiers
- evalBDD.sql (contient les fichiers de création de la base de données)
- data.sql (contient les données pour alimenter et tester la base de données)
- demo.sql (fichier raccourcis pour créer la Base de donnée et insérer les données)
- digram_UML.pdf (contient les diagrammes UML)
- "sauvegarde.sql" : un exemple de sauvegarde de la base de données


## Comment ajouter la base de donnée
- cloner le repository
- Se connecter à votre BDD MySql
- Se placer dans le répertoire EvalBDD
- taper ```source demo.sql``` pour créer la BDD et toutes les données de démo.
- ou taper ```source evalBDD``` pour créer uniquement la BDD.


## Sauvegarger la Base de donnée avec les données insérées
```mysqldump -u root -p cinemas_manager>sauvegarde.sql```

- cinemas_manager est la nom de la base de donnée à sauvegarder
- sauvegarde.sql est le nom de la sauvegarde
- root est le nom de l'utilisateur pour accéder à la base de données.

## utilisateurs avec privilèges
- un utilisateur 'administrator' est créé avec tous les droits administrateur sur la base de donnée cinemas_manager.
- un utlisateur 'user' est créé avec des droits limités à la production "INSERT, UPDATE, DELETE, SELECT" pour limiter les risques suites à une éventuelle injection SQL.

