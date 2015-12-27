#!/bin/bash
set -e

# Perform all actions as user 'postgres'
export PGUSER=admin

TEST=`psql <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='bitbucket';
EOSQL`

echo "******CREATING BITBUCKET DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
   CREATE ROLE bitbucket WITH LOGIN ENCRYPTED PASSWORD 'bitbucket' CREATEDB;
EOSQL

psql <<- EOSQL
   CREATE DATABASE bitbucket WITH OWNER bitbucket TEMPLATE template0 ENCODING 'UTF8';
EOSQL

psql <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE bitbucket TO bitbucket;
EOSQL
fi

echo ""
echo "******BITBUCKET DATABASE CREATED******"
