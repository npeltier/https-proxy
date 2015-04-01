#!/bin/bash

DEFAULT_IP=192.168.33.33
DEFAULT_PORT=4503
function usage() {
	echo usage: $0 options
	echo This script runs an https proxy pointing to your local host, at a given port
	echo OPTIONS:
	echo	-u     Show this message
	echo	-h     the host name of the proxy \(no default\)
	echo	-i     the ip of the proxy \(has to be available, default $DEFAULT_IP\)
	echo	-p     port on which this proxy should point to \(default $DEFAULT_PORT\)
}

export PROXY_IP=$DEFAULT_IP
export LOCAL_PORT=$DEFAULT_PORT
while getopts ':u:h:i:p:' OPTION
do
     case $OPTION in
         u)
             usage
             exit 1
             ;;
         h)
             export HOST_NAME=$OPTARG
             ;;
         i)
             export PROXY_IP=$OPTARG
             ;;
         p)
             export LOCAL_PORT=$OPTARG
             ;;
         ?)
             usage
             exit 1
             ;;
     esac
done
if [ -z $HOST_NAME ]; then
  echo no valid hostname provided
	usage
	exit 1
fi
echo removing existing settings
sed -i /#proxy-setup$/d /etc/hosts
echo deleting actual vm
vagrant destroy
echo setting up https://$HOST_NAME \(ip: $PROXY_IP\)=\> http\:\/\/localhost\:$LOCAL_PORT...
echo $PROXY_IP	$HOST_NAME \#proxy-setup>> /etc/hosts
vagrant up --destroy-on-error
