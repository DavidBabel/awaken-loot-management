# awaken-loot-management

## dependances

### environnement

Le Programme fonctionne avec node > 12 https://nodejs.org/en/
Il utilise `npm` pour la gestion des dépendances
Ensuite pour installer les dépendances, les sauvegarder et les mettre à jour :

```bash
npm add mon_paquet
npm add -D mon_paquet_de_dev
```

### dependances externes

La seule chose nécessaire en plus pour que ca fonctionne en local est d'installer PostgreSql 11.
Ca se trouve ici : https://www.postgresql.org/download/

Il faut absolument que les utilitaires de ligne de commande postgres soient dans votre PATH à savoir :

- dropdb
- createdb
- psql

Les fichiers SQL de base de données sont dans le dossier `db/` et doivent être ajoutés dans l'ordre
C'est fait avec la commande `npm run reset` qui va concatener tous les fichiers SQL et les insérer dans la base. Attention! ça vide la base actuelle.

### Sur mac et linux

C'est très facile, il suffit de télécharger l'utilitaire depuis https://www.postgresql.org/download/
Et il suffit ensuite de démarrer le serveur depuis l'utilitaire (postgres.app sur mac, et postgres sous linux)

### Sur Pc Windows

Installer Postgres pour windows: https://www.postgresql.org/download/windows/

Suivre ce tutorial pour installer postgres et configurer les variables d'environement PATH: https://www.supinfo.com/articles/single/977-creer-une-base-donnees-avec-postgresql-windows

Il est important de bien configurer les variables d'environement PATH comme indiqué dans le lien ci dessus pour pouvoir utiliser la commande "psql" dans l'invite de commandes Windows.

Lors de la première utilisation:
  - Se connecter a l'interface postgres: "psql -U postgres"
  - Créer la base de donnée: "CREATE DATABASE test;" (ne pas oublier le ";")
  - Naviguer jusqu'au fichier "db.sql" dans "db/gen/". 
      Pour cela, utiliser les commandes: 
        - "\! cd" pour connaitre le dossier actuel.
        - "\cd .." pour aller au dossier précedent.
        - "\cd c:" pour changer de disque dur.
        - "\cd xxx/xxxx/xxx/xxx/" pour choisir le chemin.
        - "\i db.sql" pour injecter toutes les données dans la base.
   - Se connecter a la db: "\c test"
        
Lors des autres utilisations:
  - se connecter a l'interface postgres: "-psql -U postgres"
  - Se connecter a la db: "\c test"

## windows

Un bon outil pour executer les scripts sans soucis est d'utiliser **cmder** https://cmder.net/
C'est un peu plus convivial que l'invit de commande windows, et surtout ça permet d'avoir accès à bash et aux commandes linux de base comme "cat", "cp" et autres ...

## quickstart

- Première étape, démarrer votre serveur postgreSQL
- Ensuite si vous avez besoin de définir des variables d'environement local executer cette commande :

```bash
cp .env-example .env
```

Puis editer le contenu pour adapter à votre usage. Il y a des exemples.

Pour le reste c'est hyper classique :

```bash
# les dépendences node.js
npm install

# on initialise la database
npm run reset

# on lance le serveur next.js avec postgraphile
npm run dev

# et pour fabriquer les requêtes GraphQL, on lance graphiQL sans aucune restriction d'accès
npm run gqp
```

Le site devrait être disponible sur http://localhost:8000

GraphiQl qui sert à écrire les requêtes est disponible à l'adresse : http://localhost:5000/graphiql

Et ya plus qu'à dev :)

## quick script

Le script `db/wowhead-extractsextract_loot_wowhead_in_browser.sql` premet d'extraire un JSON d'une table de loot sur wowhead, il suffit de la copier dans la console.

Pour convertir ce JSON en SQL, il suffit d'executer la commande :

```bash
npm run loot "Nom du boss" ./db/wowhead-extracts/mc/FichierJsonBuBoss.json
```

trigger build
