#!/bin/bash -e


sudo apt-get update

sudo apt install git uild-essential xmltoman autoconf automake libtool libdaemon-dev libpopt-dev libconfig-dev avahi-daemon libavahi-client-dev libssl-dev libmbedtls-dev libsoxr-dev libsndfile1-dev

mkdir ~/downloads
cd ~/downloads 

git clone https://github.com/nicokaiser/rpi-audio-receiver
git clone https://github.com/mikebrady/shairport-sync
wget https://github.com/badaix/snapcast/releases/download/v0.19.0/snapserver_0.19.0-1_armhf.deb

read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

CURRENT_PRETTY_HOSTNAME=$(hostnamectl status --pretty)
read -p "DisplayName [${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}]: " PRETTY_HOSTNAME
sudo hostnamectl set-hostname --pretty "${PRETTY_HOSTNAME:-${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}}"

echo "Updating packages"
sudo apt update
sudo apt upgrade -y

echo "Installing components"
sudo ./install-bluetooth.sh
sudo ./install-shairport.sh
sudo ./install-snapcast-client.sh
sudo ./install-startup-sound.sh

