#!/bin/bash

#Variables declaration
COUNTER=1


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
	echo "Creating the 40 sites..."
	while [  $COUNTER -lt 41 ]; do
		mkdir /var/www/html/practicaHost 2> /dev/null
		pageContent > /var/www/html/practicaHost/"$COUNTER".html    	
	   	let COUNTER=COUNTER+1 
	done
	echo "DONE!"
}

function createVirtualHost {
	echo "
		<VirtualHost *:80>
			DocumentRoot /var/www/html/practicaHost
 			ServerName practicahost.localhost																			 		
	 	</VirtualHost>
	" > /etc/apache2/sites-available/practicaHost.conf
	a2ensite practicaHost.conf
	service apache2 reload
	echo "VirtualHost created and ready to be used!"
}

function navigateSites {
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
}



# #Install apache2
# echo "Installing Apache2 and configuring it..."
# apt-get install apache2
# chown -R $USER:$USER /var/www
# sed "5i\127.0.0.1\tpracticahost.localhost" /etc/hosts
# #cat /etc/apache2/envvars | tr 'www-data' '$USER'
# echo "DONE!"

#Crear VirtualHost
#createVirtualHost


#Crear sites
#createSites

#Navigate sites
#navigateSites