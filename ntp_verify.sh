#!/bin/bash



if [ `ps cax | grep ntpd | wc -l` -eq 0 ]
	
	then
	echo -e "\nNOTICE: ntp is not running"
	sudo service ntp start

fi


if [ $(diff /etc/ntp.conf /etc/ntp.conf.bak | wc -c)  -ne 0 ]

	then
	echo -e "\nNOTICE: /etc/ntp.conf was changed. Calculated diff:\n`diff -U 0 /etc/ntp.conf /etc/ntp.conf.bak`"
	sudo cp -f /etc/ntp.conf.bak /etc/ntp.conf
	sudo service ntp restart

fi

exit 0

