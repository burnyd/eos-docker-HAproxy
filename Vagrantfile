# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
config.vm.box = "vEOS-20-eft-3"
config.ssh.insert_key = false

  config.vm.define "leaf1a" do |leaf1a|
    leaf1a.vm.provision "shell", path: "scripts/leaf1a.sh"
    leaf1a.vm.network "private_network",  virtualbox__intnet: 'MGT-10.0.0.0', auto_config: false
    leaf1a.vm.network "private_network",  virtualbox__intnet: 'leaf1a-spine1-', auto_config: false
    leaf1a.vm.network "private_network",  virtualbox__intnet: 'leaf1a-spine2-', auto_config: false
    leaf1a.vm.network "private_network",  virtualbox__intnet: 'leaf1a-leaf1b-', auto_config: false
    leaf1a.vm.network "private_network",  virtualbox__intnet: 'leaf1a-host1', auto_config: false
    leaf1a.vm.network "private_network",  virtualbox__intnet: 'leaf1a-host2', auto_config: false


  leaf1a.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
      v.customize ["modifyvm", :id, "--memory", 2048]
  leaf1a.vm.network :"forwarded_port", guest: 8080, host: 8080
  leaf1a.vm.network :"forwarded_port", guest: 8888, host: 8888

    end

    end

 config.vm.define "leaf1b" do |leaf1b|
    leaf1b.vm.provision "shell", path: "scripts/leaf1b.sh"
    leaf1b.vm.network "private_network",  virtualbox__intnet: 'MGT-10.0.0.0', auto_config: false
    leaf1b.vm.network "private_network",  virtualbox__intnet: 'leaf1b-spine1-', auto_config: false
    leaf1b.vm.network "private_network",  virtualbox__intnet: 'leaf1b-spine2-', auto_config: false
    leaf1b.vm.network "private_network",  virtualbox__intnet: 'leaf1a-leaf1b-', auto_config: false
    leaf1b.vm.network "private_network",  virtualbox__intnet: 'leaf1b-host1', auto_config: false

  leaf1b.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
    end

    end

 config.vm.define "leaf2a" do |leaf2a|
    leaf2a.vm.provision "shell", path: "scripts/leaf2a.sh"
    leaf2a.vm.network "private_network",  virtualbox__intnet: 'MGT-10.0.0.0', auto_config: false
    leaf2a.vm.network "private_network",  virtualbox__intnet: 'leaf2a-spine1-', auto_config: false
    leaf2a.vm.network "private_network",  virtualbox__intnet: 'leaf2a-spine2-', auto_config: false
    leaf2a.vm.network "private_network",  virtualbox__intnet: 'leaf2a-leaf1b-', auto_config: false

  leaf2a.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
    end

    end

  config.vm.define "leaf2b" do |leaf2b|
    leaf2b.vm.provision "shell", path: "scripts/leaf2b.sh"
    leaf2b.vm.network "private_network",  virtualbox__intnet: 'MGT-10.0.0.0', auto_config: false
    leaf2b.vm.network "private_network",  virtualbox__intnet: 'leaf2b-spine1-', auto_config: false
    leaf2b.vm.network "private_network",  virtualbox__intnet: 'leaf2b-spine2-', auto_config: false
    leaf2b.vm.network "private_network",  virtualbox__intnet: 'leaf2b-leaf1b-', auto_config: false
 

  leaf2b.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
    end

    end

  config.vm.define "spine1" do |spine1|
    spine1.vm.provision "shell", path: "scripts/spine1.sh"
    spine1.vm.network "private_network",  virtualbox__intnet: 'MGT-10.0.0.0', auto_config: false
    spine1.vm.network "private_network",  virtualbox__intnet: 'leaf1a-spine1-', auto_config: false
    spine1.vm.network "private_network",  virtualbox__intnet: 'leaf1b-spine1-', auto_config: false
    spine1.vm.network "private_network",  virtualbox__intnet: 'leaf2a-spine1-', auto_config: false
    spine1.vm.network "private_network",  virtualbox__intnet: 'leaf2b-spine1-', auto_config: false
    spine1.vm.network "private_network",  virtualbox__intnet: 'gobgp-spine1-', auto_config: false

  spine1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]

    end

    end

  config.vm.define "spine2" do |spine2|
    spine2.vm.provision "shell", path: "scripts/spine2.sh"
    spine2.vm.network "private_network",  virtualbox__intnet: 'MGT-10.0.0.0', auto_config: false
    spine2.vm.network "private_network",  virtualbox__intnet: 'leaf1a-spine2-', auto_config: false
    spine2.vm.network "private_network",  virtualbox__intnet: 'leaf1b-spine2-', auto_config: false
    spine2.vm.network "private_network",  virtualbox__intnet: 'leaf2a-spine2-', auto_config: false
    spine2.vm.network "private_network",  virtualbox__intnet: 'leaf2b-spine2-', auto_config: false
    spine2.vm.network "private_network",  virtualbox__intnet: 'gobgp-spine2-', auto_config: false

  spine2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]

    end

    end

  config.vm.define "mgt1" do |mgt1|
    mgt1.vm.box = "ubuntu/trusty64"
    mgt1.vm.hostname = "mgt1"
    mgt1.vm.provision "shell", path: "scripts/mgt1.sh"
    mgt1.vm.network "private_network", ip: "10.0.0.15",
    virtualbox__intnet: "MGT-10.0.0.0"

  mgt1.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "4096"]
  end

    mgt1.vm.network :"forwarded_port", guest: 80, host: 8088
    mgt1.vm.network "forwarded_port", guest: 5601, host: 5601
  end

  config.vm.define "host1" do |host1|
    host1.vm.box = "ubuntu/trusty64"
    host1.vm.hostname = "host1"
    host1.vm.provision "shell", path: "scripts/host1.sh"
    host1.vm.network "private_network",  virtualbox__intnet: 'leaf1a-host1', auto_config: false
   end

  config.vm.define "host2" do |host2|
    host2.vm.box = "ubuntu/trusty64"
    host2.vm.hostname = "host2"
    host2.vm.provision "shell", path: "scripts/host2.sh"
    host2.vm.network "private_network",  virtualbox__intnet: 'leaf1a-host1', auto_config: false
   end

  config.vm.define "gobgp" do |gobgp|
    gobgp.vm.box = "ubuntu/trusty64"
    gobgp.vm.hostname = "gobgp"
    gobgp.vm.provision "shell", path: "scripts/gobgp.sh"
    gobgp.vm.network "private_network", ip: "10.0.0.35",
    virtualbox__intnet: "MGT-10.0.0.0"
    gobgp.vm.network "private_network",  virtualbox__intnet: 'gobgp-spine1-', auto_config: false
    gobgp.vm.network "private_network",  virtualbox__intnet: 'gobgp-spine2-', auto_config: false
   end



end
