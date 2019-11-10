#!/bin/bash

set -e

RED='\033[0;31m'
NC='\033[0m' # No Color

date=$(date '+%Y-%m-%d-%H-%M-%S')

FILE=./bin/db/inject-sql/to-inject.sql
if test -f "$FILE"; then
  ./bin/db/backup-prod.sh

  echo -e $RED Executing script ... $NC
  psql $PROD_DB < $FILE

  rm $FILE
fi


