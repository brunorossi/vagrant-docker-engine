# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

	config.vm.box = "geerlingguy/centos7"
  
	# config.vm.network "forwarded_port", guest: 80, host: 8080

	# config.vm.network "private_network", ip: "192.168.50.5"
	# config.vm.network :hostonly, "192.168.50.4", :adapter => 2    
	config.vm.network "public_network"  

	config.vm.provider "virtualbox" do |vb|
		vb.gui = true
		vb.memory = "2048"
		vb.name = "docker-dev"
		vb.cpus = 2
	end  

	config.vm.provision "shell", path: "provisioners/bash/bootstrap.sh"  
  
	config.vm.synced_folder "docker-build", "/docker-build", create: true, mount_options: ["dmode=775,fmode=664"]  
  
    config.vm.box_check_update = true

	# config.push.define "atlas" do |push|
	#   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
	# end

end
