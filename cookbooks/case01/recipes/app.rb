include_recipe 'apache2::default'

%w{curl-devel httpd-devel apr-devel apr-util-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

rvm_gem "passenger" do
  ruby_string "#{node['rvm']['app_version']}@#{node['rvm']['app_gemset']}"
  action      :install
end

rvm_shell "passenger_module" do
  ruby_string "#{node['rvm']['app_version']}@#{node['rvm']['app_gemset']}"
  code        "passenger-install-apache2-module --auto"
  creates node[:passenger][:module_path]
end
