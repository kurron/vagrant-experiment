#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_tomcat_7" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Tomcat 7..."
#aptitude install -y tomcat7 
#aptitude install -y tomcat7-user 
echo "Downloading Tomcat 7..."
wget --quiet --output-document=/tmp/tomcat.tar.gz http://home.comcast.net/~kurr/vagrant/apache-tomcat-7.0.42.tar.gz
mkdir -p /usr/lib/tomcat
tar --gzip --extract --verbose --file=/tmp/tomcat.tar.gz --directory=/usr/lib/tomcat
cd /usr/lib/tomcat ; ln -s apache-tomcat-7.0.42 tomcat-7 ; ls -lh

# signal a successful provision
touch /var/vagrant_tomcat_7