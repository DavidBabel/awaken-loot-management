#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

date=$(date '+%Y-%m-%d-%H-%M-%S')
./bin/db/backup-prod.sh

echo -e $RED Reset all databases ... $NC
psql $PROD_DB < ./bin/db/reset_static_databases.sql
# psql $PROD_DB < ./db/gen/db.sql
# # local management
echo -e $RED Create Db structure ... $NC
psql $PROD_DB < ./db/01-create.sql

echo -e $RED Create data classes and slots ... $NC
psql $PROD_DB < ./db/05-class_and_slot.sql

echo -e $RED Create data bosses ... $NC
psql $PROD_DB < ./db/08-data_bosses.sql

echo -e $RED Create data boss items ... $NC
psql $PROD_DB < ./db/11-data_boss_items.sql

echo -e $RED Create data boss items ... $NC
psql $PROD_DB < ./db/18-data_items_classes.sql

echo -e $RED Create data boss items ... $NC
psql $PROD_DB < ./db/18-data_items_classes.sql

echo -e $RED Create data merites ... $NC
psql $PROD_DB < ./db/40-merites.sql

echo -e $RED Create data players ... $NC
psql $PROD_DB < ./db/70-seeds_players.sql

# # remote management
echo -e $RED Import player merits $NC
psql $PROD_DB < ./db/backups/$date/db-table-playermerit.sql

echo -e $RED Import raids ... $NC
psql $PROD_DB < ./db/backups/$date/db-table-raids.sql

echo -e $RED Import raid players ... $NC
psql $PROD_DB < ./db/backups/$date/db-table-raidplayers.sql

echo -e $RED Import loots ... $NC
psql $PROD_DB < ./db/backups/$date/db-table-loots.sql
