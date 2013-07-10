#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_provision" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Apache and setting it up..."
aptitude update
aptitude install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www

# signal a successful provision
touch /var/vagrant_provision
