# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "3scale/docker"
	config.vm.provision "shell", path:"bootstrap.sh", args:["#{ENV['HOST_NAME']}","#{ENV['LOCAL_PORT']}"]
	config.vm.synced_folder ".", "/vagrant"
  	config.vm.network "private_network", ip: "#{ENV['PROXY_IP']}"
	config.vm.network "forwarded_port", guest: 443, host:443
end
