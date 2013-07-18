#!/usr/bin/env bash

DONEFILE=/var/vagrant-redis

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Redis..."
aptitude install -y redis-server
aptitude install -y redis-doc

# signal a successful provision
touch ${DONEFILE} 
