#!/bin/bash
echo $(date)
echo "----------------------------------"
echo "Main Menu"
echo "----------------------------------"

while [ true ]
do
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
	case $OPT in
		1)
			echo "----------------------------------"
			echo "  System Information"
			echo "----------------------------------"
			echo "Operating System: " $(uname)
			lsb_release -a
		;;
		2)
			echo "----------------------------------"
			echo "  Hostname and DNS info"
			echo "----------------------------------"
			echo "Hostname : $(hostname)"
			echo "DNS domain : $(hostname -d)"
			echo "Fully qualified domain name: $(hostname -f)"
			echo "Network address (IP) : $(hostname -I)"
			echo "DNS name servers (DNS IP) : $(hostname -id)"
		;;
		3)
			echo "----------------------------------"
			echo "  Network information"
			echo "----------------------------------"
			echo "Total network interfaces found: $(ls -A /sys/class/net | wc -l)"
			echo "*** TP Addresses Information ***"
			ip a
			echo "***********************"
			echo "*** Network routing ***"
			echo "***********************"
			netstat -nr
			echo "*************************************"
			echo "*** Interface traffic information ***"
			echo "*************************************"
			netstat -i
		;;	
		4)
			echo "----------------------------------"
			echo "  Who is online"
			echo "----------------------------------"
			who | awk '{print $1","$2","$3" "$4","$5}' | column -s"," -t -N NAME,LINE,TIME,COMMENT

		;;
		5) 
			echo "----------------------------------"
			echo "  List of last logged in users"
			echo "----------------------------------"
			last
		;;
		6) 
			echo "----------------------------------"
			echo "  Public IP Information"
			echo "----------------------------------"
			dig +short myip.opendns.com @resolver1.opendns.com
		;;
		7) 
			echo "----------------------------------"
			echo "  Disk Usage Info"
			echo "----------------------------------"
			df --output=pcent,source | sed 1d | sort -n
		;;
		8) 
			echo "----------------------------------"
			echo "  My home file-tree"
			echo "----------------------------------"
			echo "Generating file tree, please wait..."
			sh ./proj1.sh
			echo "File tree successfully saved to filetree.html"
		;;
		9) 
			sh ./proc.sh
		;;
		10) 
			break
		;;
		*)
			echo "Invalid Option"
		;;
	esac
	
	if [ $OPT -eq 9 ]  
	then 
		echo "----------------------------------"
		echo "Main Menu"
		echo "----------------------------------"
	elif [ $OPT -ne 10 ] 
	then
		read -r -s -p $'Press [Enter] key to continue...'
		echo ""
	fi
done

