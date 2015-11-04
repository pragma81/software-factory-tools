#!/bin/bash
set -e

# Perform all actions as user 'postgres'
export PGUSER=admin

TEST=`psql <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='stash';
EOSQL`

echo "******CREATING STASH DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
   CREATE ROLE stash WITH LOGIN ENCRYPTED PASSWORD 'stash' CREATEDB;
EOSQL

psql <<- EOSQL
   CREATE DATABASE stash WITH OWNER stash TEMPLATE template0 ENCODING 'UTF8';
EOSQL

psql <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE stash TO stash;
EOSQL
fi

echo ""
echo "******STASH DATABASE CREATED******"
