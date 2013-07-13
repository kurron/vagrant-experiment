#!/usr/bin/env bash

# make sure we are idempotent
if [ -f "/var/vagrant_rabbitmq" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing RabbitMQ Server..."
aptitude install -y rabbitmq-server 

# signal a successful provision
touch /var/vagrant_rabbitmq
