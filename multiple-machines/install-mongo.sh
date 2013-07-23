#!/usr/bin/env bash

DONEFILE=/var/vagrant-mongodb

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MongoDB from 10gen..."
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
aptitude update
aptitude install mongodb-10gen

#aptitude install -y mongodb 

# signal a successful provision
touch ${DONEFILE}
