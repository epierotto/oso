# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
#  config.berkshelf.enabled = true
#  config.omnibus.chef_version = :latest
  
#### The chef server

  config.vm.define :server1 do |server1|
    
    server1.vm.box = 'opscode-centos-6.6'
    server1.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
    server1.vm.network :private_network, ip: '10.0.0.50'
    server1.vm.hostname = 'server1'
    server1.vm.provider :virtualbox do |vb|
	vb.customize [
		'modifyvm', :id,
                '--cpus', '1',
                '--memory', '1024',
		]
	end
    server1.berkshelf.enabled = true
    server1.omnibus.chef_version = :latest
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

#### The stress server
#  config.vm.define :server2 do |server2|
#   server2.vm.box = 'opscode-centos-6.6'
#   server2.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
#   server2.vm.network :private_network, :ip => '10.0.0.51'
#   server2.vm.hostname = 'server2'
#   server2.vm.provider :virtualbox do |vb|
#            # Give enough horsepower to build without taking all day.
#	vb.customize [
#		'modifyvm', :id,
#		'--memory', '1024',
#		'--cpus', '1',
#		]
#	end
#  end

end
