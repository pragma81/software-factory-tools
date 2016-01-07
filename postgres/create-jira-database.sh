#!/bin/bash
set -e

# Perform all actions as user 'postgres'
export PGUSER=admin

TEST=`psql <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='jira';
EOSQL`

echo "******CREATING JIRA DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
   CREATE ROLE jira WITH LOGIN ENCRYPTED PASSWORD 'jira' CREATEDB;
EOSQL

psql <<- EOSQL
   CREATE DATABASE jira WITH OWNER artifactory TEMPLATE template0 ENCODING 'UTF8';
EOSQL

psql <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE jira TO jira;
EOSQL
fi

echo ""
echo "******JIRA DATABASE CREATED******"