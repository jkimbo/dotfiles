#!/bin/bash
#
# Fusepump - update local database
#
# Dump local database and then import new database
#

USER="$1" # username
PASS="$2" # password
DB="$3" # database
FILE="$4" # new database file to import

# Detect paths
MYSQL=$(which mysql)
AWK=$(which awk)
GREP=$(which grep)
 
if [ $# -ne 4 ] # if inputs aren't defined
then
  echo "Usage: ${0##*/} {MySQL-User-Name} {MySQL-User-Password} {MySQL-Database-Name} {New-Database-File}"
  echo "Drops all tables from a MySQL and imports new Database"
  exit 1
fi
 
# Get tables
TABLES=$($MYSQL -u $USER -p$PASS $DB -e 'show tables' | $AWK '{ print $1}' | $GREP -v '^Tables' )
 
# Drop tables
for t in $TABLES
do
  echo "Deleting $t table from $DB database..."
  $MYSQL -u $USER -p$PASS $DB -e "drop table $t"
done

# Import new DB
echo "Importing new DB from $FILE ...";
$MYSQL -u $USER -p$PASS $DB < $FILE

echo "Done!"
