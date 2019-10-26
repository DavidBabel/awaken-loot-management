#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

date=$(date '+%Y-%m-%d-%H-%M-%S')
./bin/db/backup-prod.sh

echo -e $RED Reset all databases ... $NC
psql $PROD_DB < ./bin/db/reset_static_databases.sql
echo -e $RED Send seeds ... $NC
psql $PROD_DB < ./db/gen/db.sql
