#!/bin/bash


if 	! ps cax | grep -q ntpd
	
	then
	echo -e "\nNOTICE: ntp is not running"
	sudo /usr/sbin/service ntp start

fi


if [ $(diff /etc/ntp.conf.bak /etc/ntp.conf | wc -c)  -ne 0 ]

	then
	echo -e "\nNOTICE: /etc/ntp.conf was changed. Calculated diff:\n`diff -U 0 /etc/ntp.conf.bak /etc/ntp.conf`"
	sudo cp -f /etc/ntp.conf.bak /etc/ntp.conf
	sudo /usr/sbin/service ntp restart

fi

exit 0

