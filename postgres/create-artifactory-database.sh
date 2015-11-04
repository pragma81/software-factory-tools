#!/bin/bash

set -e

# Perform all actions as user 'postgres'
export PGUSER=admin

TEST=`psql <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='artifactory';
EOSQL`

echo "******CREATING ARTIFACTORY DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
   CREATE ROLE artifactory WITH LOGIN ENCRYPTED PASSWORD 'password' CREATEDB;
EOSQL

psql <<- EOSQL
   CREATE DATABASE artifactory WITH OWNER artifactory TEMPLATE template0 ENCODING 'UTF8';
EOSQL

psql <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE artifactory TO artifactory;
EOSQL
fi

echo ""
echo "******ARTIFACTORY DATABASE CREATED******"
