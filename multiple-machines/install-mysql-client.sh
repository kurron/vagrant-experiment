#!/usr/bin/env bash

DONEFILE=/var/vagrant-mysql-client

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MySQL Client..."
aptitude install -y mysql-client 

# signal a successful provision
touch ${DONEFILE}
