#!/bin/bash
let nutzeranzahl=$(who -q| tr ' ' '\n' | sort -u |wc -l)
let anzahlnutzer=$nutzeranzahl-2
nutzer=$(who -q| tr ' ' '\n' | sort -u | tail -$anzahlnutzer )

for x in $nutzer
do

	echo "Das Heimatverzeichnis des Nutzers: $x ist /home/$x"

done

