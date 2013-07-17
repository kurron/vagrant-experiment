#!/usr/bin/env bash

DONEFILE=/var/vagrant-jdk-7

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
CACHE=/vagrant/file-cache
ARCHIVE=jdk7.tar.gz
JVMDIR=/usr/lib/jvm

echo "Installing Oracle JDK 7..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "JDK already cached.  Not downloading." 
else
  echo "Downloading Oracle JDK 7..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://home.comcast.net/~kurr/vagrant/jdk-7u25-linux-x64.gz
fi
mkdir -p ${JVMDIR}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${JVMDIR}
chown -R root:root ${JVMDIR}/jdk1.7.0_25
cd ${JVMDIR} ; ln -s jdk1.7.0_25 oracle-jdk-7 ; ls -lh

sed -i '$a JAVA_HOME=/usr/lib/jvm/oracle-jdk-7' /etc/environment
sed -i '$a JDK_HOME=/usr/lib/jvm/oracle-jdk-7' /etc/environment

cat /etc/environment

# signal a successful provision
touch ${DONEFILE}
