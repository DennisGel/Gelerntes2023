#!/bin/bash

for datei in $# 
do
if [[ -f $datei ]];then
	chmod 700 $datei
	logger "Rechte von $datei wurden geändert"
elif [[ -d $datei ]];then
	chmod 741 $datei
	logger "Rechte von $datei wurden geändert"
else
	echo "Der von Ihnen angegebene Parameter entspricht keiner gültigen Eingabe"
fi
done
