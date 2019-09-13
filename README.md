# awaken-loot-management

## dependances

### environnement

Le Programme fonctionne avec node > 12 https://nodejs.org/en/
Il utilise `yarn` pour la gestion des dépendances (et non npm)
Pour l'installer utiliser la commande `npm install -g yarn`
Ensuite pour installer les dépendances, les sauvegarder et les mettre à jour :

```bash
yarn add mon_paquet
yarn add -D mon_paquet_de_dev
```

### dependances externes

La seule chose nécessaire en plus pour que ca fonctionne en local est d'installer PostgreSql 11.
Ca se trouve ici : https://www.postgresql.org/download/

Il faut absoluement que les utilitaires de ligne de commande postgres soient dans votre PATH à savoir :

- dropdb
- createdb
- psql

Les fichiers SQL de base de données sont dans le dossier `db/` et doivent être ajoutés dans l'ordre
C'est fait avec la commande `yarn reset` qui va concatener tous les fichiers SQL et les insérer dans la base. Attention! ça vide la base actuelle.

### Sur mac et linux

C'est très facile, il suffit de télécharger l'utilitaire depuis https://www.postgresql.org/download/
Et il suffit ensuite de démarrer le serveur depuis l'utilitaire (postgres.app sur mac, et postgres sous linux)

### Sur Pc Windows

(TODO compléter doc)

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
yarn install

# on initialise la database
yarn reset

# on lance le serveur next.js avec postgraphile
yarn dev

# et pour fabriquer les requêtes GraphQL, on lance graphiQL sans aucune restriction d'accès
yarn gqp
```

Le site devrait être disponible sur http://localhost:3000

GraphiQl qui sert à écrire les requêtes est disponible à l'adresse : http://localhost:5000/graphiql

Et ya plus qu'à dev :)
