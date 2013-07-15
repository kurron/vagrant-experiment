#!/usr/bin/env bash

USERNAME=$1
DONEFILE=/var/vagrant-add-user

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Adding user " ${USERNAME}
aptitude install whois 
useradd ${USERNAME} --comment ${USERNAME} --groups adm,cdrom,sudo,dip,plugdev,lpadmin,sambashare --create-home --shell /bin/bash --user-group --password `mkpasswd ${USERNAME}` 

# signal a successful provision
touch ${DONEFILE}
