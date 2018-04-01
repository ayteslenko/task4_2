#!/bin/bash


dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


sudo apt-get -y install ntp

sudo sed -i '/^pool /d' /etc/ntp.conf

sudo sed -i '/more information/a \pool ua.pool.ntp.org iburst' /etc/ntp.conf

sudo cp /etc/ntp.conf /etc/ntp.conf.bak
sudo service ntp restart

echo "*/1 * * * * $dir/ntp_verify.sh MAILTO=root@localhost" | crontab -


exit 0

