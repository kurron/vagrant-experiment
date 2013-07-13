#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_mysql_client" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MySQL Client..."
aptitude install -y mysql-client 

# signal a successful provision
touch /var/vagrant_mysql_client
