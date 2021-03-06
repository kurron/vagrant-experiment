#!/usr/bin/env bash

# always do these steps
aptitude update

# make sure we are idempotent
if [ -f "/var/vagrant_provision" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Apache and setting it up..."
aptitude install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www

echo "Installing Webmin..."
aptitude install -y webmin

# signal a successful provision
touch /var/vagrant_provision
