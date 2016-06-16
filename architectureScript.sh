#!/bin/bash



#Install Apache
#sudo apt-get install apache2


#Crear VirtualHost


#Crear sites
COUNTER=0
	while [  $COUNTER -lt 41 ]; do
    	echo El contador es $COUNTER > /var/www/html/"$COUNTER".html    	
        let COUNTER=COUNTER+1 
    done


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