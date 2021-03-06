#!/usr/bin/env bash

DONEFILE=/var/vagrant-tomcat-7

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
CACHE=/vagrant/file-cache
ARCHIVE=tomcat-7.0.42.tar.gz
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
ln -s ${TOMCATDIR}/apache-tomcat-7.0.42 /usr/share/tomcat7
mkdir -p /var/lib/tomcat7
cp -a /usr/share/tomcat7/conf /var/lib/tomcat7
mkdir /var/lib/tomcat7/common 
mkdir /var/lib/tomcat7/logs 
mkdir /var/lib/tomcat7/temp 
mkdir /var/lib/tomcat7/server 
mkdir /var/lib/tomcat7/shared 
mkdir -p /var/lib/tomcat7/webapps/ROOT
mkdir /var/lib/tomcat7/work
tar --extract --verbose --file=/vagrant/tomcat.tar --directory=/etc
cp -R /etc/tomcat7/policy.d /var/lib/tomcat7/conf
chown -R tomcat7:tomcat7 /var/lib/tomcat7

cp /vagrant/tomcat7 /etc/init.d/tomcat7
update-rc.d tomcat7 defaults
/etc/init.d/tomcat7 restart

# signal a successful provision
touch ${DONEFILE}
