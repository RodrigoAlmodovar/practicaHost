#!/bin/bash

Install apache2
echo Installing Apache2 and configuring it...
apt-get install apache2
chown -R $USER:$USER /var/www
#cat /etc/apache2/envvars | tr 'www-data' '$USER'