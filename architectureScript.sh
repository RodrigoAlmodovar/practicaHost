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
			DocumentRoot var/www/html/practicahost
 			ServerName practicahost.localHost 		
	 	</VirtualHost>
	" > /etc/apache2/sites-available/practicaHost.conf
	a2ensite apache2 practicaHost.conf
	service apache2 reload
}

function navigateSites {
	COUNTER=0
	while [ $COUNTER -lt 42 ]; do
		curl -s localhost/practicaHost/"$COUNTER".html #Cambiar a practicahost.localhost... para que use el virtual host. No funciona
		let COUNTER=COUNTER+1
	done	

}
#Variables declaration
COUNTER=1


# #Install apache2
# echo Installing Apache2 and configuring it...
# sudo apt-get install apache2
# sudo chown -R $USER:$USER /var/www
# cat /etc/apache2/envvars | tr 'www-data' '$USER'

#Crear VirtualHost
#createVirtualHost


#Crear sites
createSites