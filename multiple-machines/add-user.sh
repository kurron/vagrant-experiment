#!/usr/bin/env bash

USERNAME=$1

# make sure we are idempotent
if [ -f "/var/vagrant_add_user" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Adding user " $USERNAME
useradd $USERNAME -m -s /bin/bash
addgroup $USERNAME
adduser $USERNAME $USERNAME
adduser $USERNAME adm
adduser $USERNAME cdrom
adduser $USERNAME sudo
adduser $USERNAME dip
adduser $USERNAME plugdev
adduser $USERNAME lpadm
adduser $USERNAME sambashare


# signal a successful provision
touch /var/vagrant_add_user
