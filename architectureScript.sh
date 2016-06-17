#!/bin/bash

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

function createSites {
	while [  $COUNTER -lt 41 ]; do
		mkdir /var/www/html/practicaHost 2> /dev/null
   		pageContent > /var/www/html/practicaHost/"$COUNTER".html    	
    	let COUNTER=COUNTER+1 
	done
}

function createVirtualHost {
	echo "
		<VirtualHost *:80>
			DocumentRoot 'var/www/html/practicaHost'
 			ServerName app.localhost
 			ProxyRequests Off

 			<Proxy *>
 				Order deny, allow
 				Allow from all
 			</Proxy>
	 		<Location />
	 			ProxyPass http://localhost:58080/
	 			ProxyPassReverse http://localhost:58080/
	 		</Location>
	 	</VirtualHost>
	" > /etc/apache2/sites-available/practicaHost.conf
}

#Variables declaration
COUNTER=1


# #Install apache2
# echo Installing Apache2 and configuring it...
# sudo apt-get install apache2
# sudo chown -R $USER:$USER /var/www
# cat /etc/apache2/envvars | tr 'www-data' '$USER'

#Crear VirtualHost
createVirtualHost

#Crear sites
createSites
