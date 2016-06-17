#!/bin/bash
echo "
		<VirtualHost *:80>
			DocumentRoot /var/www/html/practicaHost
 			ServerName practicahost.localhost																			 		
	 	</VirtualHost>
	" > /etc/apache2/sites-available/practicaHost.conf
	a2ensite practicaHost.conf
	service apache2 reload
echo "VirtualHost created and ready to be used!"