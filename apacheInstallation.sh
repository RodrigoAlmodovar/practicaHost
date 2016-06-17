#!/bin/bash

echo "Installing Apache2 and configuring it..."
apt-get install apache2
chown -R $USER:$USER /var/www
#cat /etc/apache2/envvars | tr 'www-data' '$USER'
sed "5i\127.0.0.1\tpracticahost.localhost" /etc/hosts
echo "DONE!"