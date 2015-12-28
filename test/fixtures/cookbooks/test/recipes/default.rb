#
# Cookbook Name:: test
# Recipe:: default
#
# License:: Apache License, Version 2.0
#

cookbook_file '/tmp/hello.tgz'

untar_archive '/tmp/hello.tgz' do
  container_path '/tmp'
  creates 'hello.txt'
  nice 19
end
