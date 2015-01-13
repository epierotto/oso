log_level                :info
log_location             STDOUT
node_name                'epierotto'
client_key               'C:/opt/work/oso/.chef/jlluis.pem'
validation_client_name   'chef-validator'
validation_key           'C:/opt/work/oso/.chef/chef-validator.pem'
chef_server_url          'https://10.0.0.50:443'
syntax_check_cache_path  'C:/opt/work/oso/.chef/syntax_check_cache'

  cookbook_path    ["cookbooks", "site-cookbooks", "berks-cookbooks"]
  node_path        "nodes"
  role_path        "roles"
  environment_path "environments"
  data_bag_path    "data_bags"
  #encrypted_data_bag_secret "data_bag_key"

  knife[:berkshelf_path] = "cookbooks"
#  knife[:editor] = "/usr/bin/vim"

