#!/bin/sh

source .env
set -e

cat db/*.sql > db/gen/db.sql
dropdb --username=postgres test || true
createdb --username=postgres test
psql --username=postgres test < db/gen/db.sql