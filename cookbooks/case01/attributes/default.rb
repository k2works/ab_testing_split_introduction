default['app_name'] = "case01"
default['domain'] = "example.com"
default['passenger']['module_path'] = "/usr/local/rvm/gems/ruby-#{node['rvm']['app_version']}@#{node['rvm']['app_gemset']}/gems/passenger-4.0.50/buildout/apache2"
default['passneger']['rails_env'] = "production"
