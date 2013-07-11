#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_xfce" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing XFCE desktop..."
aptitude install -y xubuntu-desktop

# signal a successful provision
touch /var/vagrant_xfce
