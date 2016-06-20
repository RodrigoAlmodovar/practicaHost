#!/bin/bash
#Reinitiate the apache server log purposes
service apache2 start > /dev/null 2> /dev/null
COUNTER=0

echo "Navigating the 41 sites..."
while [ $COUNTER -lt 42 ]; do
	curl -s practicahost.localhost/practicaHost/"$COUNTER".html > /dev/null
	let COUNTER=COUNTER+1
done

echo "Logging the error for the 41th site..."
cat /var/log/apache2/access.log | tail -f | grep "404" > ./404.log
echo "DONE! Please check the 404.log file ;)"
service apache2 stop > /dev/null