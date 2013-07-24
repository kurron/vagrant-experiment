#!/usr/bin/env bash

HOSTNAME=$1
IP=$2
DONEFILE=/var/vagrant-add-hostname-$HOSTNAME

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Adding hostname " ${USERNAME} ${IP}
echo ${IP} ${HOSTNAME} | tee -a /etc/hosts

# signal a successful provision
touch ${DONEFILE}
