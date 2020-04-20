#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -n "ClientInstalling"

cd /tmpDownload
wget https://github.com/badaix/snapcast/releases/download/v0.19.0/snapclient_0.19.0-1_armhf.deb
dpkg -i snapclient_0.19.0-1_armhf.deb
sudo apt-get -f install
