#
# Cookbook:: rootdevs
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

  docker_service 'default' do
    action [:create, :start]
  end
  
  docker_image 'rootdevs' do
    repo 'rootdevs/reliability-interview-container'
    tag '201805'
    action :pull
    notifies :redeploy, 'docker_container[rootdevs-sample]'
  end
  
  docker_container 'rootdevs-sample' do
    repo 'rootdevs/reliability-interview-container'
    tag '201805'
    port '4567:4567'
  end
