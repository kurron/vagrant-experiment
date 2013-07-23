#!/usr/bin/env bash


DONEFILE=/var/vagrant-redis
CACHE=/vagrant/file-cache
ARCHIVE=redis.tar.gz
TARGET=/usr/lib/redis
REDIS=${TARGET}/redis

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Redis..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
    echo "Redis archive already cached. Not downloading." 
else
    echo "Downloading Redis..."
    wget --quiet --output-document=${CACHE}/${ARCHIVE} http://redis.googlecode.com/files/redis-2.6.14.tar.gz 
fi

mkdir -p ${TARGET}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${TARGET}
cd ${TARGET} ; ln -s redis-2.6.14 redis ; ls -lh

aptitude install -y tcl
cd ${REDIS} ; make ; make test
ln -s ${REDIS}/src/redis-benchmark /usr/local/bin
ln -s ${REDIS}/src/redis-check-aof /usr/local/bin
ln -s ${REDIS}/src/redis-check-dump /usr/local/bin
ln -s ${REDIS}/src/redis-cli /usr/local/bin
ln -s ${REDIS}/src/redis-sentinel /usr/local/bin
ln -s ${REDIS}/src/redis-server /usr/local/bin
ls -lh /usr/local/bin

mkdir -p /etc/redis
cp /vagrant/redis.conf /etc/redis
cp /vagrant/redis-server /etc/init.d
/etc/init.d/redis-server restart

#aptitude install -y redis-server
#aptitude install -y redis-doc

# signal a successful provision
touch ${DONEFILE} 
