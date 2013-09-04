# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 27107, host: 27107 

  config.vm.network :private_network, ip: "10.8.0.15"

  # config.vm.network :public_network

  config.ssh.forward_agent = true

  config.vm.synced_folder "./www", "/var/www"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "./manifests"
    puppet.manifest_file  = "init.pp"
    puppet.module_path = "./modules"
  end
end
