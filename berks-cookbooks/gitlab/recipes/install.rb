#
# Cookbook Name:: gitlab
# Recipe:: install
#
# Copyright (C) 2015 Exequiel Pierotto <epierotto@abast.es>
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Download and install the package assigned to this node
pkg_source = node['gitlab']['package']['url']
pkg_path = File.join(Chef::Config[:file_cache_path], File.basename(pkg_source))

remote_file pkg_path do
  source pkg_source
end

# Run gitlab-ctl reconfigure if /etc/gitlab/gitlab.rb changed
execute "gitlab-ctl reconfigure" do
  action :nothing
end

if platform?("redhat", "centos", "fedora")
  # code for only redhat family systems.
  %w{openssh-server postfix cronie}.each do |pkg|
    package pkg do
      action :install
    end
  end

  service "postfix" do
    action [:enable, :start]
  end

  package "gitlab" do
    source pkg_path
    notifies :run, 'execute[gitlab-ctl reconfigure]'
  end

else

  raise "Unsupported package platform: #{node['platform_family']}"

end
