# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  
###

  config.vm.define :server1 do |server1|
    server1.vm.box = 'opscode-centos-6.6'
    config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
    server1.vm.network :private_network, ip: '10.0.0.50'
    server1.vm.hostname = 'server1'
    config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id,
                        '--cpus', '1',
                        '--memory', '512',]
        end
    #server1.berkshelf.enabled = true
    #server1..omnibus.chef_version = :latest
    server1.vm.provision :chef_solo do |chef|
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


