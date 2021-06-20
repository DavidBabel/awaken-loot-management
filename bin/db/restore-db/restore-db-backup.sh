#!/bin/bash

source .env
set -e

RED='\033[0;31m'
NC='\033[0m' # No Color

date=$(date '+%Y-%m-%d-%H-%M-%S')

FILE=./bin/db/restore-db/backup.sql
if test -f "$FILE"; then
  ./bin/db/backup-prod.sh

  echo "$FILE exist, reverting DB"

  echo -e $RED Reset all databases ... $NC
  psql $PROD_DB < ./bin/db/reset_static_databases.sql

  echo -e $RED Send seeds ... $NC
  psql $PROD_DB < $FILE

  rm $FILE
fi


