#!/bin/sh

set -e

cat db/*.sql > db/gen/db.sql
dropdb test || true
createdb test
psql test < db/gen/db.sql