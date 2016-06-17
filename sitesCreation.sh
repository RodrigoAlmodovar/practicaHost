#!/bin/bash

#Variable declaration
COUNTER=1

#functions
function pageContent {

	case $COUNTER in
     1)
        echo "	
			<div>
				This is the site number $COUNTER
			</div> 
			<a href='$(($COUNTER+1)).html'> Next </a>
		"
     ;;
     40)
        echo "	
			<div>
				This is the site number $COUNTER
			</div>
			<a href='$(($COUNTER-1)).html'> Previous </a>
		"
     ;;
     *)
        echo "	
			<div>
				This is the site number $COUNTER
			</div>
			<a href='$(($COUNTER-1)).html'> Previous </a> 
			<a href='$(($COUNTER+1)).html'> Next </a>
		"
     ;;
  esac
}

echo "Creating the 40 sites..."
while [  $COUNTER -lt 41 ]; do
	mkdir /var/www/html/practicaHost 2> /dev/null
	pageContent > /var/www/html/practicaHost/"$COUNTER".html    	
   	let COUNTER=COUNTER+1 
done
echo "DONE!"