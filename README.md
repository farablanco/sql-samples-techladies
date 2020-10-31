# LEVEL UP WORKSHOP: SQL

## CLI commands

complete list: https://www.postgresql.org/docs/10/app-psql.html

### PSQL

* psql <db_name> - log in
* \list - list all defined databases
* \connect <db_name> - switch to database <db_name>
* \dt - list tables in a db
* \i <filename> - reads input from file and executes
* \q - quit

* CREATE DATABASE testdb;

### Dump and Restore

- to dump: `pg_dump [dbname] > [outfile]`
- to restore: `psql [dbname] < [infile]`

## LOTR sample database and queries

Found here: ./lotr/lotr_dump.sql

