#!/bin/bash

#display the date and main menu
echo $(date)
echo "----------------------------------"
echo "Main Menu"
echo "----------------------------------"

#infinite loop
while [ true ]
do
	#Display Menu Options
	echo "1. Operating system info"
	echo "2. Hostname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. My IP address"
	echo "7. My disk usage"
	echo "8. My home file-tree"
	echo "9. Proccess operations"
	echo "10. Exit"
	echo -n "Enter your choice [ 1 - 10 ] "
	read OPT
	#read in the option chosen
	case $OPT in
		1)
			#System Information: Displays operating system and lsb release
			echo "----------------------------------"
			echo "  System Information"
			echo "----------------------------------"
			echo "Operating System: " $(uname)
			lsb_release -a
		;;
		2)
			#Hostname and DNS Info
			echo "----------------------------------"
			echo "  Hostname and DNS info"
			echo "----------------------------------"
			#Display hostname, dnsdomain name, and fully qualified domain name
			echo "Hostname : $(hostname)"
			echo "DNS domain : $(dnsdomainname)"
			echo "Fully qualified domain name: $(hostname -f)"
			#Network address and dns name server
			echo "Network address (IP) : $(hostname -i)"
			echo "DNS name servers (DNS IP) : $(hostname -id)"
		;;
		3)
			#Network information
			echo "----------------------------------"
			echo "  Network information"
			echo "----------------------------------"
			#Display total network interfaces
			echo "Total network interfaces found: $(ls -A /sys/class/net | wc -l)"
			#Display TP Address Info
			echo "*** TP Addresses Information ***"
			ip addr show
			#Display network routing table
			echo "***********************"
			echo "*** Network routing ***"
			echo "***********************"
			netstat -rnf
			#Display interface trafic information 
			echo "*************************************"
			echo "*** Interface traffic information ***"
			echo "*************************************"
			netstat -i
		;;	
		4)
			#Who is online
			echo "----------------------------------"
			echo "  Who is online"
			echo "----------------------------------"
			#displays who is online in a good format
			who | awk '{print $1","$2","$3" "$4","$5}' | column -s"," -t -N NAME,LINE,TIME,COMMENT

		;;
		5) 
			#Display list of last logged in users
			echo "----------------------------------"
			echo "  List of last logged in users"
			echo "----------------------------------"
			last
		;;
		6) 
			#Display public IP information
			echo "----------------------------------"
			echo "  Public IP Information"
			echo "----------------------------------"
			dig +short myip.opendns.com @resolver1.opendns.com
		;;
		7) 
			#Display Disk Usage Info
			echo "----------------------------------"
			echo "  Disk Usage Info"
			echo "----------------------------------"
			df --output=pcent,target | sed 1d | sort -n
		;;
		8) 
			#Generate filetree.html, a file tree of the home directory to the current directory
			echo "----------------------------------"
			echo "  My home file-tree"
			echo "----------------------------------"
			echo "Generating file tree, please wait..."
			sh ./proj1.sh
			echo "File tree successfully saved to filetree.html"
		;;
		9) 
			#Runs the submenu for process operations
			sh ./proc.sh
		;;
		10) 
			#Exits the program
			break
		;;
		*)
			#Invalid option
			echo "Invalid Option"
		;;
	esac
	
	#If a process operation, display main menu
	if [ $OPT -eq 9 ]  
	then 
		echo "----------------------------------"
		echo "Main Menu"
		echo "----------------------------------"
	#if not quit, then require a return press to continue
	elif [ $OPT -ne 10 ] 
	then
		read -r -s -p $'Press [Enter] key to continue...'
		echo ""
	fi
done

