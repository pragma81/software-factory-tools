#!/bin/bash
set -e

# Perform all actions as user 'postgres'
export PGUSER=admin

TEST=`psql <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='sonar';
EOSQL`

echo "******CREATING SONARQUBE DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
   CREATE ROLE sonar WITH LOGIN ENCRYPTED PASSWORD 'sonar' CREATEDB;
EOSQL

psql <<- EOSQL
   CREATE DATABASE sonar WITH OWNER sonar TEMPLATE template0 ENCODING 'UTF8';
EOSQL

psql <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;
EOSQL
fi

echo ""
echo "******SONAR DATABASE CREATED******"
