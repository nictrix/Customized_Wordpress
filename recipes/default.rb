#
# Cookbook Name:: Customized_Wordpress
# Recipe:: default
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

execute "update mysql root password" do
  command "/usr/bin/mysqladmin -u root -p'$$MNroot' password 'run'"
end

node.set['mysql']['server_root_password'] = 'run'
node.set['mysql']['server_repl_password'] = 'run'
node.set['mysql']['server_debian_password'] = 'run'
node.set['wordpress']['db']['database'] = "wpdatabase"
node.set['wordpress']['db']['user'] = "wpadmin"
node.set['wordpress']['db']['password'] = "wppass"

node.set['fqdn'] = "localhost"
node.set['wordpress']['server_aliases'] = ["localhost"]

case node["platform"]
when "debian", "ubuntu"
when "redhat", "centos", "fedora"
  package "make"
  package "gcc"
end

include_recipe "wordpress::default"

execute "update mysql root password" do
  command "/usr/bin/mysqladmin -u root -p'#{node['mysql']['server_root_password']}' password '$$MNroot'"
end

