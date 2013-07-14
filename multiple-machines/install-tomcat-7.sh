#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_tomcat_7" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Tomcat 7..."
aptitude install -y tomcat7 
aptitude install -y tomcat7-user 

# signal a successful provision
touch /var/vagrant_tomcat_7
