#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-ant
CACHE=/vagrant/file-cache
ARCHIVE=ant.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Software/Ant

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Apache Ant..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
    echo "Ant archive already cached. Not downloading." 
else
    echo "Downloading Apache Ant..."
    wget --quiet --output-document=${CACHE}/${ARCHIVE} http://mirrors.gigenet.com/apache/ant/binaries/apache-ant-1.9.2-bin.tar.gz 
fi
mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
cd ${TARGET} ; ln -s apache-ant-1.9.2 ant ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
