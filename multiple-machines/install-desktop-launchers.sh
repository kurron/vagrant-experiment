#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-desktop-launchers
CACHE=/vagrant/file-cache
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Desktop

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Desktop IDE launchers..."
mkdir -p ${TARGET}
cp --verbose /vagrant/*.desktop ${TARGET}
chown -R ${ACCOUNT}:${ACCOUNT} ${TARGET}

# signal a successful provision
touch ${DONEFILE} 
