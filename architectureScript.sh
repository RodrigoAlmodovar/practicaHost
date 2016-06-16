#!/bin/bash


function pageContent {
	echo el contador es $COUNTER
}
function createSites {
	while [  $COUNTER -lt 41 ]; do
   		pageContent > /var/www/html/"$COUNTER".html    	
    	let COUNTER=COUNTER+1 
	done
}

#Variables declaration
COUNTER=0


#Install Apache
#sudo apt-get install apache2


#Crear VirtualHost


#Crear sites
createSites



# <VirtualHost *:80>
# 	ServerName app.localhost
# 	ProxyRequests Off
	
# 	<Proxy *>
# 		Order deny, allow
# 		Allow from all
# 	</Proxy>

# 	<Location />
# 		ProxyPass http://localhost:58080/
# 		ProxyPassReverse http://localhost:58080/
# 	</Location>
# </VirtualHost>