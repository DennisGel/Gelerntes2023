#!/bin/bash
#test ob die Datei bereits geprüft wurde
test=$(grep $1 ~/infosZuDateien.txt 2>> /dev/null | wc -l 2>> /dev/null)

#Prüfung ob sie geprüft worden ist
if [[ $test == 0 ]];then

#wenn nein dan in datei schreiben und auf Konsole ausgeben	
	stat $1 >> ~/infosZuDateien.txt
	stat $1
else 

#wenn schon vorganden dan folgt prüfung ob diese seid der letzten Prüfung Modifiziert wurde 
#stat auf die datei und es wird nach dem Eintrag Modiffiziert gesucht
	data=$(stat $1 | grep Modif | cut -d 't' -f2 2>> /dev/null)

#suche ob der Timestamp bereits in der Protokolldatei existiert
  	hist=$(grep $data ~/infosZuDateien.txt 2>> /dev/null)

	if [[ $hist == 1 ]];then
#Ausgabestring falls sie nicht geändert wurde
		echo "Die Datei $1 wurde bereits geprüft und wurde seit dem letzten Prüfen nicht geändert"
	else
#Ausgabestring falls sie geändert wurde
			echo "Die Datei $1 wurde bereits geprüft, aber sie wurde geändert"
	fi
fi
