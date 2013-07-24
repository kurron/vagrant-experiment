#!/usr/bin/env bash

DONEFILE=/var/vagrant-haproxy

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing HA Proxy..."
aptitude install -y haproxy hatop 

# signal a successful provision
touch ${DONEFILE}
