#!/bin/bash

set -x

PASSWORD=Metatron123$

TMP_PW="`grep 'temporary password' /var/log/mysqld.log | awk {'print $11'}`"

expect -c "
set timeout 3
spawn mysql_secure_installation
expect \"Enter password for user root:\"
send \"$TMP_PW\\r\"
expect \"New password:\"
send \"$PASSWORD\\r\"
expect \"Re-enter new password:\"
send \"$PASSWORD\\r\"
expect \"Change the password for root ? ((Press y|Y for Yes, any other key for No) :\"
send \"y\\r\"
expect \"New password:\"
send \"$PASSWORD\\r\"
expect \"Re-enter new password:\"
send \"$PASSWORD\\r\"
expect \"Do you wish to continue with the password provided?\"
send \"y\\r\"
expect \"Remove anonymous users?\"
send \"\\r\"
expect \"Disallow root login remotely?\"
send \"\\r\"
expect \"Remove test database and access to it?\"
send \"\\r\"
expect \"Reload privilege tables now?\"
send \"y\\r\"
expect eof
"

