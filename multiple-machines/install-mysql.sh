#!/usr/bin/env bash

DONEFILE=/var/vagrant-mysql

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing MySQL Server..."
export DEBIAN_FRONTEND=noninteractive
aptitude install -y mysql-server 
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
restart mysql
mysql -uroot mysql <<< "GRANT ALL ON *.* TO 'root'@'%'; FLUSH PRIVILEGES;"

# signal a successful provision
touch ${DONEFILE}
