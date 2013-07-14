#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_tomcat_7" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Tomcat 7..."
#aptitude install -y tomcat7 
#aptitude install -y tomcat7-user 
mkdir -p /vagrant/file-cache
if [ -f "/vagrant/file-cache/tomcat.tar.gz" ]; then
    echo "Tomcat archive already cached. Not downloading." 
else
    echo "Downloading Tomcat 7..."
    wget --quiet --output-document=/vagrant/file-cache/tomcat.tar.gz http://home.comcast.net/~kurr/vagrant/apache-tomcat-7.0.42.tar.gz
fi

mkdir -p /usr/lib/tomcat
tar --gzip --extract --verbose --file=/vagrant/file-cache/tomcat.tar.gz --directory=/usr/lib/tomcat
chown -R root:root /usr/lib/tomcat/apache-tomcat-7.0.42
cd /usr/lib/tomcat ; ln -s apache-tomcat-7.0.42 tomcat-7 ; ls -lh

# signal a successful provision
touch /var/vagrant_tomcat_7
