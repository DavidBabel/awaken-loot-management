#!/bin/sh

source .env
set -e

cat db/*.sql > db/gen/db.sql
psql $DATABASE_URL/test < bin/db/renew-db.sql
psql $DATABASE_URL/test < db/gen/db.sql