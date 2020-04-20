#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo  "ShairportInstalling"
cd /tmpDownload
git clone https://github.com/mikebrady/shairport-sync
cd /tmpDownloads/shairport-sync
autoreconf -i -f
./configure --with-stdout --with-avahi --with-ssl=openssl --with-metadata
make
sudo make install

cat <<EOF > "/etc/shairport-sync.conf"
general = {
  name = "AirPi";
};
EOF
