#!/bin/bash -e


sudo apt-get update



mkdir /tmpDownload



read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

CURRENT_PRETTY_HOSTNAME=$(hostnamectl status --pretty)
read -p "DisplayName [${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}]: " PRETTY_HOSTNAME
sudo hostnamectl set-hostname --pretty "${PRETTY_HOSTNAME:-${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}}"

echo "Updating packages"
sudo apt update
sudo apt upgrade -y

sudo apt install git build-essential xmltoman autoconf automake libtool libdaemon-dev libpopt-dev libconfig-dev avahi-daemon libavahi-client-dev libssl-dev libmbedtls-dev libsoxr-dev libsndfile1-dev -y



echo "Installing components"

sudo ./install-server.sh

sudo ./install-snapcast-client.sh


rm -r /tmpDownload