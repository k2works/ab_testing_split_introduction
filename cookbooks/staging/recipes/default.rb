#
# Cookbook Name:: case01
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'staging::base'
include_recipe 'staging::app'
include_recipe 'staging::app_config'
