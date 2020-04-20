#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo "Installing Shairport Sync"
cd ~/downloads/shairport-sync
autoreconf -i -f
./configure --with-stdout --with-avahi --with-ssl=openssl --with-metadata
make
sudo make install

cat <<EOF > "/etc/shairport-sync.conf"
general = {
  name = "${PRETTY_HOSTNAME}";
};
EOF
