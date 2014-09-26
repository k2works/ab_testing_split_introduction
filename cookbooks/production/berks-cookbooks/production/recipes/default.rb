#
# Cookbook Name:: production
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'production::base'
include_recipe 'production::app'
include_recipe 'production::app_config'
