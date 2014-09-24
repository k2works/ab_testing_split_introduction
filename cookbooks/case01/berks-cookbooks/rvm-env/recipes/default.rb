#
# Cookbook Name:: rvm-env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'yum-epel::default'
include_recipe 'rvm::vagrant'
include_recipe 'rvm::system'
