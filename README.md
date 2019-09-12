# awaken-loot-management

## dependances

Le Programme se lance avec node > 12

La seule chose nécessaire pour que ca fonctionne en local est d'installer PostgreSql 11.
Ca se trouve ici : https://www.postgresql.org/download/

C'est très facile sur mac et sur linux, mais je ne sais pas pour Windows.
La seule chose qui est sure c'est qu'il faut les utilitaires de ligne de commande postgres dans le PATH à savoir :

- dropdb
- createdb
- psql

Les fichiers SQL de base de données sont dans db et doivent être ajoutés dans l'ordre

## quickstart

Ensuite c'est hyper classique :

```bash
# les dépendences node.js
yarn install

# on initialise la database
yarn reset

# on lance le serveur next.js avec postgraphile
yarn dev

# et pour fabriquer les requêtes GraphQL, on lance graphiQL
yarn gqp
```

Et tout devrait être disponible sur http://localhost:3000

GraphiQl qui sert à écrire les requêtes est disponible à l'adresse : http://localhost:5000/graphiql

Et ya plus qu'à dev :)
