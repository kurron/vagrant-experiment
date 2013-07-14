#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-logfaces-client
CACHE=/vagrant/file-cache
ARCHIVE=logfaces-client.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Software

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing logFACES client..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "logFACES client already cached.  Not downloading." 
else
  echo "Downloading logFACES client..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://www.moonlit-software.com/logfaces/downloads/lfc.3.2.3.linux.gtk.x86_64.tar.gz 
fi
mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
