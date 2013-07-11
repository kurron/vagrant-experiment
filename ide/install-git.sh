#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_git" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Git..."
aptitude install -y git 

# signal a successful provision
touch /var/vagrant_git
