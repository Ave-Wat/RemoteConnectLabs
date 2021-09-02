#!/bin/bash

#pass in parameters such that: bash sshAll.sh -c [file/folder to copy] -s [script to run]

while getopts c:s: flag
do
	case "${flag}" in
		c) copyPath=${OPTARG};;
		s) scriptPath=${OPTARG};;
	esac
done

echo $copyPath
echo $scriptPath

function makeConnection () {
	hostname=$1

	if ! [ -z "$copyPath" ]
	then
		scp -r $copyPath mathcsadmin@$hostname.mathcs.carleton.edu:~ 
	fi
	
	if ! [ -z "$scriptPath" ]
	then
		ssh mathcsadmin@$hostname.mathcs.carleton.edu sudo -S bash $scriptPath
	else
		ssh mathcsadmin@$hostname.mathcs.carleton.edu
	fi  
}


#roomNames=("olin208" "olin302" "olin304" "olin308" "olin310" "olin312")
#numOfComputers=(3 3 9 10 24 7)

#these are shortened lists for testing
roomNames=("olin308")
numOfComputers=(2)

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

