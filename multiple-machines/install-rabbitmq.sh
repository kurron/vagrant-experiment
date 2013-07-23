#!/usr/bin/env bash

DONEFILE=/var/vagrant-rabbitmq

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing RabbitMQ Server..."
cd /tmp ; wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc ; apt-key add rabbitmq-signing-key-public.asc
echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
aptitude update
aptitude install -y rabbitmq-server 

# signal a successful provision
touch ${DONEFILE}
