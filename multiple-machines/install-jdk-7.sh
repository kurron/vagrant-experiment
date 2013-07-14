#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_jdk_7" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Oracle JDK 7..."
mkdir -p /vagrant/file-cache
if [ -f "/vagrant/file-cache/jdk7.gz" ]; then
  echo "JDK already cached.  Not downloading." 
else
  echo "Downloading Oracle JDK 7..."
  wget --quiet --output-document=/vagrant/file-cache/jdk7.gz http://home.comcast.net/~kurr/vagrant/jdk-7u25-linux-x64.gz
fi
mkdir -p /usr/lib/jvm
tar --gzip --extract --verbose --file=/vagrant/file-cache/jdk7.gz --directory=/usr/lib/jvm
chown -R root:root /usr/lib/jvm/jdk1.7.0_25
cd /usr/lib/jvm ; ln -s jdk1.7.0_25 oracle-jdk-7 ; ls -lh

# signal a successful provision
touch /var/vagrant_jdk_7
