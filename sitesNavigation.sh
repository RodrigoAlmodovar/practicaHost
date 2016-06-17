#!/bin/bash
#Reinitiate the apache server log purposes
service apache2 reload
COUNTER=0
while [ $COUNTER -lt 42 ]; do
	curl -s localhost/practicaHost/"$COUNTER".html > /dev/null #Cambiar a practicahost.localhost... para que use el virtual host. No funciona
	let COUNTER=COUNTER+1
done

#Checking the error
cat /var/log/apache2/access.log | tail -f | grep "404" > ./404.log