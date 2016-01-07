#!/bin/bash
set -e

# Perform all actions as user 'postgres'
export PGUSER=admin

TEST=`psql <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='bamboo';
EOSQL`

echo "******CREATING BAMBOO DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
   CREATE ROLE bamboo WITH LOGIN ENCRYPTED PASSWORD 'bamboo' CREATEDB;
EOSQL

psql <<- EOSQL
   CREATE DATABASE bamboo WITH OWNER bamboo TEMPLATE template0 ENCODING 'UTF8';
EOSQL

psql <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE bamboo TO bamboo;
EOSQL
fi

echo ""
echo "******BAMBOO DATABASE CREATED******"
