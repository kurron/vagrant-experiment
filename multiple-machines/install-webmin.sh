#!/usr/bin/env bash

DONEFILE=/var/vagrant-webmin

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Webmin..."
cd /tmp ; wget http://www.webmin.com/jcameron-key.asc ; apt-key add jcameron-key.asc
echo 'deb http://download.webmin.com/download/repository sarge contrib' | tee /etc/apt/sources.list.d/webmin.list
aptitude update
aptitude install webmin

# signal a successful provision
touch ${DONEFILE}
