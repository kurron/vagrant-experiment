#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_mysql" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MySQL Server..."
aptitude install -y mysql-server 

# signal a successful provision
touch /var/vagrant_mysql
