
#
# Cookbook Name:: s-consul
# Recipe:: _install_ui
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "s-consul::_install"

# Download and install Consul ui

cookbook_file "0.4.1_web_ui.zip" do
  path "/tmp/0.4.1_web_ui.zip"
  action :create_if_missing
end

ark 'consul' do
  path node['consul']['ui_dir']
  url 'file:///tmp/0.4.1_web_ui.zip'
  action :put
  notifies :reload, 'service[consul]'
end

#bash "install_consului" do
#  cwd "/tmp"
#  code <<-EOH
#  unzip #{node['consul']['version']}_web_ui.zip -d #{node['consul']['ui_dir']}
#  EOH
#  not_if { ::File.exists?("#{node['consul']['ui_dir']}/dist/index.html") }
#  notifies :reload, 'service[consul]'
#end
