#!/bin/sh

source .env
export PGUSER=postgres

postgraphile -c $DATABASE_URL/$DBNAME --no-server --export-schema-graphql schema.gql
graphql-codegen --config gen-types-config.yml
rm schema.gql
sed -i.bak '1d' lib/generatedTypes.tsx
rm lib/generatedTypes.tsx.bak