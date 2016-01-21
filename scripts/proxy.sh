#!/bin/bash

if [[ `/sbin/iwconfig wlan0 | sed -e '/ESSID/!d' -e 's/.*ESSID:"/"/' -e 's/\"//g' | cut -d ' ' -f9` != "ESSID:off/any" ]]; then

	export ssid=`/sbin/iwconfig wlan0 | sed -e '/ESSID/!d' -e 's/.*ESSID:"/"/' -e 's/\"//g'`

	if [ `echo $ssid | grep -ic ssid` -eq 1 ] ; then
		http_proxy="http://proxy:port"
		https_proxy=$http_proxy
		HTTP_PROXY=$http_proxy
		HTTPS_PROXY=$http_proxy
	fi

	alias sudo='sudo env http_proxy=$http_proxy https_proxy=$https_proxy HTTP_PROXY=$HTTP_PROXY HTTPS_PROXY=$HTTPS_PROXY'

	alias wget='wget -e use_proxy=yes -e http_proxy=$http_proxy'

fi
