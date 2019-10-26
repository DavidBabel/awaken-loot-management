#!/bin/bash

# ./bin/db/backup-prod.sh
psql $PROD_DB < ./bin/db/reset_static_databases.sql
# psql $PROD_DB < ./db/gen/db.sql
# psql $PROD_DB < ./bin/db/trucate_tables.sql