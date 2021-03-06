bash 'bootstrap' do
  code <<-EOC
    echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
  EOC
  command code
  action :run
end

#yumのfastestmirrorとアップデートをする。
yum_package "yum-fastestmirror" do
    action :install
end

execute "yum-update" do
    command "sudo yum -y update"
    action :run
end

%w{git}.each do |pkg|
  package pkg do
    action :install
  end
end
