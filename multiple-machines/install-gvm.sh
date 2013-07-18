#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-gvm
ACCOUNTDIR=/home/${ACCOUNT}

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Groovy enVironment Manager..."
aptitude install -y curl
sudo -u ${ACCOUNT} -H -n -i /vagrant/gvm-command.sh --
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
