#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -n "Do you want to install ServerUtils [y|N]"
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi

sudo ./install-bluetooth.sh
sudo ./install-shairport.sh
sudo ./install-snapcast-server.sh
sudo ./install-startup-sound.sh