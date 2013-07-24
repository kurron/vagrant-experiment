#!/usr/bin/env bash

USERNAME=$1
DONEFILE=/var/vagrant-add-user-$USERNAME

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Adding restricted user " ${USERNAME}
aptitude install whois 
useradd ${USERNAME} --comment ${USERNAME} --shell /bin/false --user-group --password `mkpasswd ${USERNAME}` 

# signal a successful provision
touch ${DONEFILE}
