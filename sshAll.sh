#!/bin/bash
#run script as root
#need flash drive plugged in

function makeConnection () {
	hostname=$1
	#scp -r /Volumes/LEGACYBOOT/Imaging2021/WindowsBootApp/RemoteWindowsBootAppInstaller/InstallPackage mathc        sadmin@$hostname.mathcs.carleton.edu:~
	ssh mathcsadmin@$hostname.mathcs.carleton.edu #sudo -S bash WindowsBootAppInstaller.sh  
}

#roomNames=("olin208" "olin302" "olin304" "olin308" "olin310" "olin312")
#numOfComputers=(3 3 9 10 24 7)
roomNames=("olin302" "olin310")
numOfComputers=(3 2)

for j in ${!roomNames[@]};
do
	name=${roomNames[$j]}
	for ((i = 1 ; i <= ${numOfComputers[$j]} ; i ++ ))
	do
		hostname="$name-$i"
		if (( $i < 10 ))
		then
			hostname="$name-0$i"
		fi
		echo $hostname
		makeConnection $hostname	
	done
done

#non-regular names
computerNames=("olin310-IS")
for name in ${computerNames[@]};
do
	echo $name
	makeConnection $name
done

