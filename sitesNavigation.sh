#!/bin/bash
#Reinitiate the apache server log purposes
service apache2 reload > /dev/null
COUNTER=0

echo "Navigating the 41 sites..."
while [ $COUNTER -lt 42 ]; do
	curl -s practicahost.localhost/practicaHost/"$COUNTER".html > /dev/null #Cambiar a practicahost.localhost... para que use el virtual host. No funciona
	let COUNTER=COUNTER+1
done

echo "Logging the error for the 41th site..."
cat /var/log/apache2/access.log | tail -f | grep "404" > ./404.log
echo "DONE! Please check the 404.log file ;)"