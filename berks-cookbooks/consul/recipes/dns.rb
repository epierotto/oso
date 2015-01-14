#
# Copyright 2015 Exequiel Pierotto <epierotto@abast.es>
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

# Select the right network service name

case node["platform"]
  when "centos","redhat","fedora"
    service_name = "network"
    dhclient_conf = "/etc/dhcp/dhclient-eth0.conf"
  else
    service_name = "networking"
    dhclient_conf = "/etc/dhcp/dhclient.conf"
end

# Install dnsmasq

package 'dnsmasq' do
  action :install
end

service 'dnsmasq' do
  action :start
end

file '/etc/dnsmasq.conf' do
  content "server=/consul/127.0.0.1##{node[:consul][:ports][:dns]}"
  notifies :reload, "service[dnsmasq]", :immediately
end

service "#{service_name}" do
  action :nothing
end

file "#{dhclient_conf}" do
  content <<-eos
timeout 300;
prepend domain-name-servers 127.0.0.1;
  eos
  notifies :restart, "service[#{service_name}]"
end
