
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

bash "download_consului" do
  cwd "/tmp"
  code <<-EOH
  wget #{node['consul']['base_url']}/#{node['consul']['version']}_web_ui.zip --no-check-certificate
  EOH
  not_if {::File.exists?("/tmp/#{node['consul']['version']}_web_ui.zip") }
end

bash "install_consului" do
  cwd "/tmp"
  code <<-EOH
  unzip #{node['consul']['version']}_web_ui.zip -d #{node['consul']['ui_dir']}
  EOH
  not_if { ::File.exists?("#{node['consul']['ui_dir']}/dist/index.html") }
  notifies :reload, 'service[consul]'
end
