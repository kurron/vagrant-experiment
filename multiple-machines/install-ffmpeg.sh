#!/usr/bin/env bash

DONEFILE=/var/vagrant-ffmpeg

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing FFmpeg..."
aptitude install -y python-software-properties
aptitude remove -y ffmpeg 

add-apt-repository -y ppa:jon-severinsson/ffmpeg
aptitude update 
aptitude install -y ffmpeg

# signal a successful provision
touch ${DONEFILE}
