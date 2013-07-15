#!/usr/bin/env bash

DONEFILE=/var/vagrant-rabbitmq

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing RabbitMQ Server..."
aptitude install -y rabbitmq-server 

# signal a successful provision
touch ${DONEFILE}
