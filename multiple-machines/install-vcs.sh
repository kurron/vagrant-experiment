#!/usr/bin/env bash

DONEFILE=/var/vagrant-vcs

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Git..."
aptitude install -y git git-doc git-man gitk 

echo "Installing Mercurial..."
aptitude install -y mercurial 

echo "Installing Subversion..."
aptitude install -y subversion subversion-tools 

# signal a successful provision
touch ${DONEFILE}
