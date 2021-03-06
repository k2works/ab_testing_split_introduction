directory "/var/www" do
  owner 'root'
  group 'vagrant'
  mode '0775'
  recursive true
end

web_app node[:app_name] do
  passenger_module "#{node[:passenger][:module_path]}/mod_passenger.so"
  passenger_root_path "/usr/local/rvm/gems/ruby-#{node['rvm']['app_version']}@#{node['rvm']['app_gemset']}/gems/passenger-4.0.50"
  passenger_default_ruby "/usr/local/rvm/gems/ruby-#{node['rvm']['app_version']}@#{node['rvm']['app_gemset']}/wrappers/ruby"
  docroot "/var/www/#{node[:app_name]}/public"
  server_name "#{node[:app_name]}.#{node[:domain]}"
  rails_env node[:passenger][:rails_env]
end
