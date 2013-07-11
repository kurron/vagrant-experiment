#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_subversion" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Git..."
aptitude install -y subversion subversion-tools

# signal a successful provision
touch /var/vagrant_subversion
