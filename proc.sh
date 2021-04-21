#!/bin/bash

#Submenu script for process operations
echo "----------------------------------"
echo "Sub Menu"
echo "----------------------------------"
#infinite loop
while [ true ]
do
	#Displays the process options
	echo "(please enter the number of your selections below)"
	echo ""
	echo "1. Show all processes"
	echo "2. Kill a process"
	echo "3. Bring up top"
	echo "4. Return to Main Menu"
	read SELECT
	case $SELECT in
		1)
			#Displays the current processes 
			ps -ef
		;;
		2)
			#prompts user for pid to kill and kills that process
			echo "Please enter the PID of the process you would like to kill: "
			read pid
			kill $pid
		;;
		3)
			#Displays the top processes
			top
		;;	
		4)
			#Leaves the submenu and returns to main menu
			break
		;;
		*)
			#Invalid Option
			echo "Invalid Option"
		;;
	esac
done
