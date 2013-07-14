#!/usr/bin/env bash

USERNAME=$1

# make sure we are idempotent
if [ -f "/var/vagrant_add_user" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Adding user " ${USERNAME}
aptitude install whois 
useradd ${USERNAME} --comment ${USERNAME} --groups adm,cdrom,sudo,dip,plugdev,lpadmin,sambashare --create-home --shell /bin/bash --user-group --password `mkpasswd ${USERNAME}` 

# signal a successful provision
touch /var/vagrant_add_user
