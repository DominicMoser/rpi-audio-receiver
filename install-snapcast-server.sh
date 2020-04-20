#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo  "SnapServerInstalling"

cd ~/downloads 
wget https://github.com/badaix/snapcast/releases/download/v0.19.0/snapserver_0.19.0-1_armhf.deb
dpkg -i snapserver_0.19.0-1_armhf.deb
sudo apt-get -f install
