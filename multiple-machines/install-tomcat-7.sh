#!/usr/bin/env bash

DONEFILE=/var/vagrant-tomcat-7

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
CACHE=/vagrant/file-cache
ARCHIVE=tomcat.tar.gz
TOMCATDIR=/usr/lib/apache-tomcat

echo "Installing Tomcat 7..."
#aptitude install -y tomcat7 
#aptitude install -y tomcat7-user 
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
    echo "Tomcat archive already cached. Not downloading." 
else
    echo "Downloading Tomcat 7..."
    wget --quiet --output-document=${CACHE}/${ARCHIVE} http://apache.mesi.com.ar/tomcat/tomcat-7/v7.0.42/bin/apache-tomcat-7.0.42.tar.gz 
fi

mkdir -p ${TOMCATDIR}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TOMCATDIR}
chown -R root:root ${TOMCATDIR}/apache-tomcat-7.0.42
cd ${TOMCATDIR} ; ln -s apache-tomcat-7.0.42 tomcat-7 ; ls -lh

# signal a successful provision
touch ${DONEFILE}
