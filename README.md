# https-proxy
proxies a https://hotsname to a local server
- using vagrant to host a debian VM with nginx
- generate self-signed certificate assigned to hostname
- modifies your /etc/hosts to use the VM ip to mock the hostname

## requirements
for this to run, you need: 
- unix (only tested on mac so far)
- vagrant [0] and VirtualBox [1], even if it should work with another provider

[0] https://www.vagrantup.com/downloads.html

[1] http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html

## usage
```
usage: ./setup-proxy.sh options

This script runs an https proxy pointing to your local host, at a given port

OPTIONS:
 -u Show this message
 -h the host name of the proxy (no default)
 -i the ip of the proxy (has to be available, default 192.168.33.33)
 -p port on which this proxy should point to (default 4503)
```
