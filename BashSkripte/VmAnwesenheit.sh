#!/bin/bash
#test ob Rocky da ist 
rocky=$(ping -c 12 192.168.190.140 | wc -l)
#test ob CentOS da ist
cent=$(ping -c 12 192.168.190.131 | wc -l)
#test ob ArchLinux da ist
arch=$(ping -c 12 192.168.190.137 | wc -l)


if [[ $rocky -gt 7  ]];then 
	echo "Die Rocky-Linux VM ist erreichbar"
else
	echo "Die Rocky-Linux VM ist nicht erreichbar"
fi

if [[ $cent -gt 7  ]];then 
	echo "Die CentOS-Linux VM ist erreichbar"
else
	echo "Die CentOS-Linux VM ist nicht erreichbar"
fi

if [[ $arch -gt 7  ]];then 
	echo "Die Arch-Linux VM ist erreichbar"
else
	echo "Die Arch-Linux VM ist nicht erreichbar"
fi


