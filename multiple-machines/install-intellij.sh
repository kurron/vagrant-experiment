#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-intellij
CACHE=/vagrant/file-cache
ARCHIVE=idea.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
IDEADIR=${ACCOUNTDIR}/Software/IntelliJ

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Jetbrains IntelliJ IDEA..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "IntelliJ IDEA already cached.  Not downloading." 
else
  echo "Downloading IntelliJ IDEA..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://home.comcast.net/~kurr/vagrant/ideaIU-12.1.4.tar.gz
fi
mkdir -p ${IDEADIR}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${IDEADIR}
cd ${IDEADIR} ; ln -s idea-IU-129.713 idea ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
