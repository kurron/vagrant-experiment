#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_monbodb" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MongoDB..."
aptitude install -y mongodb 

# signal a successful provision
touch /var/vagrant_mongodb
