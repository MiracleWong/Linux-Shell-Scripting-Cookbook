#!/bin/bash
HOSTNAME="localhost"
USERNAME="root"
PASSWORD="jiubugaosuni"
MYSQL=/usr/bin/mysql
SH_DB="show databases"
$MYSQL -u$USERNAME -p$PASSWORD -e"$SH_DB"
