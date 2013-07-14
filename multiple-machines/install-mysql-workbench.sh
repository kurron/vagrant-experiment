#!/usr/bin/env bash

DONEFILE=/var/vagrant-mysql-workbench

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MySQL Workbench..."
aptitude install -y mysql-workbench 

# signal a successful provision
touch ${DONEFILE} 
