#!/bin/bash
echo "
		<VirtualHost *:80>
			DocumentRoot var/www/html/practicaHost
 			ServerName practicaHost.localHost 		
	 	</VirtualHost>
	" > /etc/apache2/sites-available/practicaHost.conf
	a2ensite apache2 practicaHost.conf
	service apache2 reload