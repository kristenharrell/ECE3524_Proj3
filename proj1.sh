#!/bin/sh

#Error Checking

#If the number of arguments in not 2, throw an error message and exit script
#if [ "$#" -ne 2 ]; then
 #  echo "Usage: Invalid Number of Arguments" 
 #  exit 1
#fi

#If the first parameter is not a directory, then throw an error message and exit script
#if ! [ -d "$1" ]; then
 #  echo "Usage: $1 is not a directory" 
  # exit 1
#fi

#Set parameter OUTPUT_FILE as second argument
OUTPUT_FILE=$(pwd)"/filetree.html"
echo -n "" > $OUTPUT_FILE
cd ~ 

#Recursively goes through each file and subdirectory, outputting to OUTPUT_FILE
recursiveFile () {
   #Only adds the file/directory if readable
   if [ -r "$1" ]; then
   	#If argument is file, then add clickable link to html output file
   	if [ -f "$1" ]; then
       	    echo "<li><a href=$1> $(basename $1) </a></li>" >> $OUTPUT_FILE
       	#If argument is directory, then add directory name to html output file
       	#and recursively go through the directory 
   	elif [ -d "$1" ]; then
   	    echo "<li> $(basename $1) </li>" >> $OUTPUT_FILE
   	    #Go through all files/subdirectories in directory 
       	    for f in $(find "$1" -maxdepth 1 -mindepth 1 | sort); do 
       	    	echo "<ul>"  >> $OUTPUT_FILE
       	    	#if file/directory exists, recursively call it
            	[ -e "$f" ] && recursiveFile "$f"
            	echo "</ul>" >> $OUTPUT_FILE
       	    done
        fi
  fi
}

#Recursively calls recursiveFile on first argument
recursiveFile $HOME 





       
