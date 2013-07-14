#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-db-visualizer
CACHE=/vagrant/file-cache
ARCHIVE=db-visualizer.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Software

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing DbVisualizer..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "DbVisualizer already cached.  Not downloading." 
else
  echo "Downloading DbVisualizer..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} "http://www.dbvis.com/form/registerDownload.jsp?prodid=73&product=DbVisualizer&version=9.0.7&version_type=current&target_os=unix&with_jre=false&filename=dbvis_unix_9_0_7.tar.gz&type=UNIX+(tar.gz+archive)&installer=%2fproduct_download%2fdbvis-9.0.7%2fmedia%2fdbvis_unix_9_0_7.tar.gz" 
fi
mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
