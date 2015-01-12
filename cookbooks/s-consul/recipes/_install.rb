#
# Cookbook Name:: s-consul
# Recipe:: _install
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Create the consul user

user "consul" do
  comment "Consul User"
  uid 511
  home "/etc/consul.d"
  shell "/bin/bash"
  password "consul"
end

include_recipe 'ark::default'

# Ensure that some packages are installed, else intall them

%w[
       dnsmasq
       bind-utils
       unzip
   ].each do |item|
       package item  do
         action :install
       end
   end

# Configure DNS for Consul

service 'dnsmasq' do
  action :start
end

file '/etc/dnsmasq.conf' do
  content <<-eos
server=/consul/#{node.consul['ipaddress']}#8600
  eos
  notifies :reload, "service[dnsmasq]", :immediately
end

service "network" do
  action :nothing
end

file "/etc/dhcp/dhclient-eth0.conf" do
  content <<-eos
timeout 300;
prepend domain-name-servers #{node.consul['ipaddress']};
  eos
  notifies :restart, "service[network]"
end

### Install consul

cookbook_file "0.4.1_linux_amd64.zip" do
  path "/tmp/0.4.1_linux_amd64.zip"
  action :create_if_missing
end

ark 'consul' do
  path node['consul']['install_dir']
  url 'file:///tmp/0.4.1_linux_amd64.zip'
  action :dump
end

file File.join(node['consul']['install_dir'], 'consul') do
  mode '0755'
  action :touch
end
