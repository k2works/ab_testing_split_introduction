include_attribute 'rvm-env::default'

default['rvm']['app_version'] = "2.1.1"
default['rvm']['app_gemset'] = "split-sample"

default['passenger']['module_path'] = "/usr/local/rvm/gems/ruby-#{node['rvm']['app_version']}@#{node['rvm']['app_gemset']}/gems/passenger-4.0.52/buildout/apache2"
default['passneger']['rails_env'] = "production"
