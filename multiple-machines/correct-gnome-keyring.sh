#!/usr/bin/env bash

DONEFILE=/var/vagrant-correct-gnome-keyring

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
KEYRING=/etc/xdg/autostart/gnome-keyring-pkcs11.desktop

echo "Correcting GNOME Keyring..."
sed -i 's/OnlyShowIn=GNOME;Unity;/OnlyShowIn=GNOME;Unity;XFCE;/g' ${KEYRING}

cat ${KEYRING}

# signal a successful provision
touch ${DONEFILE}
