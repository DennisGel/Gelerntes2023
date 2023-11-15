#!/bin/bash
echo -e "Mit welcher VM möchten Sie sich verbinden?\nCentOS(1)\nArch-Linux(2)\nEin anders,Nutzername und IP werden benötigt(3)"
read auswahl

case $auswahl in
	1)
	ssh denniscentos@192.168.190.131
	;;
	2)
	ssh duda@192.168.190.135
	;;
	3)
	echo "Wie lautet der Nutzername?"
	read nutzer
	echo "Wie autet die IP"
	read ip
	ssh $nutzer@$ip
	;;
	*)
	echo "Ihre eingabe ist ungültig"
	;;
esac
