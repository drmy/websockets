#node[:deploy].each do |application, deploy|
#  template "/etc/nginx/nginx.conf" do
#    source "nginc.conf.erb"
#    mode '0644'
#    owner deploy[:user]
#    group deploy[:group]
#    variables(
#      :replSet => node[:mongodb][:config][:replSet],
#      :dbUser => deploy[:db_user],
#      :dbPassword => deploy[:db_password]
#    )
#  end
#end