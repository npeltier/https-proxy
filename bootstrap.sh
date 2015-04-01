#!/bin/bash
echo setting up proxy https://$1 -> host:$2
cat /vagrant/nginx.repo >> /etc/apt/sources.list
apt-get -y --force-yes update && apt-get -y --force-yes install nginx
cp /vagrant/nginx.conf -f /etc/nginx/nginx.conf
sed -i.bak -e s/HOST_NAME/$1/g -e s/HOST_IP/10.0.2.2/g -e s/LOCAL_PORT/$2/g /etc/nginx/nginx.conf
openssl req -nodes -x509 -newkey rsa:4096 -keyout /ssl.key -out /ssl.crt -days 356 -subj "/C=US/ST=Oregon/L=Portland/O=IT/CN=$1"
nginx -s reload
