#!/usr/bin/env bash

DONEFILE=/var/vagrant-mongodb

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MongoDB..."
aptitude install -y mongodb 

# signal a successful provision
touch ${DONEFILE}
