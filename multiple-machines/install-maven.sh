#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-maven
CACHE=/vagrant/file-cache
ARCHIVE=maven.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Software/Maven

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Apache Maven..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
    echo "Maven archive already cached. Not downloading." 
else
    echo "Downloading Apache Maven..."
    wget --quiet --output-document=${CACHE}/${ARCHIVE} http://apache.cs.utah.edu/maven/maven-3/3.1.0/binaries/apache-maven-3.1.0-bin.tar.gz 
fi
mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
cd ${TARGET} ; ln -s apache-maven-3.1.0 maven ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
