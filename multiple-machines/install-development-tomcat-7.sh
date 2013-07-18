#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-development-tomcat-7
CACHE=/vagrant/file-cache
ARCHIVE=tomcat-7.0.41.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Software/Tomcat

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Tomcat 7 (development style)..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
    echo "Tomcat archive already cached. Not downloading." 
else
    echo "Downloading Tomcat 7..."
    wget --quiet --output-document=${CACHE}/${ARCHIVE} http://apache.mesi.com.ar/tomcat/tomcat-7/v7.0.41/bin/apache-tomcat-7.0.41.tar.gz 
fi
mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
cd ${TARGET} ; ln -s apache-tomcat-7.0.41 tomcat-7 ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
