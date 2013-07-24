#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-sts
CACHE=/vagrant/file-cache
ARCHIVE=sts.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}/Software

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Spring Tool Suite..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "Spring Tool Suite already cached.  Not downloading." 
else
  echo "Downloading Spring Tool Suite..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://dist.springsource.com/release/STS/3.3.0/dist/e4.3/spring-tool-suite-3.3.0.RELEASE-e4.3-linux-gtk-x86_64.tar.gz 
fi
mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}
#ln -s ${JAVA_HOME}/jre ${TARGET}/springsource/sts-3.3.0.RELEASE

# signal a successful provision
touch ${DONEFILE} 
