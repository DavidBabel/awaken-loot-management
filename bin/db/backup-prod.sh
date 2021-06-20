#!/bin/bash

source .env
set -e

# $PROD_DB is a local env var

RED='\033[0;31m'
NC='\033[0m' # No Color

date=$1
if [ -z "$date" ]
then
  echo "set default date"
  date=$(date '+%Y-%m-%d-%H-%M-%S')
fi

mkdir "./db/backups/$date"
echo -e $RED Backup All ... $NC
pg_dump $PROD_DB > "./db/backups/$date/db-all.sql"

echo -e $RED Backup Players ... $NC
pg_dump $PROD_DB --data-only -t "public.\"Players\"" > "./db/backups/$date/db-table-players.sql"

echo -e $RED Backup PlayerMerit ... $NC
pg_dump $PROD_DB --data-only -t "public.\"PlayerMerit\"" > "./db/backups/$date/db-table-playermerit.sql"

echo -e $RED Backup Loots ... $NC
pg_dump $PROD_DB --data-only -t "public.\"Loots\"" > "./db/backups/$date/db-table-loots.sql"

echo -e $RED Backup Raids ... $NC
pg_dump $PROD_DB --data-only -t "public.\"Raids\"" > "./db/backups/$date/db-table-raids.sql"

echo -e $RED Backup RaidPlayers ... $NC
pg_dump $PROD_DB --data-only -t "public.\"RaidPlayers\"" > "./db/backups/$date/db-table-raidplayers.sql"

echo -e $RED Backup SoftResa ... $NC
pg_dump $PROD_DB --data-only -t "public.\"SoftResa\"" > "./db/backups/$date/db-table-softresa.sql"

echo -e $RED Backup finished $NC
