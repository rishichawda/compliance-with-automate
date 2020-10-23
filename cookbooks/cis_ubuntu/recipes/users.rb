#
# Cookbook:: cis_ubuntu
# Recipe:: users
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# node.force_override['ohai']['optional_plugins'] = [
#   :Passwd,
# ]

users = node['etc']['passwd']
        .select { |user, _| user =~ /^(?!root|halt|sync|shutdown).*/ }
        .reject { |_, data| data['shell'] == '/sbin/nologin' }

users.each do |_, data|
  directory data['dir'] do
    recursive true
  end
end