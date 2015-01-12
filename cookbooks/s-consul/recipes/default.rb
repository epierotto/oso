#
# Cookbook Name:: s-consul
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "s-consul::_install"

include_recipe "consul::_service"
