#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_mercurial" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Git..."
aptitude install -y mercurial 

# signal a successful provision
touch /var/vagrant_mercurial
