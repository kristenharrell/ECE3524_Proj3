#!/bin/bash

echo "----------------------------------"
echo "Sub Menu"
echo "----------------------------------"
while [ true ]
do
	echo "(please enter the number of your selections below)"
	echo ""
	echo "1. Show all processes"
	echo "2. Kill a process"
	echo "3. Bring up top"
	echo "4. Return to Main Menu"
	read SELECT
	case $SELECT in
		1)
			ps -eF
		;;
		2)
			echo "Please enter the PID of the process you would like to kill: "
			read pid
			kill $pid
		;;
		3)
			top
		;;	
		4)
			break
		;;
		*)
			echo "Invalid Option"
		;;
	esac
done
