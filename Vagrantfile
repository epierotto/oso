# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  
##
  config.vm.define :chef_server do |chef_server|
    chef_server.vm.box = 'opscode-centos-5.10'
    chef_server.vm.network :private_network, ip: '33.33.33.50'
    chef_server.vm.hostname = 'chef-server'
    config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id,
                        '--cpus', '1',
                        '--memory', '512',]
        end
    #chef_server.berkshelf.enabled = true
    #chef_server..omnibus.chef_version = :latest
    chef_server.vm.provision :chef_solo do |chef|
        chef.json = {
      'chef-server' => {
        'version' => :latest
      }
    }

    chef.run_list = [
      "recipe[chef-server::default]"
    ]
        end
  end


